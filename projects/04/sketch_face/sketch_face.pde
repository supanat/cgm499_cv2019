import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup(){
  size(640,480);
  video = new Capture(this,width/2,height/2);
  opencv = new OpenCV(this,width/2,height/2);
  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  video.start();

}

void draw(){
  scale(2);
  opencv.loadImage(video);
  image(video,0,0);
  
  Rectangle[] faces = opencv.detect();
  println(faces.length);
 
  noFill();
  stroke(0,255,0);
  for(int i=0;i<faces.length;i++){
  
      rect(faces[i].x,faces[i].y,
        faces[i].width,faces[i].height);
  }
  
}

void captureEvent(Capture c){
  c.read();
}
