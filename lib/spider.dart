class Spider {
  var _position = {'x': 2, 'y': 7};
  static int spiderScore = 0;

  moveDirection _direction = moveDirection.topRight;

  void move() {
    switch (_direction) {
      case moveDirection.topRight:
        setNewPosition(_position['x'] + 1, _position['y'] - 2);
        break;
      case moveDirection.topLeft:
        setNewPosition(_position['x'] - 1, _position['y'] - 2);
        break;
      case moveDirection.rightTop:
        setNewPosition(_position['x'] + 2, _position['y'] - 1);
        break;
      case moveDirection.rightBottom:
        setNewPosition(_position['x'] + 2, _position['y'] + 1);
        break;
      case moveDirection.bottomLeft:
        setNewPosition(_position['x'] - 1, _position['y'] + 2);
        break;
      case moveDirection.bottomRight:
        setNewPosition(_position['x'] + 1, _position['y'] + 2);
        break;
      case moveDirection.leftTop:
        setNewPosition(_position['x'] - 2, _position['y'] - 1);
        break;
      case moveDirection.leftBottom:
        setNewPosition(_position['x'] - 2, _position['y'] + 1);
        break;
    }
  }
  void setDirection(moveDirection m){
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

enum moveDirection {
  topRight,
  topLeft,
  rightTop,
  rightBottom,
  bottomRight,
  bottomLeft,
  leftTop,
  leftBottom,
}
