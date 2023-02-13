import java.util.Random;
import java.util.Collections;

GameScene gameScene;
StartScene startScene;

String scene = "start";

void setup() {
  size(600, 400);
  
  gameScene = new GameScene();
  startScene = new StartScene();
}

void draw() {
  
  if(scene == "start") {
    background(200);
    startScene.display();
  } else if(scene == "gaming") {
    gameScene.display();
  }
}

void keyPressed() {
  switch (key) {
    case ' ': scene = "gaming"; break;
    case ESC: 
      key = 0; 
      scene = "start"; 
      gameScene.initGame();
      break;
  }
}
