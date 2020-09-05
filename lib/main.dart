import 'package:flutter/material.dart';
import 'question.dart';

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
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print("Answer chosen :");
  }

  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What is your favorite color ?',
      'What is youtr favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first bar'),
          ),
          body: Column(children: [
            Question(questions.elementAt(_questionIndex)),
            RaisedButton(child: Text('Answer 1 '), onPressed: _answerQuestion),
            RaisedButton(
              child: Text('Answer 2 '),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3 '),
              onPressed: _answerQuestion,
            ),
          ])),
    );
  }
}
