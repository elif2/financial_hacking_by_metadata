ArrayList<Point> tabPoints = new ArrayList<Point>();


void drawPoint(){
  for(int i=0;i<tabPoints.size();i++){
    tabPoints.get(i).draw();
    if(i>0){
      line(
        tabPoints.get(i-1).x,
        tabPoints.get(i-1).y,
        tabPoints.get(i).x,
        tabPoints.get(i).y
      );
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
  void draw(){
    rectMode(CENTER);
    rect(x,y,4,4);  
  }
}