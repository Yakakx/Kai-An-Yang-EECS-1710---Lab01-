class Bullet extends PVector {
  PVector vel;
 
  Bullet(PVector loc, PVector vel) {
    super(loc.x, loc.y);
    this.vel = vel.get();
  }
 
  void update() {
    add(vel);
  }
 
  void display() {
    fill(211, 11, 17);
    ellipse(x, y, 10, 10);
  }
}
