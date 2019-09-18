

PImage img;

void setup()
{
  
  
  img = loadImage("parrot_1.jpg");
  //println(img.width);
  //println(img.height);
  
  int w = img.width;
  
  size(640,423);
  
  
}

void draw()
{
  //line(0,0,100,100);
  //rect(10,10,100,100);
  
  
  for(int i=0;i<100;i++){
    int x = 100+i;
    int y = 100+i;
    int loc = x+y*width;
    img.pixels[loc] = color(255,255,0);
  }
  
  image(img,0,0);

  
  /*
  loadPixels();
  img.loadPixels();
  
  for(int y=0;y<height;y++)
  {
    for(int x=0;x<width;y++)
    {
      int loc = x+y*width;
    }
  }
  
  updatePixels();
  */
  

}
