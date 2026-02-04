import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/model/quiz_question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.shuffledQuestions,
    required this.onRestart,
  });

  // Store the data of the variables from the ScreenController
  final List<String> chosenAnswers;
  final List<QuizQuestion> shuffledQuestions;
  final void Function() onRestart;

  // getter that centralizes the aggregate data so the Summary widget can 
  // read it in effectively.
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    // Loop through each answer to have set correct and incorrect answers for each question 
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': shuffledQuestions[i].text,
        // the original index 0 is always the correct answer
        'correct_answer': shuffledQuestions[i].answers[0], 
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // See how mant total questions based on the shuffled list length
    final numTotalQuestions = shuffledQuestions.length;
    // See how many answers in the quiz were correct by filtering the summaryData list
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    // Use a SizedBox to make sure that the screen takes up the full width 
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // Center the column vertically
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            // Requirement 3: Show how many were correct
            Text(
              // Display the score numbered
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            
            // Wrap the summary in Expanded so it takes up the available middle space
            // Also allows for scrolling
            Expanded(
              child: QuestionsSummary(summaryData),
            ),
            
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}