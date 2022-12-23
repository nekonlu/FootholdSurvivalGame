class Player {
  int X, Y;
  int H, W;
  int bottom, left, right;
  float speedX, speedY;    // unit: px/(1/framerate)
  float G;      // Gravity Acceleration
  float jumpV0;  // Jump Initical Velocity
  int jumpFC;    // FrameCount at the time of jumping
  int groundY;
  
  Player() {
    // Set Parameter
    X = width / 2;
    Y = height / 2 - 100;
    H = 30;
    W = 30;
    speedX = 0;
    speedY = 1.0;
    G = 1.01;
    jumpV0 = -12.0;
    jumpFC = 0;
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
      Y = groundY - (H / 2);
    } else {
      gravity();
    }
  }
          
  void keyAction() {
    if(keyPressed) {
      moveLeft();
      moveRight();
      jump();
      
    } else {
      speedX = 0;
    }
  }
  
  void moveLeft() {
    if(key == 'a') {
      speedX = -10;
    }
  }
  
  void moveRight() {
    if(key == 'd') {
      speedX = 10;
    }
  }
  
  void jump() {
    // FIXME: Magic number
    if(frameCount >= jumpFC + 30) {
      if(key == ' ') {
        speedY = jumpV0;
        jumpFC = frameCount;
      }
    }
  }
  
  
}
