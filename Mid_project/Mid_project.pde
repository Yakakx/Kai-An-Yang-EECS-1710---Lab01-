PImage cursor;
PImage rocket;
int score = 0 ;
float x = width/2; 
float y = height/2;  
float speed = 2;
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
float bulletSpeed = 5; 
PVector player;
PVector b;
float sizeA = 60;
PVector [] position;
float sizeSpeed = -0.2;
String time = "010";
int t;
int interval = 27;

void setup(){
   size(1600,900,P2D);
   cursor = loadImage("cursor.png");
   rocket = loadImage("rocket.png");
   noCursor();
   frameRate(60);
   position=new PVector[50];
   for(int i=0; i<position.length; i++){
   position[i]=new PVector(random(200,1400),random(200,900)); 
   }
}

void draw(){
  
   t = interval-int(millis()/1000);
   time = nf(t , 3);
   if(t == 0){
   interval+=10;}
   textSize(25);
   color(255,0,0);
   text(time, 800, 60);
   String intro = "Using the mouse to control the direction of the rocket, press the mouse can make the rocket accelerate! Your target is to hit the circle to get point, Good Luck!!";
   fill(255,255,255);
   textSize(14);
   text(intro, 40, 40, 400, 320);
   textSize(22);
   String record = "Score: ";
   fill(255);
   text(record+score, 1400, 40, 200, 320);
   image(cursor,mouseX,mouseY,36,36);
 
   PVector mouse = new PVector(mouseX, mouseY);
   fill(0);
   ellipse(mouseX, mouseY, 5, 5);
 
   if (mousePressed) {
    PVector dir = PVector.sub(mouse, player);
    dir.normalize();
    dir.mult(bulletSpeed*-2);
    Bullet b = new Bullet(player, dir);
    bullets.add(b);
    speed=6;
  }
  else{
   speed=1;
 }
 
  for (Bullet b : bullets) {
    b.update();
    b.display();
  }
    if(frameCount<300){
      if(sizeA>0){
      sizeA += sizeSpeed;
      fill(255);
      ellipse(position[1].x,position[1].y,sizeA,sizeA);
      }
      if(dist(position[1].x,position[1].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>300&&frameCount<450){
      sizeA+=0.4;
      if(sizeA>60){
        sizeA=60;
        }
      fill(255);
      ellipse(position[2].x,position[2].y,sizeA,sizeA);
      if(dist(position[2].x,position[2].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>450&&frameCount<600){
      if(sizeA>0){
        sizeA += 2*sizeSpeed;
      fill(255);
      ellipse(position[2].x,position[2].y,sizeA,sizeA);
      }
      if(dist(position[2].x,position[2].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>650&&frameCount<800){
      sizeA+=0.4;
      if(sizeA>60){
        sizeA=60;
        }
      fill(255);
      ellipse(position[3].x,position[3].y,sizeA,sizeA);
      if(dist(position[3].x,position[3].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>800&&frameCount<950){
      if(sizeA>0){
        sizeA += 2*sizeSpeed;
      fill(255);
      ellipse(position[3].x,position[3].y,sizeA,sizeA);
      }
      if(dist(position[3].x,position[3].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>950&&frameCount<1100){
      sizeA+=0.4;
      if(sizeA>60){
        sizeA=60;
        }
      fill(255);
      ellipse(position[4].x,position[4].y,sizeA,sizeA);
      if(dist(position[4].x,position[4].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>1100&&frameCount<1250){
      if(sizeA>0){
        sizeA += 2*sizeSpeed;
      fill(255);
      ellipse(position[4].x,position[4].y,sizeA,sizeA);
      }
      if(dist(position[4].x,position[4].y,x,y)<=50){
      score+=1000;
      }
    }
     if(frameCount>1250&&frameCount<1400){
      sizeA+=0.4;
      if(sizeA>60){
        sizeA=60;
        }
      fill(255);
      ellipse(position[5].x,position[5].y,sizeA,sizeA);
      if(dist(position[5].x,position[5].y,x,y)<=50){
      score+=1000;
      }
    }
    if(frameCount>1400&&frameCount<1500){
      if(sizeA>0){
        sizeA += 2*sizeSpeed;
      fill(255);
      ellipse(position[5].x,position[5].y,sizeA,sizeA);
      }
      if(dist(position[5].x,position[5].y,x,y)<=50){
      score+=1000;
      }
    }
   if(frameCount>1500){
     result();
   }
   bground();
   rocket();
}
 
void bground(){
   fill(0,0,22,85);
   rect(0,0,width,height);
   fill(255);
   noStroke();
   ellipse(random(width), random(height), 2.5 , 2.5);
   ellipse(random(width), random(height), 4.5 , 4.5);
}
 
void rocket(){
   float angel = atan2(mouseY-y, mouseX-x);
      if (dist(mouseX, mouseY, x, y) > speed) {
      x +=  cos(angel)*speed; 
      y +=  sin(angel)*speed;
   }
   pushMatrix();
   translate(x, y);
   player = new PVector(x,y);
   float ySpeed=3;
   y+=ySpeed;
   rotate(angel +  HALF_PI); 
   image(rocket, -35, -35 , 75, 75); 
   popMatrix();
}

 void result(){
   background(0);
   image(rocket,200,600,200,200);
   textSize(75);
   text("TIME'S UP!!",650,360,800,200);
   textSize(50);
   text("Score: "+score,665,500,800,200);
   image(cursor,mouseX,mouseY,36,36);
 }
