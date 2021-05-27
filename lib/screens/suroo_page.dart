import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabak_test/data/tizme.dart';

class SurooPage extends StatefulWidget {
  @override
  _SurooPageState createState() => _SurooPageState();
}

class _SurooPageState extends State<SurooPage> {
  List<Icon> scoreKeeper = [];
  String reset_text = 'reset';

  @override
  void initState() {
    super.initState();
  }

  void checkAnswer(bool basilganJoop) {
    setState(() {
      if (tizmeBrain.isFinished() == true) {
        reset_text = 'RESETTI BAS';

        setIconMasele(basilganJoop);

        tizmeBrain.nextQuestion();
      } else {
        setIconMasele(basilganJoop);
      }
    });
  }

  void setIconMasele(bool userPickedAnswer) {
    bool correctAnswer = tizmeBrain.jooptuAlipKel();

    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    tizmeBrain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                tizmeBrain.textAlipKel(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                '$reset_text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  tizmeBrain.reset();
                  scoreKeeper = [];
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Tuura',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Tuura emes',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
