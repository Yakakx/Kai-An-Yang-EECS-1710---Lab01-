Star[] stars = new Star[100];
Planet[] planets = new Planet[4];
float hr = hour();
float sc = second();
float mn = minute();

void setup() {
  size(800, 600, P2D);
  frameRate(120);
  for(int i=0 ;i < stars.length; i++){
   stars[i] = new Star();
   stars[i].X = (int)random(-400,400);
   stars[i].Y = (int)random(-300,300);
 }
  planets[0] = new Planet("Sun");
  planets[1] = new Planet("Earth");
  planets[2] = new Planet("Moon");
  planets[3] = new Planet("Moon2");
}

void draw() {
  background(0);
  
  int middleX = width/2;
  int middleY = height/2;
  noStroke();
  
  for(Planet p : planets){
    if(p.Name.equals("Sun")){
      translate(middleX, middleY);
      fill(220, 220, 0);
      ellipse(0, 0, 90, 90);
    }
  }
  
  for(Planet p : planets){
    if(p.Name.equals("Earth")){
      pushMatrix();
      rotate(hr);
      translate(200, 0);
      fill(50, 200, 255);
      ellipse(0, 0, 40, 40);
   }
  }
  
  for(Planet p : planets){
    if(p.Name.equals("Moon")){
      pushMatrix(); 
      rotate(mn);
      translate(60, 0);
      fill(50, 255, 200);
      ellipse(0, 0, 12, 12);
      popMatrix();
    }
  }

  for(Planet p : planets){
    if(p.Name.equals("Moon2")){
      pushMatrix();
      rotate(-sc);
      translate(40, 0);
      fill(247, 255, 158);
      ellipse(0, 0, 6, 6);
      popMatrix();
    }
  }

  popMatrix();

  hr+=0.0005;
  mn+=0.008;
  sc+=0.05;
  drawStars();
}
void drawStars(){
  
  for(Star s: stars){
    stroke(255,255,255);
    fill(255,255,255);
    ellipse(s.X, s.Y, 1, 1);
   }
   
}
