import processing.video.*;

Capture cam;

color targetColor;

void setup(){
  
  
  println(Capture.list());
  
  size(960,544);
  cam = new Capture(this,width,height,30);
  
  cam.start();
  smooth();
  
  targetColor = color(255,0,0);

}

void draw()
{
  if(cam.available()){
    cam.read();
  }
  
  
  fill(targetColor);
  rect(0,0,50,50);
         
  cam.loadPixels(); 
  image(cam,0,0);
  
  
  
  float similarity = 1000;
  int closetX = 0;
  int closetY = 0;
  
  for(int x=0;x<cam.width;x++){
    for(int y=0;y<cam.height;y++){
      
      int index = x+y*cam.width;
      
      color currentColor = cam.pixels[index];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      
      float r2 = red(targetColor);
      float g2 = green(targetColor);
      float b2 = blue(targetColor);
      
      // euclidean distance
      float d = dist(r1,g1,b1,r2,g2,b2);
      
      //println(d);
      
      if(d<similarity){
        similarity = d;
        closetX = x;
        closetY = y;
      }
      
    
      


    }
    
  }
  
    // threshold
    if(similarity < 10){
      
         fill(targetColor);
         strokeWeight(2.0);
         stroke(0);
         
         //stroke(204,102,0);
         
         rect(closetX,closetY,50,50);
      }
  
}

void mousePressed(){

    targetColor = cam.pixels[mouseX+mouseY*cam.width];
}
