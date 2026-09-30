import 'dart:math';

import 'package:flutter/material.dart';

// Lab 4 - Magic 8 Ball
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Ask Me Anything'),
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.white,
        ),
        body: const BallPage(),
      ),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  final _random = Random();
  int ballNumber = 1;

  void askBall() {
    setState(() {
      ballNumber = _random.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Think of a question, then tap the ball',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: askBall,
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ],
    );
  }
}
