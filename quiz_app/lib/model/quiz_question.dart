class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text; 
  final List <String> answers;


// Deal with shuffling the answers of the quiz questions
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  // Correct answer is always answer
  String get correctAnswer {return answers[0];}
  
}