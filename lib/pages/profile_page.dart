import 'package:flutter/material.dart';
import 'package:auction_ui/widgets/page_transitions.dart';
import 'package:auction_ui/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE8D5F9),
              child: Icon(Icons.person, size: 50, color: Color(0xFF9C27B0)),
            ),
            const SizedBox(height: 16),
            const Text(
              'ผู้ใช้งาน',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '+66 XX XXX XXXX',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 32),
            _buildMenuItem(Icons.person_outline, 'แก้ไขโปรไฟล์', () {}),
            _buildMenuItem(Icons.settings_outlined, 'ตั้งค่า', () {}),
            _buildMenuItem(Icons.help_outline, 'ช่วยเหลือ', () {}),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    FadeScalePageRoute(page: const LoginPage()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('ออกจากระบบ'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF9C27B0)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
