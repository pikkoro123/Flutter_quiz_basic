import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 7},
        {'text': 'Yellow', 'score': 4},
        {'text': 'Rainbow', 'score': 1},
      ]
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 7},
        {'text': 'Liger', 'score': 4},
        {'text': 'Bird', 'score': 1},
      ]
    },
    {
      'questionText': 'What\s your favorite vehicle?',
      'answers': [
        {'text': 'Car', 'score': 10},
        {'text': 'Bike', 'score': 7},
        {'text': 'Plane', 'score': 4},
        {'text': 'Train', 'score': 1},
      ]
    },
    {
      'questionText': 'What\s your favorite boob\'s size?',
      'answers': [
        {'text': '28', 'score': 1},
        {'text': '30', 'score': 1},
        {'text': '32', 'score': 1},
        {'text': '34', 'score': 1},
      ]
    },
  ];

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
    print(_questionIndex);
    print('score = ' + _totalScore.toString());
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more question!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // <Widget>[]
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                selectHandler: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
