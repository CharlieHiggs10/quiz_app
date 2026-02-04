// In Dart variables that are final cannot be reassigned a new value.
// In dart, const means the value is known at compile time 

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor:.67, // image is 2/3 width of screen
            child: Image.asset('assets/images/start-screen.png')
            ),
            const SizedBox(height: 30,),
            ElevatedButton.icon(
              onPressed: startQuiz, 
              label:Text('Start Quiz',
              style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.arrow_right_alt),
            ),
            
        ],
      ),
    );
  }
}