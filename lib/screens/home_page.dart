import 'package:flutter/material.dart';
import 'package:dmk/screens/chat_page.dart';
import 'package:dmk/screens/goods_page.dart'; // Assuming there's a detailed page for each product

class Product {
  final String title;
  final String price;
  final String imagePath;

  Product({required this.title, required this.price, required this.imagePath});
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Product> products = [
    Product(
        title: 'กระเทียม',
        price: '฿100',
        imagePath: 'assets/images/garlic.jpg'),
    Product(
        title: 'ต้นหอม',
        price: '฿120',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'พริก',
        price: '฿80',
        imagePath: 'assets/images/chinese_spinach.jpg'),
    Product(
        title: 'แตงกวา',
        price: '฿50',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'มะเขือเทศ',
        price: '฿60',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'ขิง', price: '฿90', imagePath: 'assets/images/green_onion.jpg'),
  ];

  final List<Product> premiumProducts = [
    Product(
        title: 'แครอท', price: '฿150', imagePath: 'assets/images/basil.jpg'),
    Product(
        title: 'บร็อคโคลี',
        price: '฿180',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'องุ่น',
        price: '฿200',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'แอปเปิ้ล',
        price: '฿220',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'ส้ม',
        price: '฿160',
        imagePath: 'assets/images/green_onion.jpg'),
    Product(
        title: 'สตรอเบอร์รี่',
        price: '฿250',
        imagePath: 'assets/images/green_onion.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    borderSide: const BorderSide(
                        color: Colors
                            .black), // Black border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Colors.black), // Black border color when focused
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                // Navigate to Chat Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // Handle user icon action
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.arrow_back, color: Colors.white),
                title:
                    const Text('Close', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('ผัก', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle navigation
                },
              ),
              // Other list items...
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
              child: Image.network(
                'https://via.placeholder.com/600x150',
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
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio:
                    1, // Adjust aspect ratio for smaller containers
              ),
              itemCount: products.length,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
              shrinkWrap:
                  true, // Let the GridView take only the required height
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoodsDetailPage(
                            product:
                                product), // Navigate to product detail page
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.grey[
                        200], // Set the card background color similar to the page
                    elevation: 0, // Set elevation to 0 to keep a simple look
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            maxLines: 1, // Limit title to one line
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis if text overflows
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.price,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ราคาปัจจุบัน 1 กิโลกรัม / ถุง', // Additional information line
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
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
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1, // Adjusted aspect ratio for more text space
              ),
              itemCount: products.length,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
              shrinkWrap:
                  true, // Let the GridView take only the required height
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoodsDetailPage(
                            product:
                                product), // Navigate to product detail page
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.grey[
                        200], // Set the card background color similar to the page
                    elevation: 0, // Set elevation to 0 to keep a simple look
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            maxLines: 1, // Limit title to one line
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis if text overflows
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.price,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ราคาปัจจุบัน 1 กิโลกรัม / ถุง', // Additional information line
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 10,
                            ),
                            maxLines: 1, // Limit to one line
                            overflow: TextOverflow
                                .ellipsis, // Ellipsis if the text overflows
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.local_shipping,
                                  size: 16, color: Colors.grey[700]),
                              const SizedBox(width: 4),
                              Text(
                                'สินค้าพร้อมจัดส่ง',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Product Detail Page
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
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
