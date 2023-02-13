import java.util.Random;
import java.util.Collections;

class GameScene {
  int FRAMERATE;
  String gameState;
  int fall_idx;
  int score;
  int background;
  
  //  インスタンスの生成
  Player player;
  Footholds footholds;
  
  // 難易度パラメーター
  int fallSpeed;
  int playerSpeed;
  int separateFH;
  int currentFallFH_num;
  int level;
  float fallFHinterval_sec; 
  
  Random rand;
  
  GameScene() {
    FRAMERATE = 60;
    gameState = "";
    score = 0;
    background = 200;
    
    fallSpeed = 3;     
    playerSpeed = 5;
    separateFH = 10;
    currentFallFH_num = 3;
    fallFHinterval_sec = 3; 
    level = 1;
    rand = new Random();
    
    player = new Player();
    footholds = new Footholds();
  
    // 難易度パラメーターの適用
    updateDiff();
  }
  
  void updateDiff() {
    footholds.fallSpeed = fallSpeed;
    player.playerSpeed = playerSpeed;
    footholds.separateFH = separateFH;
    footholds.currentFallFH_num = currentFallFH_num;
  }
  
  void display() {
    background(background);
  
    // スコアテキスト
    player.display();
    footholds.display();
    dispText();
  
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
      textSize(32);
      textAlign(CENTER);
      text(gameState, width / 2, height / 2);
      text("Please the ESC key", width / 2, height / 2 + 30);
    } else {
      gameState = "";
    }
    
  }
  
  void fallFHs() {
    if(frameCount % (int)(fallFHinterval_sec * FRAMERATE) == 0 && gameState == "") {
      footholds.list.clear();
      footholds.fallFHs_idx.clear();
      footholds.initFHProperty();
      levelUp();
    } else {
      footholds.fallFHs();
    }
  }
  
  void dispText() {
    text("Level: " + String.valueOf(level), 60, 40); 
    text("Score: " + String.valueOf(score), 60, 80);
    text("Stage: " + String.valueOf(footholds.fallCount), 60, 120);
  }
  
  void levelUp() {
    score += 1;
    if(footholds.fallCount % 5 == 0) {
      fallFHinterval_sec *= 0.99;
      level += 1;
      score += 10;
    }
    if(footholds.fallCount % 10 == 0) {
      currentFallFH_num += 1;
      level += 1;
      score += 30;
      background -= 30;
    }
    
    updateDiff();
  }
  
  void initGame() {  
    // footholds
    footholds.initFHProperty();
    footholds.init();
    
    // GameScene
    gameState = "";
    fallSpeed = 3;     
    playerSpeed = 5;
    separateFH = 10;
    currentFallFH_num = 3;
    fallFHinterval_sec = 3; 
    level = 1;
    score = 0;
    
    // player
    player.initPlayer();
  }
}
