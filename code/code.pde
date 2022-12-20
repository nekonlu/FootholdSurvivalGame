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
}

void keyPressed() {
  if(key == 'A' || key == 'a') {
    player.X -= 10;
  } else if(key == 'D' || key == 'd') {
    player.X += 10;
  }
}
