import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // properties
  final VoidCallback selectHandler;
  final String answer;
  final Color color;
  final Color textColor;

  // constructor
  Answer(this.selectHandler, this.answer, this.color, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: RaisedButton(
        child: Text(
          answer,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
        color: color,
        onPressed: selectHandler,
      ),
    );
  }
}
