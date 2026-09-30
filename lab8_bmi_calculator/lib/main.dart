import 'package:flutter/material.dart';

import 'screens/input_page.dart';

// Lab 8 - BMI Calculator
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      ),
      home: const InputPage(),
    );
  }
}
