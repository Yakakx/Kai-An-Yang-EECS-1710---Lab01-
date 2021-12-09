class Node {
  
  PVector loc;
  PVector velocity = new PVector(random(-3.5,3.5), random(-3.5,3.5));
  
  Node(float x, float y){
    this.loc = new PVector(x, y);
  }
  
  void run(){
    this.display();
    this.move();
    this.bounce();
  }
 
  void display(){
    point(loc.x, loc.y);
  }
  
  void move(){
    this.loc.add(velocity);
  }
  
  void bounce(){
    if ((this.loc.x > width) || (this.loc.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((this.loc.y > height) || (this.loc.y < 0)) {
      velocity.y = velocity.y * -1;
    }    
   }
   
}
