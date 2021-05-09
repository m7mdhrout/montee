int maxWall = 9;

class Node {
  int x, y;
  Node tl, tr, bl, br, rt, rb, lt, lb;

  Node({int x, int y}) {
    this.x = x;
    this.y = y;
    tl = tr = bl = br = rt = rb = lt = lb = null;
  }
}

class Tree {
  Node root;
  List<Node> isVisitedList;

  Tree() {
    root = null;
    isVisitedList = [];
  }

  void buildTree(int x, int y, Node node) {
    if (x < 2 || x > maxWall || y < 2 || y > maxWall) {
      print('null tree');
      return;
    } else {
      print('spider at x=$x y=$y');
      buildRightBottom(x, y, node);
      buildRightTop(x, y, node);
      buildLeftBottom(x, y, node);
      buildLeftTop(x, y, node);
      buildTopRight(x, y, node);
      buildTopLeft(x, y, node);
      buildBottomRight(x, y, node);
      buildBottomLeft(x, y, node);
    }
  }

  Node buildBottomRight(int x, int y, Node node) {
    if (x + 1 > maxWall || y + 2 > maxWall) {
      print('null');
      node.br = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited bottom right----------------------');
      return buildBottomRight(node.x + 1, node.y + 2, Node(x: x + 1, y: y + 2));
    } else {
      Node newNode = Node(x: x + 1, y: y + 2);
      node.br = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am BottomRight x = ${newNode.x} y = ${newNode.y}');
      return buildBottomRight(newNode.x, newNode.y, newNode);
    }
  }

  Node buildBottomLeft(int x, int y, Node node) {
    if (x - 1 < 2 || x - 1 > maxWall || y + 2 > maxWall) {
      print('null');
      node.bl = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited bottom left----------------------');
      return buildBottomLeft(node.x - 1, node.y + 2, Node(x: x - 1, y: y + 2));
    } else {
      Node newNode = Node(x: x - 1, y: y + 2);
      node.bl = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am BottomLeft x = ${newNode.x} y = ${newNode.y}');
      return buildBottomLeft(newNode.x, newNode.y, newNode);
    }
  }

  Node buildTopRight(int x, int y, Node node) {
    if (x + 1 > maxWall || y - 2 < 2) {
      print('null');
      node.tr = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited Top right----------------------');
      return buildTopRight(node.x + 1, node.y - 2, Node(x: x + 1, y: y - 2));
    } else {
      Node newNode = Node(x: x + 1, y: y - 2);
      node.tr = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am TopRight x = ${newNode.x} y = ${newNode.y}');
      return buildTopRight(newNode.x, newNode.y, newNode);
    }
  }

  Node buildTopLeft(int x, int y, Node node) {
    if (x - 1 < 2 || y - 2 < 2) {
      print('null');
      node.tl = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited Top Left----------------------');
      return buildTopLeft(node.x - 1, node.y - 2, Node(x: x - 1, y: y - 2));
    } else {
      Node newNode = Node(x: x - 1, y: y - 2);
      node.tl = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am TopLeft x = ${newNode.x} y = ${newNode.y}');
      return buildTopLeft(newNode.x, newNode.y, newNode);
    }
  }

  Node buildRightTop(int x, int y, Node node) {
    if (x + 2 > maxWall || y - 1 < 2) {
      print('null');
      node.rt = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited Rigth Top----------------------');
      return buildRightTop(node.x + 2, node.y - 1, Node(x: x + 2, y: y - 1));
    } else {
      Node newNode = Node(x: x + 2, y: y - 1);
      node.rt = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am RightTop x = ${newNode.x} y = ${newNode.y}');
      return buildRightTop(newNode.x, newNode.y, newNode);
    }
  }

  Node buildRightBottom(int x, int y, Node node) {
    if (x + 2 > maxWall || y + 1 > maxWall) {
      print('null');
      node.rb = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited RightBottom----------------------');
      return buildRightBottom(node.x + 2, node.y + 1, Node(x: x + 2, y: y + 1));
    } else {
      Node newNode = Node(x: x + 2, y: y + 1);
      node.rb = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am RightBottom x = ${newNode.x} y = ${newNode.y}');
      return buildRightBottom(newNode.x, newNode.y, newNode);
    }
  }

  Node buildLeftTop(int x, int y, Node node) {
    if (x - 2 < 2 || y - 1 < 2) {
      print('null');
      node.lt = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited LeftTop----------------------');
      return buildLeftTop(node.x - 2, node.y - 1, Node(x: x - 2, y: y - 1));
    } else {
      Node newNode = Node(x: x - 2, y: y - 1);
      node.lt = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am LeftTop x = ${newNode.x} y = ${newNode.y}');
      return buildLeftTop(newNode.x, newNode.y, newNode);
    }
  }

  Node buildLeftBottom(int x, int y, Node node) {
    if (x - 2 < 2 || y + 1 > maxWall) {
      print('null');
      node.lb = null;
      return null;
    } else if (checkIsVisited(x, y)) {
      print('check visited Left Bottom----------------------');
      return buildLeftBottom(node.x - 2, node.y + 1, Node(x: x - 2, y: y + 1));
    } else {
      Node newNode = Node(x: x - 2, y: y + 1);
      node.lb = newNode;
      isVisitedList.add(node);
      buildTree(newNode.x, newNode.y, newNode);
      print('i am LeftBottom x = ${newNode.x} y = ${newNode.y}');
      return buildLeftBottom(newNode.x, newNode.y, newNode);
    }
  }

  void insertRoot(int x, int y) {
    root = Node(x: x, y: y);
  }

  bool checkIsVisited(int x, int y) {
    bool vis = false;
    for (int i = 0; i < getIsVisitedLength(); i++) {
      if (isVisitedList[i].x == x && isVisitedList[i].y == y) {
        vis = true;
        print(
            'isVisited true when x = ${isVisitedList[i].x} y = ${isVisitedList[i].y}');
      }

    }
    if(getIsVisitedLength()>=50){
      for (int i = 0; i < getIsVisitedLength(); i++) {
        print('x = ${isVisitedList[i].x-2} y = ${isVisitedList[i].y-2}');
      }
    }
    print(getIsVisitedLength());
    return vis;
  }

  int getIsVisitedLength() {
    return isVisitedList.length;
  }
}
