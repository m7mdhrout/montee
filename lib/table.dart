import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projectaii/algo/breadth.dart';
import 'package:projectaii/spider.dart';
import 'package:projectaii/tree/node.dart';

import 'ant.dart';

class Tables extends StatefulWidget {
  final int col;
  final int row;

  Tables({this.row, this.col});

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  Spider spider = Spider();
  Ant ant = Ant();
  Tree t = Tree();
  List<TableRow> rows = [];
  bool isTableBuilt = false;
  final double cellWidthAndHeight = 30;
  Color cellColor = Colors.grey[50];

  @override
  Widget build(BuildContext context) {
    int x = spider.getXAxis();
    int y = spider.getYAxis();

    if (isTableBuilt == false) {
      buildTable();
    }
    spiderPlace(spider.getXAxis(), spider.getYAxis());
    antPlace(ant.getXAxis(), ant.getYAxis());
    return Column(
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
        TextButton(
            onPressed: () {
              moveSpider(moveDirection.rightTop);
            },
            child: Text('press'))
      ],
    );
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

  void spiderPlace(int x, int y) {
    rows[y].children[x] = TableCell(
      child: Container(
        height: cellWidthAndHeight,
        child: TextButton(
          style: ButtonStyle(
              // backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
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

  void antPlace(int x, int y) {
    rows[y].children[x] = TableCell(
      child: Container(
        height: cellWidthAndHeight,
        child: TextButton(
          child: Image.network('images/ant1.gif'),
          onPressed: () {
            setState(() {
              possiblePlaceOfAnt();
            });
          },
        ),
      ),
    );
  }

  void possiblePlaceOfSpider() {
    int x = spider.getXAxis();
    int y = spider.getYAxis();
    int antX = ant.getXAxis();
    int antY = ant.getYAxis();

    spiderPossiblePlace(x + 1, y + 2, moveDirection.topRight, Colors.red);
    spiderPossiblePlace(x - 1, y + 2, moveDirection.topLeft, Colors.red);
    spiderPossiblePlace(x + 1, y - 2, moveDirection.bottomRight, Colors.red);
    spiderPossiblePlace(x - 1, y - 2, moveDirection.bottomLeft, Colors.red);
    spiderPossiblePlace(x + 2, y + 1, moveDirection.rightTop, Colors.red);
    spiderPossiblePlace(x + 2, y - 1, moveDirection.rightBottom, Colors.red);
    spiderPossiblePlace(x - 2, y + 1, moveDirection.leftTop, Colors.red);
    spiderPossiblePlace(x - 2, y - 1, moveDirection.leftBottom, Colors.red);

    checkEat(antX, antY, x, y);
  }

  void possiblePlaceOfAnt() {
    int x = ant.getXAxis();
    int y = ant.getYAxis();
    antPossiblePlace(x + 1, y, antMoveDirection.right, Colors.yellow);
    antPossiblePlace(x - 1, y, antMoveDirection.left, Colors.yellow);
  }

  void spiderPossiblePlace(int x, int y, moveDirection direction, Color c) {
    if (x == ant.getXAxis() && y == ant.getYAxis()) {
      t.insertRoot(spider.getXAxis(), spider.getYAxis());
      t.buildTree(spider.getXAxis(), spider.getYAxis(), t.root);
      Breadth breadth = Breadth(spider: spider, ant: ant, tree: t);
      breadth.shortestPath();

      remover(ant.getXAxis(), ant.getYAxis(), cellColor);
      ant.setNewPosition(Random().nextInt(rows.length - 4) + 2,
          Random().nextInt(rows.length - 4) + 2);
    }
    rows[y].children[x] = TableCell(
      child: Container(
        color: c,
        height: cellWidthAndHeight,
      ),
    );
  }

  void antPossiblePlace(int x, int y, antMoveDirection direction, Color c) {
    rows[y].children[x] = TableCell(
      child: Container(
        color: c,
        height: cellWidthAndHeight,
        child: TextButton(
          onPressed: () {
            moveAnt(direction);
          },
        ),
      ),
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

  void moveSpider(moveDirection direction) {
    setState(() {
      removeSpiderPossiblePlaces();
      spider.setDirection(direction);

      spider.move();
      spiderPlace(spider.getXAxis(), spider.getYAxis());
      checkLosing();

      colorTable();

      checkEat(ant.getXAxis(), ant.getYAxis(), spider.getXAxis(), spider.getYAxis());
    });
    t.insertRoot(spider.getXAxis(), spider.getYAxis());
    t.buildTree(spider.getXAxis(), spider.getYAxis(), t.root);
  }

  void moveAnt(antMoveDirection direction) {
    setState(() {
      removeAntPossiblePlaces();
      ant.setDirection(direction);
      ant.move();
      antPlace(ant.getXAxis(), ant.getYAxis());
    });
  }

  bool lost = false;

  void checkLosing() {
    int x = spider.getXAxis();
    int y = spider.getYAxis();
    if (x < 2 || x > rows.length - 3 || y < 2 || y > rows.length - 3) {
      print('Game Over!');
      setState(() {
        lost = true;
      });
    }
  }

  void checkEat(int antX, int antY, int x, int y) {
    if (antX != ant.getXAxis() && antY != ant.getYAxis()) {
      removeSpiderPossiblePlaces();
      spider.setNewPosition(antX, antY);
      remover(x, y, cellColor);

      t.insertRoot(spider.getXAxis(), spider.getYAxis());
      t.buildTree(spider.getXAxis(), spider.getYAxis(), t.root);

      Breadth breadth = Breadth(spider: spider, ant: ant, tree: t);
      breadth.shortestPath();
      Spider.spiderScore++;
    }
    // print('Spider Score: ${Spider.spiderScore}');
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

  void removeAntPossiblePlaces() {
    int x = ant.getXAxis();
    int y = ant.getYAxis();
    remover(x - 1, y, cellColor);
    remover(x + 1, y, cellColor);
    remover(x, y, cellColor);
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
