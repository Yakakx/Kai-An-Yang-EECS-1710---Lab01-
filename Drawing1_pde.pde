void setup(){
  size(800,800);
  background(#F2FAFF);
}
  void draw(){
    if (mousePressed && (mouseButton == LEFT)){ 
    float rgb1 = random(100,150);
    float rgb2 = random(170,210);
    float rgb3 = random(210,256);
    color col = color(rgb1,rgb2,rgb3);
    ellipse(mouseX,mouseY,pmouseX/5,pmouseY/5);
    fill(col);
    stroke(30);
    strokeWeight(0.5);
    }
    else if(mousePressed && (mouseButton == RIGHT)){
      ellipse(mouseX,mouseY,100,100);
      color backColor = color(#F2FAFF);
      fill(backColor);
      noStroke();
   }
  }
