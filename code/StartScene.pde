class StartScene {
  StartScene() {
    
  }
  
  void display() {
    textSize(64);
    textAlign(CENTER);
    text("FootholdSurvival", width / 2, height / 2);
    textSize(32);
    textAlign(CENTER);
    text("Press the spacebar", width / 2, height / 2 + 30);
  }
  
  boolean pushedSpaceKey() {
    if(key == ' ') {
      return true;
    } else {
      return false;
    }
  }
} 
