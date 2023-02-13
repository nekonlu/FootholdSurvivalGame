class Player {
  float X, Y;
  int H, W;
  float bottom, left, right;
  float speedX, speedY;    // unit: px/(1/framerate)
  float G;      // Gravity Acceleration
  float jumpV0;  // Jump Initical Velocity
  int jumpFC;    // FrameCount at the time of jumping
  float groundY;
  int playerSpeed;

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
    playerSpeed = 10;
  }
  
  void initPlayer() {
    X = width / 2;
    Y = height / 2 - 100;
  }

  void display() {
    rectMode(CENTER);
    
    keyAction();
    move();
    detectCollision();

    rect(X, Y, 30, 30);
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

    boolean hitLeft = isHit(0, 0, 0, 1000);
    boolean hitRight = isHit(width, 0, 0, 1000);
    boolean hitGround = isHit(0, groundY, 3000, 0);


    if (hitLeft) {
      X = W / 2;
    }

    if (hitRight) {
      X = width - (W / 2);
    }

    if (hitGround) {
      speedY = 0;
      Y = groundY - (H / 2);
    } else {
      gravity();
    }
  }

  void keyAction() {
    if (keyPressed) {
      moveLeft();
      moveRight();
      jump();
    } else {
      speedX = 0;
    }
  }

  void moveLeft() {
    if (key == 'a') {
      speedX = -playerSpeed;
    }
  }

  void moveRight() {
    if (key == 'd') {
      speedX = playerSpeed;
    }
  }

  void jump() {
    // FIXME: Magic number
    if (frameCount >= jumpFC + 30) {
      if (key == ' ') {
        speedY = jumpV0;
        jumpFC = frameCount;
      }
    }
  }

  boolean isHit(float ex, float ey, float ew, float eh) {
    if (X + W / 2 >= ex - ew / 2 && X - W / 2 <= ex + ew / 2) {
      if (Y + H / 2 >= ey - eh / 2 && Y - H / 2 <= ey + eh / 2) {
        return true;
      }
    }
    return false;
  }
}
