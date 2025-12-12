import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งเตือน'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE8D5F9),
                child: Icon(
                  index % 2 == 0 ? Icons.gavel : Icons.notifications,
                  color: const Color(0xFF9C27B0),
                ),
              ),
              title: Text(
                index % 2 == 0 ? 'การประมูลใหม่' : 'แจ้งเตือนระบบ',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'รายละเอียดการแจ้งเตือน ${index + 1}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              trailing: Text(
                '${index + 1} ชม.',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}
