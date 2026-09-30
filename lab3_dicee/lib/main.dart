import 'dart:math';

import 'package:flutter/material.dart';

// Lab 3 - Dicee
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const DiceeApp());
}

class DiceeApp extends StatelessWidget {
  const DiceeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red.shade900,
          foregroundColor: Colors.white,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final _random = Random();
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // roll both dice every time one is tapped
  void rollDice() {
    setState(() {
      leftDiceNumber = _random.nextInt(6) + 1;
      rightDiceNumber = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: rollDice,
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: rollDice,
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'Total: ${leftDiceNumber + rightDiceNumber}',
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
