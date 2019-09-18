import processing.video.*;

Capture cam;

PImage bgImage;
float threshold = 80;

PImage photo;


void setup(){
  
  size(960,544);
  cam = new Capture(this,width,height,30);
  
  bgImage = createImage(cam.width,cam.height,RGB);
  photo = loadImage("bg.jpg");
  
  cam.start();
  

}

void draw(){
  
  if(cam.available()){
    cam.read();
  }
  
  loadPixels();
  bgImage.loadPixels();
  photo.loadPixels();
  
  image(cam,0,0);

  for(int x=0;x<cam.width;x++){
    for(int y=0;y<cam.height;y++){
      
      int index = x+y*cam.width;
      
      color fgColor = cam.pixels[index];
      color bgColor = bgImage.pixels[index];
      
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      if(diff>threshold){
        
        
        pixels[index] = photo.pixels[index];
      }else{
        
        pixels[index] = fgColor;
      }
      
    
      
    
      


    }
    
  }
  
  updatePixels();
  
}

void mousePressed(){

  bgImage.copy(cam,0,0,cam.width,cam.height,0,0,cam.width,cam.height);
  bgImage.updatePixels();
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  threshold +=e;
}
