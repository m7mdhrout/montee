import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:projectaii/tree/node.dart';

import '../ant.dart';
import '../spider.dart';

class Breadth {
  Spider spider;
  Ant ant;
  Tree tree;
  Node goal;
  bool isFound;

  Breadth({Spider spider, Ant ant, Tree tree}) {
    this.spider = spider;
    this.ant = ant;
    this.tree = tree;
    goal = Node(x: ant.getXAxis(), y: ant.getYAxis());
    isFound = false;
  }

  void shortestPath() {
    Node key = tree.root;
    if (key.tr == null ||
        key.tl == null ||
        key.br == null ||
        key.bl == null ||
        key.lt == null ||
        key.lb == null ||
        key.rt == null ||
        key.rb == null) {
      print('null');
    } else if (key.tl.x == goal.x && key.tl.y == goal.y ||
        key.tr.x == goal.x && key.tr.y == goal.y ||
        key.bl.x == goal.x && key.bl.y == goal.y ||
        key.br.x == goal.x && key.br.y == goal.y ||
        key.lt.x == goal.x && key.lt.y == goal.y ||
        key.lb.x == goal.x && key.lb.y == goal.y ||
        key.rt.x == goal.x && key.rt.y == goal.y ||
        key.rb.x == goal.x && key.rb.y == goal.y) {
      isFound = true;
    }
  }

  void breadthSearch(Node n) {

    if(n==null){
      return;
    }

    var queue =[];
    queue.add(n);

    while (queue.length > 0) {

      var currentNode = queue[0];

      // If currentNode has a left child node, add it to the queue.
      if (currentNode.left != null) {
        queue.add(currentNode.left);
      }
      // If currentNode has a right child node, add it to the queue.
      if (currentNode.right != null) {
        queue.add(currentNode.right);
      }
      // Remove the currentNode from the queue.
      queue.removeLast();
    }



    // Queue<Node> queue = ListQueue() ;
    // queue.add(n);
    // while(queue.isNotEmpty){
    //   Node tempNode = queue.first;
    //   queue.removeFirst();
    //   print("x = ${tempNode.x} y = ${tempNode.y}");
    //   if(tempNode.tr != null){
    //     queue.add(tempNode.tr);
    //   }
    //   if(tempNode.tl != null){
    //     queue.add(tempNode.tl);
    //   }
    //   if(tempNode.br != null){
    //     queue.add(tempNode.br);
    //   }
    //   if(tempNode.bl != null){
    //     queue.add(tempNode.bl);
    //   }
    //   if(tempNode.rt != null){
    //     queue.add(tempNode.rt);
    //   }
    //   if(tempNode.rb != null){
    //     queue.add(tempNode.rb);
    //   }
    //   if(tempNode.lt != null){
    //     queue.add(tempNode.lt);
    //   }
    //   if(tempNode.lb != null){
    //     queue.add(tempNode.lb);
    //   }
    // }

  }
}

class BFS{
  // ignore: deprecated_member_use
  List<int>level = List<int>(10);
  // ignore: deprecated_member_use
  List<bool>visited = List<bool>(10);

  void bfs(int s){
    List<int> q;
    q.add(s);
    level[s]=0;
    visited[s]=true;
    while(q.isNotEmpty){
      int p = q.first;
    }
  }

}