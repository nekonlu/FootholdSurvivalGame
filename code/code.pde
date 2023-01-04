import java.util.Random;
import java.util.Collections;

int FRAMERATE = 60;

String gameState = "";

int fall_idx;
float fallFHinterval_sec = 3.0;

Player player;
Footholds footholds;

// 難易度パラメーター
int fallSpeed = 5;
int playerSpeed = 5;
int separateFH = 10;

Random rand = new Random();

void setup() {
  size(500, 400); 
  player = new Player();
  footholds = new Footholds();

  // 難易度パラメーターの適用
  footholds.fallSpeed = fallSpeed;
  player.playerSpeed = playerSpeed;
  footholds.separateFH = separateFH;
}

void draw() {
  background(200);

  // スコアテキスト

  player.display();
  footholds.display();

  gameover();

  fallFHs();
  
  // プレイヤー直下の地面のY座標取得のため、footholds.getGroundY()を実行
  // そして取得した値をplayer.groundYに代入
  player.groundY = footholds.getGroundY(player.X);
}

// Playerが足場から落ちた時の処理を書く
void gameover() {
  if(player.Y >= height) {
    gameState = "GAME OVER!!";
  } else {
    gameState = "";
  }
  textSize(64);
  textAlign(CENTER);
  text(gameState, width / 2, height / 2);
}

void fallFHs() {
  if(frameCount % (int)(fallFHinterval_sec * FRAMERATE) == 0) {
    footholds.list.clear();
    footholds.fallFHs_idx.clear();
    footholds.initFHProperty();
  } else {
    footholds.fallFHs();
  }
}