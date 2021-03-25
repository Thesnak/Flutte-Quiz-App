import 'package:flutter/material.dart';
import 'main.dart';
class Answer extends StatelessWidget {
  final String answerText;
  final Function click;

  const Answer( this.answerText, this.click);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       child: RaisedButton(
         color: Colors.red,
         child: Text(answerText,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: b)),
         onPressed: click,
       ),
    );
  }
}
