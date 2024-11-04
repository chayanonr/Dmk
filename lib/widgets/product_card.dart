// products_page.dart
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Page'),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Products List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ProductCard(
            productName: 'Garlic',
            productImage: 'assets/garlic.jpg',
            productPrice: '83 THB',
            productQuantity: '1 kg',
          ),
          ProductCard(
            productName: 'Chinese Spinach',
            productImage: 'assets/chinese_spinach.jpg',
            productPrice: '140 THB',
            productQuantity: '5 kg',
          ),
          ProductCard(
            productName: 'Green Onion',
            productImage: 'assets/green_onion.jpg',
            productPrice: '130 THB',
            productQuantity: '1 kg',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productQuantity;

  const ProductCard({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100, // Adjusted the height to reduce the image size
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage(productImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  productQuantity,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  productPrice,
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
