import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/results.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
Color w = Colors.white;
Color b = Colors.black;
class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  int num0 = 0;
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  int num4 = 0;

  bool isSwitched = false;

  void answerQuestion(int score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2)
      num2 = score;
    else if (_questionIndex == 3)
      num3 = score;
    else if (_questionIndex == 4) num4 = score;
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Who is the conqueror of Constantinople?',
      'answers': [
        {'text': 'Khaled Ibn El-Waleed', 'Score': 0},
        {'text': 'Mohamed El-Fatih', 'Score': 10},
        {'text': 'Alp Arslan', 'Score': 0},
        {'text': 'Saad ibn Aby-Waqas', 'Score': 0},
        {'text': 'Mousa Ibn Nouser', 'Score': 0},
      ]
    },
    {
      'questionText':
          'Who is the leader of the Muslims in the battle of Malazkard?',
      'answers': [
        {'text': 'Khaled Ibn El-Waleed', 'Score': 0},
        {'text': 'Mohamed El-Fatih', 'Score': 0},
        {'text': 'Alp Arslan', 'Score': 10},
        {'text': 'Saad ibn Aby-Waqas', 'Score': 0},
        {'text': 'Mousa Ibn Nouser', 'Score': 0},
      ]
    },
    {
      'questionText': 'Who is the sword of god ?',
      'answers': [
        {'text': 'Khaled Ibn El-Waleed', 'Score': 10},
        {'text': 'Mohamed El-Fatih', 'Score': 0},
        {'text': 'Alp Arslan', 'Score': 0},
        {'text': 'Saad ibn Aby-Waqas', 'Score': 0},
        {'text': 'Mousa Ibn Nouser', 'Score': 0},
      ]
    },
    {
      'questionText': 'Who is Fatih Al-Andalus?',
      'answers': [
        {'text': 'Khaled Ibn El-Waleed', 'Score': 0},
        {'text': 'Mohamed El-Fatih', 'Score': 0},
        {'text': 'Alp Arslan', 'Score': 0},
        {'text': 'Saad ibn Aby-Waqas', 'Score': 0},
        {'text': 'Mousa Ibn Nouser', 'Score': 10},
      ]
    },
    {
      'questionText':
          'Who is the leader of the Muslims in the battle of El-Qadisiyah',
      'answers': [
        {'text': 'Khaled Ibn El-Waleed', 'Score': 0},
        {'text': 'Mohamed El-Fatih', 'Score': 0},
        {'text': 'Alp Arslan', 'Score': 0},
        {'text': 'Saad ibn Aby-Waqas', 'Score': 10},
        {'text': 'Mousa Ibn Nouser', 'Score': 0},
      ]
    }
  ];

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
      num4 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Islamic Quiz",style: TextStyle(color: w),),
            backgroundColor: Colors.red,
            centerTitle: true,
            actions: <Widget>[
              Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched= value;
                      if(isSwitched==true){b=Colors.white;w=Colors.black;}
                      if(isSwitched==false){b=Colors.black;w=Colors.white;}
                    });
                  },
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.black,
              inactiveThumbColor: Colors.black),

            ],
          ),
          body: Container(
            color: w,
              child: _questionIndex < _questions.length
                  ? Quiz(_questions, _questionIndex, answerQuestion)
                  : Result(_restQuiz, _totalScore)),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.arrow_back,color: w,size: 45,),
            onPressed: () {
              if (_questionIndex == 1)
                _totalScore -= num0;
              else if (_questionIndex == 2)
                _totalScore -= num1;
              else if (_questionIndex == 3)
                _totalScore -= num2;
              else if (_questionIndex == 4)
                _totalScore -= num3;
              else if (_questionIndex == 5) _totalScore -= num4;
              setState(() {
                if (_questionIndex > 0) {
                  _questionIndex--;
                }
              });
            },
          ),
        ));
  }
}
