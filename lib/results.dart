import 'package:flutter/material.dart';
import 'main.dart';
class Result extends StatelessWidget {
  final Function reset;
  final int resultScore;
  String get resultPhrase{
    String resultText;
    if(resultScore==50){
      resultText="You're Ghazi";
    }
    else if(resultScore>=30){
      resultText="You're Warrior";

    }
    if(resultScore<30){
      resultText="You Should know more about your history";
    }
    return resultText;
  }
  const Result(this.reset,this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "you got $resultScore",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: b),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: b),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              onPressed: reset,
              child: Text('Restart App',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.blue)))
        ],
      ),
    );
  }
}
