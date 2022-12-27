int X = 0;
int Y = 100;

Player player;
Footholds footholds;

void setup() {
  size(500, 400); 
  player = new Player();
  footholds = new Footholds();
}

void draw() {
  background(200);
  player.display();
}
