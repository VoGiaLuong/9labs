// lib/main.dart
import 'package:flutter/material.dart';

import 'QuestionBank.dart';

void main() => runApp(QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0; // Biến theo dõi câu hỏi hiện tại
  int score = 0;
  List<Icon> scoreKeeper = [];

  QuestionBank questionBank = QuestionBank();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questionBank.getQuestionBank()[questionIndex].questionAnswer;

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionIndex < questionBank.getQuestionBank().length - 1) {
        questionIndex++;
      } else {
        questionIndex = 0;
        scoreKeeper.clear();
        score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzler'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Question: ${questionBank.getQuestionBank()[questionIndex].questionText}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => checkAnswer(true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('True'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('False'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
