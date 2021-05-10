import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectaii/screens/breadthScreen.dart';
import 'package:projectaii/screens/depthScreen.dart';
import 'package:projectaii/screens/manualScreen.dart';

class Home extends StatelessWidget {
  static const String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Spider Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, ManualGameScreen.id);
              },
              child: Text('manually game'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, BreadthScreen.id);
              },
              child: Text('Play Breadth'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, DepthScreen.id);
              },
              child: Text('Play Depth'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {},
              child: Text('new Game as heuristic function 2'),
            ),
          ],
        ),
      ),
    );
  }
}
