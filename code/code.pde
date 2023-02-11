import java.util.Random;
import java.util.Collections;

GameScene gameScene;

void setup() {
  size(500, 400);
  
  gameScene = new GameScene();
}

void draw() {
  gameScene.display();
}
