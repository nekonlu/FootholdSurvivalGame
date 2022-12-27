import java.util.Random;

int FRAMERATE = 60;

int X = 0;
int Y = 100;

int fall_idx;
float fallOneFHinterval_sec = 3.0;

Player player;
Footholds footholds;

Random rand = new Random();

void setup() {
  size(500, 400); 
  player = new Player();
  footholds = new Footholds();
}

void draw() {
  background(200);
  player.display();
  footholds.display();
  
  // プレイヤー直下の地面のY座標取得のため、footholds.getGroundY()を実行
  // そして取得した値をplayer.groundYに代入
  player.groundY = footholds.getGroundY(player.X);
  
  if(frameCount % (fallOneFHinterval_sec * FRAMERATE) == 0) {
    fall_idx = rand.nextInt(footholds.separateFH);
    footholds.initFHProperty();
    fallOneFHinterval_sec -= 0.1;
    println(fallOneFHinterval_sec);
  } else {
    footholds.fallFH(fall_idx);
  }
}