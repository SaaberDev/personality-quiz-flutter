import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  // reset quiz
  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // answer state
  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  // question array
  final _questions = const [
    {
      'question': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 8, 'color': Colors.black, 'textColor': Colors.white},
        {'text': 'Red', 'score': 6, 'color': Colors.red, 'textColor': Colors.white},
        {'text': 'White', 'score': 2, 'color': Colors.white, 'textColor': Colors.black},
        {'text': 'Green', 'score': 4, 'color': Colors.green, 'textColor': Colors.white},
      ],
    },
    {
      'question': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Tiger', 'score': 4, 'color': Colors.deepOrange, 'textColor': Colors.white},
        {'text': 'Cat', 'score': 2, 'color': Colors.brown, 'textColor': Colors.white},
        {'text': 'Lion', 'score': 8, 'color': Colors.red, 'textColor': Colors.white},
        {'text': 'Dog', 'score': 6, 'color': Colors.black, 'textColor': Colors.white},
      ],
    },
    {
      'question': 'Where are you from ?',
      'answers': [
        {'text': 'Bangladesh', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
        {'text': 'India', 'score': 4, 'color': Colors.blue, 'textColor': Colors.white},
        {'text': 'United States', 'score': 2, 'color': Colors.pinkAccent, 'textColor': Colors.white},
        {'text': 'United Kingdom', 'score': 6, 'color': Colors.teal, 'textColor': Colors.white},
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
          centerTitle: true,
        ),

        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset), // else result
      ),
    );
  }
}
