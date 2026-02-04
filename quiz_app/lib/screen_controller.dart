
import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
// Import the questions for shuffling. 
import 'package:quiz_app/data/questions.dart';
// Import results screen
import 'package:quiz_app/results_screen.dart'; // Import your new results screen

enum Screen{start, question, results}

class ScreenController extends StatefulWidget {
  const ScreenController ({required this.nextScreen, super.key});
    
  final Screen nextScreen;
  
  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  
  // Promises that by the time thid variable is called there will be a value
  late Screen currScreen;

  List<String> selectedAnswers = [];
  
  // Add a list that contains the shuffled questions
  List<QuizQuestion> shuffledQuestions = [];
  
  // Set the currScreen once the app is started
  @override
  void initState() {
    super.initState();
    currScreen = widget.nextScreen;
  }

  void switchScreen() {
    setState(() {
      if (currScreen == Screen.start) {
        shuffledQuestions = questions.toList()..shuffle(); 
        currScreen = Screen.question;
      }
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    // Check to see if all questions have been finished
    if (selectedAnswers.length == shuffledQuestions.length) {
      setState((){
        // Then go to the results screen
        currScreen = Screen.results; 
      });
    }
  }
    // Restart the quiz when the button is pressed
  void restartQuiz() {
    setState(() {
      selectedAnswers = []; // clear the previous user choices
      currScreen = Screen.start; // Go back to the very first screen
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (currScreen == Screen.start) {
      currScreen == Screen.question;
      return StartScreen(switchScreen);
    }

    if (currScreen == Screen.question) {
      return QuestionScreen(chooseAnswer, shuffledQuestions);
    }
    
    // Results Screen
    if (currScreen == Screen.results) {
      return ResultsScreen(
        chosenAnswers: selectedAnswers,
        shuffledQuestions: shuffledQuestions,
         // Pass the restart function 
        onRestart: restartQuiz,
      );
    }
    
    return const Placeholder();
    }
}