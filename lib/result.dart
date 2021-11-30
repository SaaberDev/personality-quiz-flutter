import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // properties
  final int score;
  final VoidCallback resetHandler;

  // constructor
  Result(this.score, this.resetHandler);

  // getters
  String get resultPhrase {
    var resultText = '';
    if (score <= 18) {
      resultText = 'You are cool !';
    } else if (score <= 12) {
      resultText = 'Hum, You are noticeable !';
    } else if (score <= 6) {
      resultText = 'You are an average guy !';
    } else if (score <= 4) {
      resultText = 'You are bad !';
    } else {
      resultText = 'You are awesome !';
    }

    return resultText;
  }

  Color getColor() {
    Color color = Colors.black;
    if (score <= 18) {
      color = Colors.cyan;
    } else if (score <= 12) {
      color = Colors.yellow;
    } else if (score <= 6) {
      color = Colors.teal;
    } else if (score <= 4) {
      color = Colors.white10;
    } else {
      color = Colors.deepOrange;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // result
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: getColor()
            ),
            textAlign: TextAlign.center,
          ),

          // reset icon
          IconButton(
            icon: const Icon(Icons.refresh),
            iconSize: 40.0,
            tooltip: 'Refresh',
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
