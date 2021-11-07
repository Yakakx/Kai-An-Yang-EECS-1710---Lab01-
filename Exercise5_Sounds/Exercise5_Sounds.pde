import processing.sound.*;
SoundFile correct, wrong, theme;
String time = "010";
int t;
int interval = 200;
String gameState;
int score = 0;
boolean click = false;

void setup(){
  size(1200,800,P2D);
  frameRate(60);
  correct = new SoundFile(this, "correct.wav");
  wrong = new SoundFile(this, "wrong.mp3");
  theme = new SoundFile(this, "theme.mp3");
  theme.loop();
  theme.amp(0.4);
  gameState = "START";
}
void mouseClicked(){
  if(click == false){
    click=true;
  }
}
void draw(){
  background(64, 110, 142);
  if(gameState== "START"){
    startGame();
  }
  else if(gameState== "PLAY"){
    question1();
  }
  else if(gameState== "question2"){
    question2();
  }
  else if(gameState== "question3"){
    question3();
  }
  else if(gameState== "question4"){
    question4();
  }
  else if(gameState== "question5"){
    question5();
  }
  else if(gameState== "END"){
    end();
  }
}
void startGame(){
  textAlign(CENTER);
  textSize(50);
  fill(203, 247, 237);
  text("Click anywhere to start",width/2,height/2);
  if (click == true){
    gameState = "PLAY";
    click=false;
  }
}
void question1(){
   t = interval-int(millis()/1000);
   time = nf(t , 0);
   if(t == -1){
   interval+=200;
   }
   textSize(25);
   color(255,0,0);
   fill(255);
   text(time, 600, 60);
   text("Score: "+score,1000,60);
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("What city is the capital of Canada?",width/2,height/2);
   fill(255);
   rect(200,600,300,100);
   rect(700,600,300,100);
   textSize(30);
   fill(0);
   text("Ottawa",350,660);
   text("Toronto",850,660);
   if(mouseX>200 && mouseX<500 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     correct.play();
     score+=10000;
     gameState = "question2";
     click=false;
     if(score>10000){
       score=10000;
     }
   }
   else if(mouseX>700 && mouseX<1000 && mouseY>600 && mouseY<700 && mouseY<700 && click==true){
     wrong.play();
     gameState = "question2";
     click=false;
   }
}
void question2(){
   t = interval-int(millis()/1000);
   time = nf(t , 0);
   if(t == -1){
   interval+=200;
   }
   textSize(25);
   color(255,0,0);
   fill(255);
   text(time, 600, 60);
   text("Score: "+score,1000,60);
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("Which city is the capital of Taiwan?",width/2,height/2);
   fill(255);
   rect(200,600,300,100);
   rect(700,600,300,100);
   textSize(30);
   fill(0);
   text("Kaohsiung",350,660);
   text("Taipei",850,660);
   if(mouseX>700 && mouseX<1000 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     correct.play();
     score+=10000;
     click=false;
     gameState = "question3";
     if(score>20000){
       score=20000;  
     }
   }
   else if(mouseX>200 && mouseX<500 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     wrong.play();
     click=false;
     gameState = "question3";
   }
}
void question3(){
  t = interval-int(millis()/1000);
   time = nf(t , 0);
   if(t == -1){
   interval+=200;
   }
   textSize(25);
   color(255,0,0);
   fill(255);
   text(time, 600, 60);
   text("Score: "+score,1000,60);
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("Which city is the capital of the US?",width/2,height/2);
   fill(255);
   rect(200,600,300,100);
   rect(700,600,300,100);
   textSize(30);
   fill(0);
   text("New York",350,660);
   text("Washington D.C.",850,660);
   if(mouseX>700 && mouseX<1000 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     correct.play();
     score+=10000;
     click=false;
     gameState = "question4";
   }
   else if(mouseX>200 && mouseX<500 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     wrong.play();
     click=false;
     gameState = "question4";
   }
}
void question4(){
  t = interval-int(millis()/1000);
   time = nf(t , 0);
   if(t == -1){
   interval+=200;
   }
   textSize(25);
   color(255,0,0);
   fill(255);
   text(time, 600, 60);
   text("Score: "+score,1000,60);
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("Which city is the capital of Korea?",width/2,height/2);
   fill(255);
   rect(200,600,300,100);
   rect(700,600,300,100);
   textSize(30);
   fill(0);
   text("Seoul",350,660);
   text("Pusan",850,660);
   if(mouseX>200 && mouseX<500 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     correct.play();
     score+=10000;
     click=false;
     gameState = "question5";
   }
   else if(mouseX>700 && mouseX<1000 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     wrong.play();
     click=false;
     gameState = "question5";
   }
}
void question5(){
   t = interval-int(millis()/1000);
   time = nf(t , 0);
   if(t == -1){
   interval+=200;
   }
   textSize(25);
   color(255,0,0);
   fill(255);
   text(time, 600, 60);
   text("Score: "+score,1000,60);
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("Which city is the capital of Spain?",width/2,height/2);
   fill(255);
   rect(200,600,300,100);
   rect(700,600,300,100);
   textSize(30);
   fill(0);
   text("Madrid",350,660);
   text("Barcelona",850,660);
   if(mouseX>200 && mouseX<500 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     correct.play();
     score+=10000;
     click=false;
     gameState = "END";
   }
   else if(mouseX>700 && mouseX<1000 && mouseY>600 && mouseY<700 && mouseY<700 && click == true){
     wrong.play();
     click=false;
     gameState = "END";
   }
}
void end(){
   textAlign(CENTER);
   textSize(50);
   fill(203, 247, 237);
   text("Game Over!! Your Score is: "+score,width/2,height/2);
}
