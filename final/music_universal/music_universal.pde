import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer player;
FFT fft;
int imgaeXpos=0;
Particle[]pts;
PVector[]vertices;
int s;
PImage img;
float n1;
float n4;
Node[] nodes = new Node[1500];
float x, y, x2, y2, rad, rad2, dist, dist2;
float deg, incr, yIn, rotateBy, ang;

void setup() {
  fullScreen();
  frameRate(144);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("music2.mp3", 1024);
  fft = new FFT(player.bufferSize(), player.sampleRate());
  background(0);
  println(player.bufferSize());
  incr = 1; 
  rad = -20;
  rad2 = -160;
  dist = 550;
  dist2 = 550;
  player.loop();
  for(int i = 0; i < nodes.length; i++){
    nodes[i] = new Node(random(width), random(height));
  }

  pts=new Particle[2048];
  color b=#F5BCEE;
  color c=#DE5CDC;
  for (int i=0; i<pts.length/2; i++) {
    pts[i]=new Particle(i, c);
  }

  for (int i=pts.length/2; i<pts.length; i++) {
    pts[i]=new Particle(i-1024, b);
  }

  vertices=new PVector[1024];
  for (int i=0; i<vertices.length; i++) {
    vertices[i]=new PVector(map(i, 0, vertices.length, 0, width), height/2);
  }
}

void draw() {
  
  float amp;

  if (key == '1') {
    centerEllipse();
  }
  else if (key == '2') {
    noStroke();
    fill(0, 50);
    rect(0, 0, width, height);
    fill(random(0, 5), 255, 255);
    jumpingLine();
    for (int i=0; i<pts.length/2; i++) {
      amp=abs(player.left.get(i));
      pts[i].update(amp*4);
      pts[i].display(amp*4);
    }

    for (int i=pts.length/2; i<pts.length; i++) {
      amp=abs(player.right.get(i-1024));
      pts[i].update(amp*4);
      pts[i].display(amp*4);
    }
    updateVertices();
  } 
  else if (key== '3'){
    node();
  }
  else if (key== '4'){
    storm();
  }
  else if (key== ESC){
    exit();
  }
  else{
    background(0);
    fill(#EAEAEA);
    textAlign(CENTER);
    textSize(70);
    text("Kai-An Yang Final Project\nPlease use four different keys: 1, 2, 3 and 4\nto change the presentationn modes!!\nPress your mouse to save the image into the folder",width/2,height/3);
  }
}

void updateVertices() {
  for (int i=0; i<vertices.length; i++) {
    vertices[i].y+=(height/2+player.mix.get(i)*100-vertices[i].y)*0.8;
  }
}


void jumpingLine() {
  pushStyle();
  strokeWeight(3);
  float amp;
  float c=map(sin(frameCount*0.002), -1, 1, 0, 255);

  for (int i=0; i<pts.length/2; i++) {
    amp=abs(player.left.get(i));
    stroke( amp*255, amp*255, c/3);
  }
  noFill();
  beginShape();

  for (int i=0; i<player.bufferSize(); i+=4) {
    vertex(vertices[i].x, vertices[i].y);
  }
  endShape();
}

void node(){
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);
  fft.forward(player.mix);
  
    for(int i = 0; i < nodes.length; i++){
      float freq = fft.getFreq(dist(nodes[i].loc.x, nodes[i].loc.y, width/2, height/2)*1.6); 
    
    strokeWeight(freq/10);
    stroke(#310E3B);
    for(int j = i + 1; j < nodes.length; j++){
      Node other = nodes[j];
      float dist = (nodes[i].loc.dist(other.loc));
      if (dist > 0 && dist <37){
        line(nodes[i].loc.x, nodes[i].loc.y, other.loc.x, other.loc.y);
      }
    }
    stroke(255);
    nodes[i].run();
  }
}

void centerEllipse () {
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    float angle = sin(i+n4)* 10; 
    n1=map(sin(frameCount*0.008), -1, 1, -1000, 1000);
    float x3 = sin(radians(i))*(1000/angle); 
    float y3 = cos(radians(i))*(n1/angle);
    noStroke();
    fill (#F5BCEE, 78); 
    ellipse(x3, y3, player.left.get(i)*35, player.left.get(i)*35);
  }
  popMatrix();
}

void storm() {
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);
  fill(#F5BCEE);
  
  rotateBy += .003;
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotateBy);
  deg = 0;
  while (deg <= 360) {
    deg += incr;
    ang = radians(deg);
    x = cos(ang) * (rad + (dist * noise(y/100, yIn)));
    y = sin(ang) * (rad + (dist * noise(x/80, yIn)));
    ellipse(x, y, 4, 4);
    x2 = sin(ang) * (rad2 + (dist2 * noise(y2/10, yIn)));
    y2 = cos(ang) * (rad2 + (dist2 * noise(y2/10, yIn)));
    ellipse(x2, y2, 1, 1);
  }
  yIn += .005;
  popMatrix();
  rotateBy += player.mix.level()*0.03;
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotateBy);
  deg = 0;
  while (deg <= 360){
    for (int i=0; i < player.bufferSize()/30; i++) {
      deg += incr;
      ang = radians(deg);
      x = cos(i) * (rad + ((dist)* noise(y/50, yIn)));
      y = sin(i) * (rad + ((dist+player.mix.level()*100) * noise(x/480, yIn)));
      ellipse(x*1, y*1, 3.5, 3.5);
      x2 = sin(i) * (rad2 + (dist2 * noise(y2/player.mix.level()*30, yIn)));
      y2 = cos(i) * (rad2 + (dist2 * noise(y2/player.mix.level()*30, yIn)));
      ellipse(x2*20, y2*20, 2, 2);
      box(player.mix.level()*150);
    }
  }
  yIn += 0.003;
  popMatrix();
}


void mousePressed(){
  //saveFrame("##-img.jpg");
}
