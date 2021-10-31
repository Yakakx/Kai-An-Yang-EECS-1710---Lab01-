class LetterGenerator {
  
  PShape S, R, L, P, F, C, I, O;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 150;
  
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
    
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case 'S':
          letters.add(new Letter(S, px, py));
          break;
        case 'R':
          letters.add(new Letter(R, px, py));
          break;
        case 'L':
          letters.add(new Letter(L, px, py));
          break;
        case 'P':
        letters.add(new Letter(P, px, py));
        break;
        case 'F':
        letters.add(new Letter(F, px, py));
        break;
        case 'C':
        letters.add(new Letter(C, px, py));
        break;
        case 'I':
        letters.add(new Letter(I, px, py));
        break;
        case 'O':
        letters.add(new Letter(O, px, py));
        break;
      }
    }
    
  }
  void initShapes() {
    S = createShape();
    S.beginShape();
    S.translate(0,0);
    S.vertex(0,0);
    S.vertex(0,165);
    S.vertex(200,165);
    S.vertex(200,330);
    S.vertex(0,330);
    S.vertex(0,350);
    S.vertex(220,350);
    S.vertex(220,145);
    S.vertex(10,145);
    S.vertex(20,20);
    S.vertex(200,20);
    S.vertex(200,0);
    S.endShape(CLOSE);
    
    R=createShape();
    R.beginShape();
    R.translate(70,0);
    R.vertex(0,0);
    R.vertex(0,330);
    R.vertex(20,330);
    R.vertex(20,200);
    R.vertex(100,200);
    R.vertex(160,330);
    R.vertex(180,330);
    R.vertex(100,180);
    R.vertex(10,180);
    R.vertex(10,120);
    R.vertex(200,120);
    R.vertex(200,0);
    R.beginContour();
    R.vertex(20,100);
    R.vertex(20,20);
    R.vertex(180,20);
    R.vertex(180,100);
    R.endContour();
    R.endShape(CLOSE);
    
    L=createShape();
    L.beginShape();
    L.translate(130,0);
    L.vertex(0,0);
    L.vertex(0,340);
    L.vertex(200,340);
    L.vertex(200,325);
    L.vertex(20,325);
    L.vertex(20,0);
    L.endShape(CLOSE);
    
    P=createShape();
    P.beginShape();
    P.translate(190,0);
    P.vertex(0,0);
    P.vertex(0,340);
    P.vertex(20,340);
    P.vertex(20,150);
    P.vertex(200,150);
    P.vertex(200,0);
    P.beginContour();
    P.vertex(20,130);
    P.vertex(20,20);
    P.vertex(180,20);
    P.vertex(180,130);
    P.endContour();
    P.endShape(CLOSE);
    
    F=createShape();
    F.beginShape();
    F.translate(250,0);
    F.vertex(0,0);
    F.vertex(0,340);
    F.vertex(20,340);
    F.vertex(20,170);
    F.vertex(200,170);
    F.vertex(200,150);
    F.vertex(20,150);
    F.vertex(20,20);
    F.vertex(200,20);
    F.vertex(200,0);
    F.endShape(CLOSE);
    
    C=createShape();
    C.beginShape();
    C.translate(310,0);
    C.vertex(0,0);
    C.vertex(0,340);
    C.vertex(200,340);
    C.vertex(200,320);
    C.vertex(20,320);
    C.vertex(20,20);
    C.vertex(200,20);
    C.vertex(200,0);
    C.endShape();
    
    I=createShape();
    I.beginShape();
    I.translate(370,0);
    I.vertex(0,0);
    I.vertex(0,20);
    I.vertex(90,20);
    I.vertex(90,330);
    I.vertex(0,330);
    I.vertex(0,350);
    I.vertex(200,350);
    I.vertex(200,330);
    I.vertex(110,330);
    I.vertex(110,20);
    I.vertex(200,20);
    I.vertex(200,0);
    I.endShape(CLOSE);
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
