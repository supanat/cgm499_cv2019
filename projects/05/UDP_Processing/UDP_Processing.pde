import hypermedia.net.*;

UDP udp;

void setup(){
 udp = new UDP(this,6000); //open port 
 udp.listen(true);
}

void draw(){
//can send in this;
}

void keyPressed(){
   //String message = str(key);
   String message = "hello";
   String ip = "127.0.0.1";
   int port = 6100; //port to another
   
   float x = 10;
   float y = 10;
   float w = 5;
   float h = 5;
   
   message = x+" "+y+" "+w+" "+h;
   udp.send(message,ip,port);//export to another
   println("send "+ message);
 }
 
