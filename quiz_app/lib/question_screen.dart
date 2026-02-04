import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  // Add shuffled list of questions to the Question screen
  const QuestionScreen(this.onSelectAnswer, this.questions, {super.key});

  final void Function(String answer) onSelectAnswer;

  // Shuffled list of questions
  final List<QuizQuestion> questions; 

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  int questionIndex = 0; 

  // Link the randomized questions with their answers 
  List<String> currentShuffledAnswers = []; 

  @override
  void initState() {
    super.initState();
    // Shuffle the first questions answers
    _shuffleCurrentAnswers();
  }
  
  void _shuffleCurrentAnswers(){
    // Shuffle the answers once per question each
    currentShuffledAnswers = widget.questions[questionIndex].shuffledAnswers;
  }


  void answerQuestion(String answer){
    widget.onSelectAnswer(answer);

    setState(() {
      if (questionIndex < widget.questions.length - 1) {
          questionIndex++;
          _shuffleCurrentAnswers();   // Now shuffle for the next question
      }
    });
  }

  @override
  Widget build(context) {
    // Use the list passed into the widget
    final currentQuestion = widget.questions[questionIndex];

    return Center(
      child: Column(
        children: [
          Text('Question ${questionIndex + 1}'),
          // Use the text for the current shuffled question
          Text(currentQuestion.text),
          const SizedBox(height: 30),
          // For answer in the index of questions of all the different shuffled answers 
          for (String ans in currentShuffledAnswers)
            ElevatedButton(
              onPressed: () { answerQuestion(ans); }, 
            child: Text(ans),
            )
        ],
      ),
    );
  }
}
