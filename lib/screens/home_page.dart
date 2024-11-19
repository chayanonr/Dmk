import 'package:flutter/material.dart';
import 'package:dmk/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dmk/screens/login_page.dart';

class Product {
  final String title;
  final String price;
  final String imagePath;

  Product({required this.title, required this.price, required this.imagePath});
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;
  final List<Product> products = [
    Product(title: 'กระเทียม', price: '฿100', imagePath: 'assets/images/garlic.jpg'),
    Product(title: 'ต้นหอม', price: '฿120', imagePath: 'assets/images/green_onion.jpg'),
    Product(title: 'พริก', price: '฿80', imagePath: 'assets/images/chilli.jpg'),
    Product(title: 'แตงกวา', price: '฿50', imagePath: 'assets/images/cucumber.jpg'),
    Product(title: 'มะเขือเทศ', price: '฿60', imagePath: 'assets/images/tomato.jpg'),
    Product(title: 'ขิง', price: '฿90', imagePath: 'assets/images/ginger.jpg'),
  ];

  final List<Product> premiumProducts = [
    Product(title: 'แครอท', price: '฿150', imagePath: 'assets/images/carrot.jpg'),
    Product(title: 'บร็อคโคลี', price: '฿180', imagePath: 'assets/images/broccoli.jpg'),
    Product(title: 'องุ่น', price: '฿200', imagePath: 'assets/images/grape.jpg'),
    Product(title: 'แอปเปิ้ล', price: '฿220', imagePath: 'assets/images/apple.jpg'),
    Product(title: 'ส้ม', price: '฿160', imagePath: 'assets/images/orange.jpg'),
    Product(title: 'สตรอเบอร์รี่', price: '฿250', imagePath: 'assets/images/strawberry.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? _buildHomePageContent(context) : const ChatPage(),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                'ยินดีต้อนรับเข้าสู่ ตลาดสี่มุมเมืองออนไลน์',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
              child: Image.asset(
                'assets/images/banner2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'สินค้าสำหรับคุณโดยเฉพาะ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _buildProductGrid(products, context),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'สินค้าพรีเมี่ยม ขายส่งยกลัง',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _buildProductGrid(premiumProducts, context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<Product> productList, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Set crossAxisCount to 3 for 3 columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8, // Adjust aspect ratio to make items less tall
      ),
      itemCount: productList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final product = productList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoodsDetailPage(product: product),
              ),
            );
          },
          child: Card(
            color: Colors.grey[200],
            elevation: 2, // Adds a slight shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Slightly larger border radius
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0), // Smaller padding for a more compact card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.0, // Makes the image a square shape
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GoodsDetailPage extends StatelessWidget {
  final Product product;

  const GoodsDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(product.imagePath),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(fontSize: 40, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
