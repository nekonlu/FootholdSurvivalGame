float G = 9.8;

class Player {
  int X, Y;
  
  Player() {
    X = width / 2;
    Y = height / 2;
    groundY = Y - 100;
  }
  
  void display() {
    rectMode(CENTER);
    rect(X, Y, 30, 30);
    gravity();
  }
  
  void gravity() {
    if(Y < groundY) {
      Y = groundY;
    } else {
      Y -= G * 0.5 * dt * dt;
    }
  }
}
