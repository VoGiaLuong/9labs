import 'question.dart';

class QuestionBank {
  List<Question> _questionBank = [
    Question(questionText: 'Is Flutter a programming language?', questionAnswer: false),
    Question(questionText: 'Is Dart used to write Flutter apps?', questionAnswer: true),
    Question(questionText: 'Is Flutter developed by Microsoft?', questionAnswer: false),
  ];

  List<Question> getQuestionBank() {
    return _questionBank;
  }
}
