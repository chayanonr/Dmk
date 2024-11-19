import 'package:dmk/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dmk/screens/login_page.dart';

class UserProfilePage extends StatelessWidget {
  final User? user;

  const UserProfilePage({super.key, required this.user});

  Future<void> _deleteAccount(BuildContext context) async {
    try {
      await user?.delete();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  MainPage()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete account: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(user?.email ?? 'User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.account_circle, size: 80, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Text(
                  user?.email ?? 'User Email',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>  MainPage()),
                      (route) => false,
                    );
                  },
                  child: const Text('ออกจากระบบ'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildUserOptionCard(Icons.history, 'ประวัติการสั่งซื้อ'),
            _buildUserOptionCard(Icons.payment, 'รายการชำระเงินแล้ว'),
            _buildUserOptionCard(Icons.favorite, 'สินค้าที่ชื่นชอบ'),
            _buildUserOptionCard(Icons.store, 'ร้านค้าที่ชื่นชอบ'),
            _buildUserOptionCard(Icons.person, 'จัดการข้อมูลส่วนตัว'),
            _buildUserOptionCard(Icons.location_on, 'จัดการที่อยู่จัดส่ง'),
            _buildUserOptionCard(Icons.star, 'เรทติ้ง'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                await _deleteAccount(context);
              },
              child: const Text(
                'Account deletion',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserOptionCard(IconData icon, String title) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.red, size: 40),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: () {
          // Handle navigation or action here
        },
      ),
    );
  }
}
