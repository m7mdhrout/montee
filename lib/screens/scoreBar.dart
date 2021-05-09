import 'package:flutter/material.dart';
import 'package:projectaii/ant.dart';

import '../spider.dart';
class ScoreBar extends StatefulWidget {

  @override
  _ScoreBarState createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int spiderScore = 0;
  int antScore = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Spider Score: $spiderScore',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Ant Score: $antScore',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          ElevatedButton(
            onPressed: () {
              updateScore();
            },
            child: Text(
              'Start/Stop',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 44,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.grey[50],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'End',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 64,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.grey[50],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void updateScore(){
    setState(() {
      spiderScore=Spider.spiderScore;
      antScore = Ant.antScore;
    });
  }
}
