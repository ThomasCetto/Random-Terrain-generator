int size = 20, w=1200, h=1600, row=w/size, col=h/size;
float[][] mat = new float[col][row];
float off=0, speed=0;
float high=0;

void setup(){
  size(800, 800, P3D);
  stroke(255);
  strokeWeight(1.25);
  noFill();
}

void draw(){
  background(30); 
  textSize(18);
  text("3D terrain generation", width/2 - 100, 50);
  textSize(12);
  text("Speed: " + round(speed*600), width-100, 25);
  text("Drop: " + round(high * 10), width-100, 40);
  
  
  translate(width/2, height/2 + 50);
  rotateX(PI/3);
  translate(-w/2 - 200, -h/2);
  
  calculateMatrix();
  drawTerrain();
  
}

void drawTerrain(){
  for(int y=0; y<row-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<col; x++){
      vertex(x*size, y*size, mat[x][y]);
      vertex(x*size, (y+1)*size, mat[x][y+1]);
    }
    endShape();
  } 
}

void calculateMatrix(){
  speed = map(mouseY, 0, height, 0, 0.15);
  high = map(mouseX, 0, width, 0, 3.5);
  
  off-=speed;
  float yOff=off;
  for(int y=0; y<row; y++){
    float xOff=0;
     for(int x=0; x<col; x++){
         mat[x][y] = map(noise(xOff, yOff), 0, 1, -50 * high, 50 * high);
         xOff+=0.2;
     }
     yOff+=0.2;
  }
}
