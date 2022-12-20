class Player {
  int X, Y;
  float speedX, speedY;    // px/(1/framerate)
  float G;      // Gravity Acceleration
  float jumpV0;  // Jump Initical Velocity
  int groundY;
  
  Player() {
    X = width / 2;
    Y = height / 2 - 100;
    speedX = 0;
    speedY = 1.0;
    G = 1.1;
    jumpV0 = 10.0;
    groundY = Y + 100;
  }
  
  void display() {
    keyinput();
    rectMode(CENTER);
    rect(X, Y, 30, 30);
    gravity();
  }
  
  void move() {
    X += speedX;
    Y += speedY;
  }
  
  void jump() {
    
  }
  
  void gravity() {
    if(Y >= groundY) {
      Y = groundY;
      speedY = 1.0;
    } else {
      speedY *= G;
      Y += speedY;
    }
  }
  
  void keyinput() {
    if(keyPressed) {
      speedX = 10;
      if(key == 'a' || key == 'A') {
        X -= speedX;
      }
      if(key == 'd' || key == 'D') {
        X += speedX;
      }
    } else {
      speedX = 0;
    }
    println(speedX);
  }
}
