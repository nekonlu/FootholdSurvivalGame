class Player {
  int X, Y;
  int H, W;
  int bottom, left, right;
  float speedX, speedY;    // unit: px/(1/framerate)
  float G;      // Gravity Acceleration
  float jumpV0;  // Jump Initical Velocity
  int groundY;
  
  Player() {
    // Set Parameter
    X = width / 2;
    Y = height / 2 - 100;
    H = 30;
    W = 30;
    speedX = 0;
    speedY = 1.0;
    G = 1.1;
    jumpV0 = 10.0;
    groundY = 200;
  }
  
  void display() {
    rectMode(CENTER);
    detectCollision();
    keyAction();
    move();
    rect(X, Y, 30, 30);
    
    println(speedY);
  }
  
  void move() {
    X += speedX;
    Y += speedY;
    bottom = Y + (H / 2);
    left = X - (W / 2);
    right = X + (W / 2);
  }
  
  void gravity() {
    speedY += G;
  }
  
  void detectCollision() {
    if(bottom >= groundY) {
      speedY = 0;
    } else {
      gravity();
    }
  }
          
  void keyAction() {
    if(keyPressed) {
      if(key == 'a') {
        speedX = -10;
      } else if(key == 'd') {
        speedX = 10;
      } else if(key == ' ') {
        speedY = -5;
      }
    } else {
      speedX = 0;
    }
  }
}
