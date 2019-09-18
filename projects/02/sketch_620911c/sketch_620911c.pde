
import processing.video.*;

Capture webcam;

int scale=12;
int cols,rows;


void setup()
{
  size(640,480);
  println(Capture.list());
  
  cols = width/scale;
  rows = height/scale;
  
  webcam = new Capture(this,640,480,60);
  webcam.start();
  
}

void captureEvent(Capture webcam)
{
  webcam.read();
}

void draw()
{
  
  background(255);
  
  //image(webcam,0,0);
  
  loadPixels();
  webcam.loadPixels();
  
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      
      int x = i*scale;
      int y = j*scale;
      
      float distance = dist(x,y,mouseX,mouseY);
      float radius = 200;
      float adjustBrightness = (radius-distance)/radius;
      
      
      color c = webcam.pixels[x+y*webcam.width];
    
    
    
      
      c = color(red(c)*adjustBrightness,green(c)*adjustBrightness,blue(c)*adjustBrightness);
      
      fill(c);
      rect(x,y,scale,scale);
      //ellipse(x,y,scale,scale);
     
    
    }
  
  }
  
  //updatePixels();
}
