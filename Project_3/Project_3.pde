PImage img; 
int[]value1 = {255,255,255};
int[]value2 = {0,0,0};

boolean record;
void setup() {
  size(800, 800);
  img = loadImage("van_Gogh.jpg");
  img.resize(800, 800);
}

void draw() {
  background(value1[0],value1[1],value1[2]);
  fill(value2[0],value2[1],value2[2]);
  noStroke();
  float tiles = mouseX/3;
  float tileSize = width/tiles;
  translate(tileSize/2, tileSize/2);
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float size = map(brightness(c), 0, 255, tileSize, 0);    
      ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
}

void keyPressed() {
  saveFrame("zy-######.jpg");
}

void mouseClicked(){
  for(int i=0; i<value1.length; i++){
    value1[i]=parseInt(random(128,255));
  }
  for(int j=0; j<value1.length; j++){
    value2[j]=parseInt(random(0,128));
  }
}
