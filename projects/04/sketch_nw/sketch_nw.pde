import hypermedia.net.*;

UDP udp;

void setup(){
  udp = new UDP(this,5000);
  udp.listen();
}
void draw(){;}

void keyPressed(){
  String message = str(key);
  String ip = "127.0.0.1";
  int port = 5100;
  
  //String message = "Hello";
  udp.send(message,ip,port);
  println(message);
}
