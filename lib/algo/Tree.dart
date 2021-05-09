
class Node1 {
  int x, y;
  Node1 tl, tr, bl, br, rt, rb, lt, lb;

  Node1({int x, int y}) {
    this.x = x;
    this.y = y;
    tl = tr = bl = br = rt = rb = lt = lb = null;
  }
}

class Tree1 {
  Node1 root;

  Node1 initializeNode(Node1 n, int x, int y) {
    if (n == null) {
      return Node1(x: x, y: y);
    } else if (x-1==n.x && y-2==n.y) {
      n.tl = initializeNode(n, x - 1, y - 2);
    } else if (x-1==n.x && y-2==n.y) {
      n.tr = initializeNode(n, x + 1, y - 2);
    } else if (x-1==n.x && y+2==n.y) {
      n.bl = initializeNode(n, x - 1, y + 2);
    } else if (x-1==n.x && y+2==n.y) {
      n.br = initializeNode(n, x + 1, y + 2);
    } else if (x + 2==n.x && y-1 == n.y) {
      n.rt = initializeNode(n, x + 2, y - 1);
    } else if (x + 2==n.x && y+1 == n.y) {
      n.rb = initializeNode(n, x + 2, y + 1);
    } else if (x - 2==n.x && y-1 == n.y) {
      n.lt = initializeNode(n, x - 2, y - 1);
    } else if (x - 2==n.x && y+1 == n.y) {
      n.lb = initializeNode(n, x - 2, y + 1);
    } else {
      return n;
    }
    return n;
  }
  void add (int x,int y){
    root = initializeNode(root, x, y);
  }
}


