
int py=900;

float sizeR;
float angle;
int r=200;
int g=200;
int b=200;
float subX;


void setup(){
  size(1000,1000);
  background(255);
}


void draw(){
  
  for(float sizeL=400+subX;sizeL+angle<sizeR-angle;sizeL=sizeL+1){
      if(py%50==0){
        r=150;
        g=150;
        b=150;
        py--;
      }
      if(py<750){
        subX=-300+angle;
      }
    stroke(r,g,b);
    point(sizeL,py);
  }
  
if (py>751) {
  sizeR=600;
}
else if (py<750){
  sizeR=900+angle;
  angle=angle+0.6;
}
r-=5;
g-=5;
b-=5;
py=py-1;
}
