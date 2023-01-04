import java.util.Random;

int FRAMERATE = 60;

String gameState = "";

int fall_idx;
float fallFHinterval_sec = 3.0;

Player player;
Footholds footholds;

// 難易度パラメーター
int fallSpeed = 5;
int playerSpeed = 5;

Random rand = new Random();

void setup() {
  size(500, 400); 
  player = new Player();
  footholds = new Footholds();

  // 難易度パラメーターの適用
  footholds.fallSpeed = fallSpeed;
  player.playerSpeed = playerSpeed;
}

void draw() {
  background(200);

  // スコアテキスト

  player.display();
  footholds.display();
  fallFH();

  gameover();
  
  // プレイヤー直下の地面のY座標取得のため、footholds.getGroundY()を実行
  // そして取得した値をplayer.groundYに代入
  player.groundY = footholds.getGroundY(player.X);
}

void fallFH() {
  if(frameCount % (int)(fallFHinterval_sec * FRAMERATE) == 0) {
    fall_idx = rand.nextInt(footholds.separateFH);
    footholds.initFHProperty();
    fallFHinterval_sec -= 0.01;
    println(fallFHinterval_sec);
  } else {
    footholds.fallFH(fall_idx);
  }
}

// Playerが足場から落ちた時の処理を書く
void gameover() {
  if(player.Y >= height) {
    gameState = "GAME OVER!!";
  } else {
    gameState = "aaaa";
  }
  textSize(64);
  textAlign(CENTER);
  text(gameState, width / 2, height / 2);
}