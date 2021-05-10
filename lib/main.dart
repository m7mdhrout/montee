import 'package:flutter/material.dart';
import 'package:projectaii/screens/breadthScreen.dart';
import 'package:projectaii/screens/depthScreen.dart';
import 'package:projectaii/screens/manualScreen.dart';

import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spider Game',
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        ManualGameScreen.id: (context) => ManualGameScreen(),
        BreadthScreen.id: (context) => BreadthScreen(),
        DepthScreen.id: (context) => DepthScreen(),
      },
    );
  }
}
