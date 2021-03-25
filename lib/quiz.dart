import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/questions.dart';

class  Quiz extends StatelessWidget {
final List<Map<String, Object>>question;
final int questionIndex;
final Function answerQuestion;

Quiz(this.question,this.questionIndex,this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[questionIndex]['questionText']),
        ...(question[questionIndex]['answers']as List<Map<String, Object>>).map((answer){
    return Answer(answer['text'],()=>answerQuestion(answer['Score']));
    }).toList(),
      ],
    );
  }
}
