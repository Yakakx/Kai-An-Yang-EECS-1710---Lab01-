class Rain { //these codes from the youtube video "Coding Challenge#4: Purple Rain in Processing" 
 float x = random(width);
 float y = random(-50,0);
 float yspeed = random(6,15);
 float len =random(10,15);
 
 void fall(){
   y=y+yspeed;
   
   if (y>height){
     y=random(-50,0);
   }
 }
  
  void show(){
  stroke(52,45,150);
  line(x,y,x,y+len);
  }
  
  
  
}
