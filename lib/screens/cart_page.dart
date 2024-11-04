import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('ตะกร้าสินค้ารอชำระเงิน'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle user profile action
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Handle chat action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'ไม่มีสินค้าในตะกร้า', // Placeholder when no items in cart
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          const Divider(), // Horizontal line
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'จำนวนสินค้ารวมทั้งหมด: 0 หน่วย',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'ยอดรวม: 0.0 บาท',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.grey[300], // Text color when disabled
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'ชำระค่าสินค้า',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
