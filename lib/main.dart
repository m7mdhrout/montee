import 'package:flutter/material.dart';
import 'package:projectaii/screens/gameScreen.dart';
import 'package:projectaii/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spider Game',
      home: GameScreen(),
    );
  }
}
