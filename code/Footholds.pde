import java.util.Random;
import java.util.Collections;

class Footholds {
  int separateFH;
  int fallingFH_idx;
  int initGroundY;
  int fallSpeed;
  float fallWaitTime_sec;
  int maxFallFH_num;
  int currentFallFH_num;
  int fallCount;
  Foothold[] FHProperty;
  ArrayList<Integer> list;
  ArrayList<Integer> fallFHs_idx;
   
  Footholds() {
    // パラメーター
    separateFH = 10;
    fallingFH_idx = 0;
    initGroundY = 200;
    FHProperty = new Foothold[separateFH];
    initFHProperty();
    fallSpeed = 3;
    fallWaitTime_sec = 1.0;
    maxFallFH_num = separateFH - 1;
    currentFallFH_num = maxFallFH_num;
    fallCount = 0;

    list = new ArrayList<Integer>();
    fallFHs_idx = new ArrayList<Integer>();
  }
  
  
  
  void display() {
    for(int i = 0; i < separateFH; i++) {
      line(FHProperty[i].sX, FHProperty[i].sY, FHProperty[i].fX, FHProperty[i].fY);
    }
  }
  
  void initFHProperty() {
    fallCount += 1;
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
  
  void init() {
    fallCount = 0;
  }
  
  void fallFHs() {
    
    for(int i = 0 ; i < separateFH; i++) {
        list.add(i);
    }
    Collections.shuffle(list);
    
    for(int i = 0; i < currentFallFH_num; i++) {
      fallFHs_idx.add(list.get(i));
    }

    for(int i = 0; i < currentFallFH_num; i++) {
      FHProperty[fallFHs_idx.get(i)].sY += fallSpeed;
      FHProperty[fallFHs_idx.get(i)].fY += fallSpeed;
    }

    // FHProperty[fallFH_idx].sY += fallSpeed;
    // FHProperty[fallFH_idx].fY += fallSpeed;
  }
  
  float getGroundY(float playerX) {
    int playerOnFH_idx = (int)playerX / (width / separateFH);
    return FHProperty[playerOnFH_idx].sY;
  }
}
