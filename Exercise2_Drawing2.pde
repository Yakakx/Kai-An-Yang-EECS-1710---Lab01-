PImage bgImg;
PImage rabbit;
PImage bird;
PImage tree;
PImage flower;
PImage cursor;
float x;
float y;
int x1, y1;
float y2=100, x2=20;

void setup(){
   size(1200,800,P2D);
   rabbit=loadImage("rabbit.png");
   bgImg=loadImage("Forest(1).jpg");
   bird=loadImage("bird.png");
   tree=loadImage("tree.png");
   flower=loadImage("Flower.png");
   cursor=loadImage("cursor.png");
}

void draw(){
   noCursor();
   image(bgImg,0,0,1200,800);
   image(rabbit,x,y,150,250);
   image(tree,240,700,x2,-y2);
   image(bird,x1,y1,200,150);
   image(cursor,mouseX,mouseY,40,40);
   
   if(frameCount>=50){
     image(flower,100,643,50,50);
   }
     if(frameCount>=200){
     image(flower,300,674,50,50);
   }
     if(frameCount>=500){
     image(flower,877,674,50,50);
   }
     if(frameCount>=650){
     image(flower,574,700,50,50);
   }
     if(frameCount>=800){
     image(flower,933,657,50,50);
   }
   if(frameCount>=350){
     image(flower,244,666,50,50);
   }
     if(frameCount>=950){
     image(flower,760,649,50,50);
   }
     if(frameCount>=1100){
     image(flower,605,682,50,50);
   }
     if(frameCount>=1250){
     image(flower,470,672,50,50);
   }
     if(frameCount>=1400){
     image(flower,831,692,50,50);
   }
   x--;y--;
   x1++;y1++;
   y2+=0.6;x2+=0.33;
   if(y>460){
     y--;
   }
   else if(y<=430){
     y=460;
   }
   if(x<0){
     x=1100;
  }
   if(x1>1100){
     x1=0;
   }
   y1=100;
   if(y2>=650){
     y2=650;
   }
   if(x2>=300){
     x2=300;
   }
}   
