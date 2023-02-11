import java.util.Random;
import java.util.Collections;

class GameScene {
  int FRAMERATE;
  String gameState;
  int fall_idx;
  
  //  インスタンスの生成
  Player player;
  Footholds footholds;
  
  // 難易度パラメーター
  int fallSpeed;
  int playerSpeed;
  int separateFH;
  int currentFallFH_num;
  float fallFHinterval_sec; 
  
  Random rand;
  
  GameScene() {
    FRAMERATE = 60;
    gameState = "";
    
    fallSpeed = 3;     
    playerSpeed = 5;
    separateFH = 10;
    currentFallFH_num = 3;
    fallFHinterval_sec = 3; 
    rand = new Random();
    
    player = new Player();
    footholds = new Footholds();
  
    // 難易度パラメーターの適用
    footholds.fallSpeed = fallSpeed;
    player.playerSpeed = playerSpeed;
    footholds.separateFH = separateFH;
    footholds.currentFallFH_num = currentFallFH_num;
  }
  
  void display() {
    background(200);
  
    // スコアテキスト
    player.display();
    dispFallCount();
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
  
  void dispFallCount() {
    text(String.valueOf(footholds.fallCount), 100, 100);
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
}
