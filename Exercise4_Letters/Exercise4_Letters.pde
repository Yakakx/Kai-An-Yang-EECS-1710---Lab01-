LetterGenerator lg;
String input = "SRLPFCI";

void setup(){
  size(1600,800,P2D);
  lg = new LetterGenerator(input, 0, height/2);
}

void draw(){
  background(209,255,215);
  lg.run();
}
