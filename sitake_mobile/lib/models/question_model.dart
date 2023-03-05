class Question {
  final String question;
  List<Answer> answers = [];

  Question({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String answer;
  final bool isTrue;

  Answer({required this.answer, required this.isTrue});
}
