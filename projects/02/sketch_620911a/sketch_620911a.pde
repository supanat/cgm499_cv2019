
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
}
