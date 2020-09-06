import 'package:flutter/material.dart';
import 'package:quizzapp/result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'What is your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 12},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 7}
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 11}
      ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 12},
        {'text': 'Max', 'score': 14},
        {'text': 'Max', 'score': 15}
      ]
    },
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < questions.length) {
      print("We have more questions!!!!");
    } else {
      print("No more questions");
    }
  }

  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first bar'),
          ),
          body: _questionIndex < questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions)
              : Result(this._totalScore, _resetQuiz)),
    );
  }
}
