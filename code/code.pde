import java.util.Random;

int X = 0;
int Y = 100;

int fall_idx;

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
  player.groundY = footholds.getGroundY(player.X);
  
  if(frameCount % 120 == 0) {
    fall_idx = rand.nextInt(5);
    footholds.initFHProperty();
  } else {
    footholds.fallFH(fall_idx);
  }
}
