PImage tree1,tree2,backgroundRain, backgroundSun,sapling,smallTree, mediumTree,grass,sun, cursor,apple;
PVector smallTreeLocation, growingSpeed, treeSize1, treeLocation, saplingLocation, grassLocation1, grassLocation2, grassLocation3,
grassLocation4, grassLocation5, grassLocation6, grassLocation7, grassLocation8,grassLocation9,grassGrowingSpeed,grassSize,sunLocation,sunSpeed, appleLocation, appleFall;


Rain [] rains = new Rain[200];//these codes from the youtube video "Coding Challenge#4: Purple Rain in Processing" 


void setup(){
     size(800,600,P2D);
     tree1=loadImage("tree1.png");
     tree2=loadImage("tree2.png");
     backgroundRain= loadImage("Background_rain.png");
     backgroundSun=loadImage("Background.png");
     sapling= loadImage("sapling.png");
     smallTree= loadImage("smallTree.png");
     mediumTree=loadImage("mediumTree.png");
     grass=loadImage("grass.png");
     sun= loadImage("sun.png");
     cursor=loadImage("cursor.png");
     apple=loadImage("apple.png");
     smallTreeLocation=new PVector(565,425);
     treeLocation=new PVector(615,315);
     treeSize1=new PVector(300,300);
     growingSpeed=new PVector(1.5,2);
     saplingLocation=new PVector(600,500);
     grassGrowingSpeed=new PVector(0.001,0.001);
     grassSize= new PVector(0.1,0.1);
     appleLocation= new PVector(random(10,500),30);
     appleFall = new PVector(0,1);
     
    
     grassLocation1 = new PVector(random(0,530),random(500,520));
     grassLocation2 = new PVector(random(0,530),random(500,520));
     grassLocation3 = new PVector(random(0,530),random(500,520));
     grassLocation4 = new PVector(random(0,530),random(500,520));
     grassLocation5 = new PVector(random(0,530),random(500,520));
     grassLocation6 = new PVector(random(0,530),random(500,520));
     grassLocation7 = new PVector(random(0,530),random(500,520));
     grassLocation8 = new PVector(random(0,530),random(500,520));
     grassLocation9 = new PVector(random(0,530),random(500,520));
    
     sunLocation= new PVector(0,200);
     sunSpeed= new PVector(1,-1);
      
      for(int i =0; i< rains.length; i++){
        rains[i] = new Rain();
      }
 
}

void draw(){
     
     imageMode(CORNER);
     image(backgroundRain,0,0,800,600);
     for(int i =0; i< rains.length; i++){
     rains[i].fall();
     rains[i].show();
     //rain makes the tree and grass grow up
     grassSize.add(grassGrowingSpeed);
     noCursor();
     
     
     image(grass,grassLocation1.x,grassLocation1.y,grassSize.x,grassSize.y);
     image(grass,grassLocation2.x,grassLocation2.y,grassSize.x,grassSize.y);
     image(grass,grassLocation3.x,grassLocation3.y,grassSize.x,grassSize.y);
     image(grass,grassLocation4.x,grassLocation4.y,grassSize.x,grassSize.y);
     image(grass,grassLocation5.x,grassLocation5.y,grassSize.x,grassSize.y);
     image(grass,grassLocation6.x,grassLocation6.y,grassSize.x,grassSize.y);
     image(grass,grassLocation7.x,grassLocation7.y,grassSize.x,grassSize.y);
     image(grass,grassLocation8.x,grassLocation8.y,grassSize.x,grassSize.y);
     image(grass,grassLocation9.x,grassLocation9.y,grassSize.x,grassSize.y);
     if(grassSize.x>30){
       grassSize.x=30;
     }
     if(grassSize.y>30){
       grassSize.y=30;
     }
     }     
     if(frameCount<150){
        image(sapling,600,500,30,30);
     }
     if((frameCount>150)&&(frameCount<300)){
        image(smallTree,smallTreeLocation.x,smallTreeLocation.y,100,100);
     }
     if((frameCount>300)&&(frameCount<450)){
        image(mediumTree,510,330,200,200);
     }
     if(frameCount>450){
        image(backgroundSun,0,0,800,600);
        
        imageMode(CENTER);
        image(tree1,treeLocation.x,treeLocation.y,treeSize1.x,treeSize1.y);
        treeSize1.add(growingSpeed);
        image(grass,grassLocation1.x,grassLocation1.y,grassSize.x,grassSize.y);
        image(grass,grassLocation2.x,grassLocation2.y,grassSize.x,grassSize.y);
        image(grass,grassLocation3.x,grassLocation3.y,grassSize.x,grassSize.y);
        image(grass,grassLocation4.x,grassLocation4.y,grassSize.x,grassSize.y);
        image(grass,grassLocation5.x,grassLocation5.y,grassSize.x,grassSize.y);
        image(grass,grassLocation6.x,grassLocation6.y,grassSize.x,grassSize.y);
        image(grass,grassLocation7.x,grassLocation7.y,grassSize.x,grassSize.y);
        image(grass,grassLocation8.x,grassLocation8.y,grassSize.x,grassSize.y);
        image(grass,grassLocation9.x,grassLocation9.y,grassSize.x,grassSize.y);
        if(treeSize1.y>height){
             treeSize1.y=height;
        }
        if(treeSize1.x>550){
             treeSize1.x=550;
        }
        sunLocation.add(sunSpeed);
        image(sun,sunLocation.x,sunLocation.y,150,150);
        if(sunLocation.x>100){
          sunSpeed.x =-sunSpeed.x;
        }
        else if(sunLocation.x<0){
          sunSpeed.x =-sunSpeed.x;
        }
        if(sunLocation.y<100){
          sunSpeed.y =-sunSpeed.y;
        }
        else if(sunLocation.y>200){
          sunSpeed.y =-sunSpeed.y;
        }
        //make the sun move in the certain range
        
        if((mousePressed)&&(mouseButton==LEFT)){
          image(apple,mouseX,appleLocation.y+=10,20,20);
        }
        else if(appleLocation.y>height){
          appleLocation.y=30;
        }
        //When the mouse pressed, the apple will fall donw from the sky
     }
     //turn to sunny day and the tree grew up
     if(frameCount>550){
         if((mouseX>450)&&(mouseY<350)){
          image(tree2,615,315,550,600);
        }//if move the watering can to the leaf of the tree, the emotion of tree will change
     }
     image(cursor,mouseX,mouseY,50,50);
}

//if click the mouse the apple will appear on the tree
