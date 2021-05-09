import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectaii/screens/scoreBar.dart';
import 'package:projectaii/tree/node.dart';

import '../ant.dart';
import '../spider.dart';
import '../table.dart';

class GameScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    String selectedGame;
    selectedGame = 'Breadth';
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGame),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: All(),
    );
  }
}

class All extends StatefulWidget {

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    Spider spider = Spider();
    Ant ant = Ant();
    Tree t = Tree();
    List<TableRow> rows = [];
    bool isTableBuilt = false;
    final double cellWidthAndHeight = 30;
    Color cellColor = Colors.grey[50];
    return Row(
      children: [
        Expanded(
          child: Tables(
            row: 12,
            col: 12,
          ),
          flex: 2,
        ),
        Expanded(
          child: ScoreBar(),
        ),
      ],
    );
  }
}

