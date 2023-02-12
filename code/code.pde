import java.util.Random;
import java.util.Collections;

GameScene gameScene;
StartScene startScene;

String scene = "start";

void setup() {
  size(500, 400);
  
  gameScene = new GameScene();
  startScene = new StartScene();
}

void draw() {
  background(200);
  if(scene == "start") {
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
