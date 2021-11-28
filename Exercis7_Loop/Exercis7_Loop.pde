float angle;

void setup(){
  size(800,800);
  strokeWeight(3);
  stroke(255);
  fill(205,15,30);
}

void draw(){
  background(0);
  float x = width;
  float dia = 90;
  int num = 350;
  translate(width/2, height/2);
  for (int a=0; a<360; a+=25){
    rotate(radians(a));
    pushMatrix();  
    for (int i=0; i<num; i+=3){
      scale(0.95);
      rotate(radians(angle));
      rect(x,0,dia,dia);
    }
    popMatrix();
  };
  angle+=0.1;
}
