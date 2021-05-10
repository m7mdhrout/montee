class Ant {
  static int antScore = 0;
  var _position = {'x': 6, 'y': 5};

  antMoveDirection _direction = antMoveDirection.right;

  void move() {
    if (_direction == antMoveDirection.right)
      _position['x'] += 1;
    else
      _position['x'] -= 1;
  }

  void setDirection(antMoveDirection m) {
    _direction = m;
  }

  void setNewPosition(x, y) {
    _position['x'] = x;
    _position['y'] = y;
  }

  Map getPosition() {
    return _position;
  }

  int getXAxis() {
    return _position['x'];
  }

  int getYAxis() {
    return _position['y'];
  }
}

enum antMoveDirection {
  left,
  right,
}
