import 'package:flutter/material.dart';

import 'story_brain.dart';

// Lab 7 - Destini
// Huynh Quoc Khanh - 23IT124
void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();

  Widget buildChoiceButton(String text, Color color, int choiceNumber) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: () {
        setState(() {
          storyBrain.nextStory(choiceNumber);
        });
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      storyBrain.getStory(),
                      style: const TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: buildChoiceButton(
                  storyBrain.getChoice1(),
                  Colors.red,
                  1,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: buildChoiceButton(
                    storyBrain.getChoice2(),
                    Colors.blue,
                    2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
