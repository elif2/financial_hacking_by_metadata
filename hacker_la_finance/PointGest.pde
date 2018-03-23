ArrayList<Point> tabPoints = new ArrayList<Point>();

void drawPoint() {
  for (int i=0; i<tabPoints.size(); i++) {
    tabPoints.get(i).draw();
    if (i>0) {
      if (tabPoints.get(i-1).x < width && tabPoints.get(i).x != 0) {
        stroke(59, 98, 170);
        strokeWeight(2);
        line(
          tabPoints.get(i-1).x, 
          -tabPoints.get(i-1).y, 
          tabPoints.get(i).x, 
          -tabPoints.get(i).y
          );
      }
      if (tabPoints.get(i-1).x >= width) {
        fill(240, 80);
        noStroke();
        pushMatrix();
        translate(0, -780);
        rectMode(CORNER);
        rect(0, 0, width, height);
        popMatrix();
      }
    }
  }
}

//________________________________________________________
//Class point
//________________________________________________________

class Point {
  float x=0;
  float y=0;

  Point(float x, float y) {
    this.x=x;
    this.y=y;
  }
  void draw() {
    rectMode(CENTER);
    fill(59, 98, 170);
    rect(x, -y, 1, 1);
    
  }
}