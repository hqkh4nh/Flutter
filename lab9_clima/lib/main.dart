import 'package:flutter/material.dart';

import 'screens/loading_screen.dart';

// Lab 9 - Clima
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const ClimaApp());
}

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
