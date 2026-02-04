import 'package:quiz_app/screen_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // Tip: If you want a full-screen gradient, consider removing the AppBar 
        // or making it transparent so it doesn't "cut off" the top of your colors.
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('Quiz App'),
        ),
        body: Container(
          width: double.infinity,  // Ensures gradient covers width
          height: double.infinity, // Ensures gradient covers height
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ScreenController(nextScreen: Screen.start),
        ),
      ),
    ),
  );
}