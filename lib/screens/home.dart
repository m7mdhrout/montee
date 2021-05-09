import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
          children: [
            Text('High Score'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Text('new Game as merge sort'),
              ),
            ),SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Text('new Game as breadth sort'),
              ),
            ),SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Text('new Game as heuristic function 1'),
              ),
            ),SizedBox(
              height: 20,
            ),
            ElevatedButton(

              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Text('new Game as heuristic function 2'),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
