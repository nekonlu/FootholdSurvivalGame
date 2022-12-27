class Footholds {
  int separateFH;
  int fallingFH_idx;
  int initGroundY;
  Foothold[] FHProperty;
   
  Footholds() {
    separateFH = 5;
    fallingFH_idx = 0;
    initGroundY = 200;
    FHProperty = new Foothold[separateFH];
    initFHProperty();
  }
  
  void initFHProperty() {
    int oneFH_sX = 0;
    int oneFH_len = width / separateFH;
    for(int i = 0; i < separateFH; i++) {
      FHProperty[i] = new Foothold();
      FHProperty[i].sX = oneFH_sX;
      FHProperty[i].sY = initGroundY;
      FHProperty[i].fX = oneFH_sX + oneFH_len;
      FHProperty[i].fY = initGroundY;
      oneFH_sX += oneFH_len;
    }
  }
  
  void display() {
    FHProperty[0].sY -= 0.1;
    FHProperty[0].fY -= 0.1;
    for(int i = 0; i < separateFH; i++) {
      line(FHProperty[i].sX, FHProperty[i].sY, FHProperty[i].fX, FHProperty[i].fY);
    }
  }
  
  void move() {
    
  }
  
  float getGroundY(float playerX) {
    int playerOnFH_idx = (int)playerX / 100;
    return FHProperty[playerOnFH_idx].sY;
  }
}
