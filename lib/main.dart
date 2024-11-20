import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/cart_page.dart';
import 'screens/chat_page.dart';
import 'screens/home_page.dart';
import 'screens/products_page.dart';
import 'screens/saved_page.dart';
import 'screens/user_page.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAeRLC8uBc1lP3Vxoy755bKvo1VfTf-ZNk",
        authDomain: "dmkp-df659.firebaseapp.com",
        projectId: "dmkp-df659",
        storageBucket: "dmkp-df659.appspot.com",
        messagingSenderId: "986627706400",
        appId: "1:986627706400:android:af172d769e1e5034e3b645",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DMK',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  String _currentMenu = 'main';

// _currentIndex assign
  final List<Widget> _pages = [
    HomePage(),
    ChatPage(),
    ProductsPage(),
    CartPage(),
    SavedPage(),
  ];

  void _onTabTapped(int index) {
    User? user = FirebaseAuth.instance.currentUser;

    if ((index == 1 || index == 2 || index == 3 || index == 4) &&
        user == null) {
      _navigateToLoginPage();
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(user),
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar(User? user) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา',
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black),
            onPressed: () {
              if (user == null) {
                _navigateToLoginPage();
              } else {
                setState(() {
                  _currentIndex = 1;
                });
              }
            },
          ),
          user == null
              ? TextButton(
                  onPressed: _navigateToLoginPage,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfilePage(user: user),
                      ),
                    );
                  },
                ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'หน้าแรก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'พูดคุย',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'สินค้า',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'ตะกร้าสินค้า',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'บันทึก',
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: _buildDrawerItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    if (_currentMenu == 'main') {
      return [
        ListTile(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const Divider(color: Colors.white, thickness: 1.0),
        ..._mainMenuItems(),
      ];
    } else {
      return [
        ListTile(
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            'กลับ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            setState(() {
              _currentMenu = 'main';
            });
          },
        ),
        const Divider(color: Colors.white, thickness: 1.0),
        ..._buildSubMenuItems(),
      ];
    }
  }

  List<Widget> _mainMenuItems() {
    return [
      _drawerItem('ผัก', 'vegetables'),
      _drawerItem('ผลไม้', 'fruits'),
      _drawerItem('เนื้อสัตว์ เต้าหู้', 'meat_tofu'),
      _drawerItem('สินค้าแช่แข็ง', 'frozen_goods'),
      _drawerItem('สินค้าแปรรูป', 'processed_goods'),
      _drawerItem('เครื่องปรุงและน้ำมัน', 'condiments_oil'),
      _drawerItem('สินค้ามักดอง', 'pickled_goods'),
      _drawerItem('บรรจุภัณฑ์และอื่น ๆ', 'packaging'),
      _drawerItem('ความรู้ดีดี', 'knowledge'),
    ];
  }

  ListTile _drawerItem(String title, String menu) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        setState(() {
          _currentMenu = menu;
        });
      },
    );
  }

  List<Widget> _buildSubMenuItems() {
    switch (_currentMenu) {
      case 'vegetables':
        return _subMenuItems(['ผักใบเขียว', 'ผักผล', 'ผักราก']);
      case 'fruits':
        return _subMenuItems(['ผลไม้ตามฤดูกาล', 'ผลไม้นำเข้า']);
      case 'meat_tofu':
        return _subMenuItems(['เนื้อไก่', 'เนื้อวัว', 'เต้าหู้']);
      case 'frozen_goods':
        return _subMenuItems(['ผักแช่แข็ง', 'ผลไม้แช่แข็ง']);
      case 'processed_goods':
        return _subMenuItems(['อาหารกระป๋อง', 'อาหารแปรรูป']);
      case 'condiments_oil':
        return _subMenuItems(['น้ำมันพืช', 'เครื่องปรุง']);
      case 'pickled_goods':
        return _subMenuItems(['ผักดอง', 'ผลไม้ดอง']);
      case 'packaging':
        return _subMenuItems(['บรรจุภัณฑ์', 'ภาชนะใส่อาหาร']);
      case 'knowledge':
        return _subMenuItems(
            ['เคล็ดลับการทำอาหาร', 'ความรู้เกี่ยวกับโภชนาการ']);
      default:
        return [];
    }
  }

  List<Widget> _subMenuItems(List<String> items) {
    return items
        .map((item) => ListTile(
              title: Text(item, style: const TextStyle(color: Colors.white)),
              onTap: () {
                // Handle navigation
              },
            ))
        .toList();
  }
}
