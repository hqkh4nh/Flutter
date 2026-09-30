import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// Lab 5 - Xylophone
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final AudioPlayer player = AudioPlayer();

  static const List<Color> keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  Future<void> playSound(int noteNumber) async {
    await player.stop(); // stop the previous note so sounds don't overlap
    await player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () => playSound(noteNumber),
        child: Text(
          'Note $noteNumber',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < keyColors.length; i++)
              buildKey(color: keyColors[i], noteNumber: i + 1),
          ],
        ),
      ),
    );
  }
}
