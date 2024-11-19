import 'package:dmk/main.dart';
import 'package:dmk/screens/home_page.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
        title: DropdownButton<String>(
          value: 'รายการสั่งซื้อล่าสุด',
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          style: const TextStyle(color: Colors.black, fontSize: 18),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          items: <String>['รายการสั่งซื้อล่าสุด', 'รายการอื่นๆ']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle dropdown change
          },
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.edit, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'รายการสั่งซื้อล่าสุด',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            // You can add additional content here as needed
            Center(
              child: Text(
                'ไม่มีรายการที่บันทึก',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
