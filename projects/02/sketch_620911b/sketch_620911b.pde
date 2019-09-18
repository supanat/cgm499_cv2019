
import processing.video.*;

Capture webcam;

void setup()
{
  size(640,480);
  println(Capture.list());
  
  webcam = new Capture(this,640,480,60);
  webcam.start();
  
}

void captureEvent(Capture webcam)
{
  webcam.read();
}

void draw()
{
  image(webcam,0,0);
  
  loadPixels();
  webcam.loadPixels();
  
  for(int x=0;x<webcam.width;x++){
    for(int y=0;y<webcam.height;y++){
    
        int index = x+y*webcam.width;
        
        float r = red(webcam.pixels[index]);
        float g = green(webcam.pixels[index]);
        float b = blue(webcam.pixels[index]);
        
        float distance = dist(x,y,mouseX,mouseY);
        float radius = 150;
 
        
        float adjustBrightness = (radius-distance)/radius; //normalize
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
        
        b *=2;
        
        color outColor = color(r,g,b);
        pixels[index] = outColor;

    
    }
  
  }
  
  updatePixels();
}
