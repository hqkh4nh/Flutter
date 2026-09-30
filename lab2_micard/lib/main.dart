import 'package:flutter/material.dart';

// Lab 2 - MiCard
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const MiCardApp());
}

class MiCardApp extends StatelessWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiCard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      'QK',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Huynh Quoc Khanh',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IT STUDENT - VKU',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.teal.shade100,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(color: Colors.teal.shade100),
                  ),
                  const InfoCard(
                    icon: Icons.badge,
                    text: 'Student ID: 23IT124',
                  ),
                  const InfoCard(icon: Icons.school, text: 'Class: 23GIT'),
                  const InfoCard(
                    icon: Icons.email,
                    text: 'khanhhq.23it@vku.udn.vn',
                  ),
                  const InfoCard(
                    icon: Icons.location_on,
                    text: '470 Tran Dai Nghia, Da Nang',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          text,
          style: TextStyle(color: Colors.teal.shade900, fontSize: 18.0),
        ),
      ),
    );
  }
}
