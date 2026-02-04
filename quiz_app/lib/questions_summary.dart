import 'package:flutter/material.dart';

// Sized box with a SingleChildScroll view for the summary
class QuestionsSummary extends StatelessWidget{

  const QuestionsSummary(this.summaryData, {super.key});

  // List of maps containing all the info 
  final List<Map<String, Object>> summaryData;

  Widget build (BuildContext context) {
    return SizedBox(
      // Standarized height for scrollview to work effectively
      height: 400,
      child: SingleChildScrollView(
        child: Column (
          children: 
            summaryData.map((data){
              // turn each Map into a Summary Item Widget
              return SummaryItem(data);
            }).toList(),
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget{

  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    // Check to see if the answer is correct (Deciding on if it is right -> green,
    // or wrong -> red)
    final isCorrect = itemData['user_answer'] == itemData['correct_answer'];

    //Use a row to establish the question number on the left and text on the right
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
      children: [
        // The left is the Question Number in a circle. It wll be colored in green or red for correctness
        CircleAvatar(
          backgroundColor: isCorrect ? Colors.green: Colors.red,
          radius: 15,
          child: Text(
            ((itemData['question_index'] as int) + 1).toString(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),

    const SizedBox(width: 20),
        // The right side is for the Text Data
        // Expanded tells the Column to take up the remaining width of the Row 
        //so text can wrap properly.
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left-align text
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              // Display theusers answer (red = wrong, green = right)
              Text('Your Answer: ${itemData['user_answer']}',
                  style: TextStyle(color: isCorrect ? Colors.green : Colors.red)),
              // Display the correct answer (which will always be green)
              Text('Correct Answer: ${itemData['correct_answer']}',
                  style: const TextStyle(color: Colors.green)),
              //Sizedbox for some spacing between items
              const SizedBox(height: 20), 
            ],
          ),
        ),
      ],
    );
  }
}