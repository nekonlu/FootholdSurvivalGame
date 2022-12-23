int X = 0;
int Y = 100;

Player player;

void setup() {
  size(500, 400); 
  player = new Player();
}

void draw() {
  background(200);
  player.display();
  line(0, 200, width, 200);
}
