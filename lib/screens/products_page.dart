import 'package:dmk/main.dart';
import 'package:dmk/screens/home_page.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('สินค้าต่อราคา'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle user profile action
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(50.0), // Set height for the TabBar container
          child: Container(
            color: Colors.white, // Background color of the TabBar remains white
            child: TabBar(
              controller: _tabController,
              // Explicitly set the indicator color and thickness
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.red, // Set the underline color to red
                  width: 3.0, // Set the thickness of the underline
                ),
              ),
              labelColor: Colors.red, // Text color for the selected tab
              unselectedLabelColor:
                  Colors.black, // Text color for unselected tabs
              tabs: const [
                Tab(text: 'เรียงตามเวลา'),
                Tab(text: 'รวมแต่ละร้านค้า'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text('เรียงตามเวลา - Content goes here'),
          ),
          Center(
            child: Text('รวมแต่ละร้านค้า - Content goes here'),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                ),
                const Text('เลือกทั้งหมด'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Updated parameter
                  ),
                  child: const Text('ยกเลิก'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle add to cart action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Updated parameter
                  ),
                  child: const Text('เพิ่มในตะกร้า'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
