int basecolor = 255;

void setup(){
  size(720,720);
}
void draw(){
  background(255);
  int greenscale = basecolor;
  float maxWidth = 320;
  for (int y = height -50; y >= height -150; y--){
      if ((greenscale <= 255) && (y%10==0)){
        stroke(0,greenscale,0);
        greenscale += 30;
      }else if (y%10 == 0){
        greenscale = 0 ;
      }
    for (int x = (width/2 -50); x <= (width/2 +50); x++){
      point(x,y);
    }
  }
  for (int y = height -150; y >= 20; y--){
      if ((greenscale <= 255) && (y%10==0)){
        stroke(0,greenscale,0);
        greenscale += 30;
      }else if (y%10 == 0){
        greenscale = 0 ;
      }
    for (int x = (width/2 - (int)maxWidth); x <= (width/2 + (int)maxWidth); x++){
      point(x,y);
    }
    maxWidth -= 0.6;
  }
  if (basecolor >= 0){
    basecolor -= 30;
  }else{
    basecolor = 255;
  }
}
