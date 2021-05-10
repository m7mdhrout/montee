import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ant.dart';
import '../spider.dart';

class ManualGameScreen extends StatelessWidget {
  static const String id = 'ManualGameScreen';

  @override
  Widget build(BuildContext context) {
    String selectedGame;
    selectedGame = 'Manual';
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
  final int col = 18;
  final int row = 18;

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  Spider spider = Spider();
  Ant ant = Ant();
  List<TableRow> rows = [];
  bool isTableBuilt = false;
  final double cellWidthAndHeight = 30;
  Color cellColor = Colors.grey[50];
  bool lost = false;
  int spiderScore = 0;
  int antScore = 0;

  @override
  Widget build(BuildContext context) {
    int x = spider.getXAxis();
    int y = spider.getYAxis();

    if (isTableBuilt == false) {
      buildTable();
    }
    respawnSpider(spider.getXAxis(), spider.getYAxis());
    respawnAnt(ant.getXAxis(), ant.getYAxis());
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Table(
                border: TableBorder.symmetric(
                    inside: BorderSide(width: 0.5), outside: BorderSide()),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: rows,
                defaultColumnWidth: FixedColumnWidth(cellWidthAndHeight),
              ),
            ],
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
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
          ),
        ),
      ],
    );
  }

  void updateScore() {
    setState(() {
      spiderScore = Spider.spiderScore;
      antScore = Ant.antScore;
    });
  }

  void buildTable() {
    for (int i = 0; i < widget.row; i++) {
      rows.add(
        TableRow(
          children: createRow(),
        ),
      );
    }
    setState(() {
      isTableBuilt = true;
    });

    colorTable();
  }

  void respawnSpider(int x, int y) {
    rows[y].children[x] = TableCell(
      child: Container(
        height: cellWidthAndHeight,
        child: TextButton(
          style: ButtonStyle(),
          child: Image.network('images/spider2.gif'),
          onPressed: () {
            setState(() {
              lost ? null : possiblePlaceOfSpider();
            });
          },
        ),
      ),
    );
  }

  void respawnAnt(int x, int y) {
    rows[y].children[x] = TableCell(
      child: Container(
        height: cellWidthAndHeight,
        child: Image.network('images/ant1.gif'),
      ),
    );
  }

  void possiblePlaceOfSpider() {
    int x = spider.getXAxis();
    int y = spider.getYAxis();
    int antX = ant.getXAxis();
    int antY = ant.getYAxis();

    spiderPossiblePlace(x + 1, y - 2, moveDirection.topRight, Colors.red);
    spiderPossiblePlace(x - 1, y - 2, moveDirection.topLeft, Colors.red);
    spiderPossiblePlace(x + 1, y + 2, moveDirection.bottomRight, Colors.red);
    spiderPossiblePlace(x - 1, y + 2, moveDirection.bottomLeft, Colors.red);
    spiderPossiblePlace(x + 2, y - 1, moveDirection.rightTop, Colors.red);
    spiderPossiblePlace(x + 2, y + 1, moveDirection.rightBottom, Colors.red);
    spiderPossiblePlace(x - 2, y - 1, moveDirection.leftTop, Colors.red);
    spiderPossiblePlace(x - 2, y + 1, moveDirection.leftBottom, Colors.red);

    checkEat(antX, antY, x, y);
  }

  void spiderPossiblePlace(int x, int y, moveDirection direction, Color c) {
    if (x == ant.getXAxis() && y == ant.getYAxis()) {
      remover(ant.getXAxis(), ant.getYAxis(), cellColor);
      ant.setNewPosition(Random().nextInt(rows.length - 4) + 2,
          Random().nextInt(rows.length - 4) + 2);
    }

    rows[y].children[x] = TableCell(
      child: Container(
          color: c,
          height: cellWidthAndHeight,
          child: TextButton(
            child: Text(''),
            onPressed: () {
              moveSpider(direction);
            },
          )),
    );
  }

  void remover(int x, int y, Color c) {
    rows[y].children[x] = TableCell(
      child: Container(
        color: c,
        height: cellWidthAndHeight,
      ),
    );
  }

  void antScoreUpdate() {
    if (ant.getXAxis() < 2 ||
        ant.getXAxis() > rows.length - 3 ||
        ant.getYAxis() < 2 ||
        ant.getYAxis() > rows.length - 3) {
      setState(() {
        Ant.antScore++;
        ant.setNewPosition(Random().nextInt(rows.length - 4) + 2,
            Random().nextInt(rows.length - 4) + 2);
        // print('ant score: ${Ant.antScore}');
      });
    }
  }

  void moveSpider(moveDirection direction) {
    moveAnt();
    setState(() {
      removeSpiderPossiblePlaces();
      spider.setDirection(direction);

      spider.move();
      respawnSpider(spider.getXAxis(), spider.getYAxis());
      checkLosing();

      colorTable();
      checkEatAuto(
          ant.getXAxis(), ant.getYAxis(), spider.getXAxis(), spider.getYAxis());
      antScoreUpdate();
      updateScore();
    });
  }

  void moveAnt() {
    setState(() {
      remover(ant.getXAxis(), ant.getYAxis(), Colors.grey[50]);
      int z = Random().nextInt(2);
      bool moveRight = z == 1 ? true : false;
      if (moveRight)
        ant.setDirection(antMoveDirection.right);
      else
        ant.setDirection(antMoveDirection.left);

      ant.move();
      respawnAnt(ant.getXAxis(), ant.getYAxis());
    });
  }

  void checkLosing() {
    int x = spider.getXAxis();
    int y = spider.getYAxis();
    if (x < 2 || x > rows.length - 3 || y < 2 || y > rows.length - 3) {
      print('Game Over!!');
      setState(() {
        lost = true;
      });
    }
  }

  //without possible place
  void checkEatAuto(int antX, int antY, int x, int y) {
    if (antX == spider.getXAxis() && antY == spider.getYAxis()) {
      removeSpiderPossiblePlaces();
      remover(ant.getXAxis(), ant.getYAxis(), cellColor);
      ant.setNewPosition(Random().nextInt(rows.length - 4) + 2,
          Random().nextInt(rows.length - 4) + 2);
      spider.setNewPosition(antX, antY);
      remover(x, y, cellColor);

      Spider.spiderScore++;
    }
  }

  //with possible place
  void checkEat(int antX, int antY, int x, int y) {
    if (antX != ant.getXAxis() && antY != ant.getYAxis()) {
      removeSpiderPossiblePlaces();
      remover(antX, antY, cellColor);
      spider.setNewPosition(antX, antY);
      remover(x, y, cellColor);

      Spider.spiderScore++;
    }
  }

  void removeSpiderPossiblePlaces() {
    int x = spider.getXAxis();
    int y = spider.getYAxis();

    remover(x + 1, y + 2, cellColor);
    remover(x - 1, y + 2, cellColor);
    remover(x + 1, y - 2, cellColor);
    remover(x - 1, y - 2, cellColor);
    remover(x + 2, y + 1, cellColor);
    remover(x + 2, y - 1, cellColor);
    remover(x - 2, y + 1, cellColor);
    remover(x - 2, y - 1, cellColor);
    remover(x, y, cellColor);
    colorTable();
  }

  List<TableCell> createRow() {
    List<TableCell> cell = [];
    Color c;

    for (int i = 0; i < widget.col; i++) {
      cell.add(
        TableCell(
          child: Container(
            height: cellWidthAndHeight,
          ),
        ),
      );
    }
    return cell;
  }

  void colorTable() {
    for (int i = 0; i < rows.length; i++) {
      for (int j = 0; j < rows[i].children.length; j++) {
        if (i < 1 || i > rows.length - 2 || j < 1 || j > rows.length - 2) {
          rows[i].children[j] = TableCell(
            child: Container(
              color: Colors.grey,
              height: cellWidthAndHeight,
            ),
          );
        } else if (i < 2 ||
            i > rows.length - 3 ||
            j < 2 ||
            j > rows.length - 3) {
          rows[i].children[j] = TableCell(
            child: Container(
              height: cellWidthAndHeight,
              child: Image.network('images/wall.jpg'),
            ),
          );
        }
      }
    }
  }
}
