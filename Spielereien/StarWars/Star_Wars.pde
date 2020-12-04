PImage photo; //<>//
int speed=2;
void setup ()
{
  
  size(810, 455);// P3D, damit das Zeichenbrett 3 Dimensional wird
  smooth();
  frameRate(60);
}


void draw ()
{

  println(mouseX, mouseY);

  background(#1C1B1B);
  //BackGroundDeathStar
  fill(#757576);
  noStroke();
  ellipse(490, 679, 2400, 1000);


  //TurbineLinksUnten //mouseX 100 mouseY 100

  stroke(0);
  fill(#171D48);
  quad(mouseX+87, mouseY+72, mouseX+126, mouseY+60, mouseX+142, mouseY+77, mouseX+97, mouseY+93);
  fill(#FC2008); //<>//
  ellipse(mouseX+92, mouseY+83, 24, 24);

  //KanoneLinksUnten
  fill(#071EAF);
  noStroke();
  quad(mouseX+32, mouseY-7, mouseX+71, mouseY-8, mouseX+75, mouseY-2, mouseX+33, mouseY+4);
  stroke(#FC2008);
  fill(0);
  ellipse(mouseX+31, mouseY-1, 12, 12);
  noStroke();
  quad(mouseX+76, mouseY-7, mouseX+96, mouseY-9, mouseX+99, mouseY-6, mouseX+85, mouseY-4);


  //WingLeftBottom
  stroke(0);
  fill(#E3E4E8);
  quad(mouseX+142, mouseY+71, mouseX+39, mouseY-13, mouseX+41, mouseY-16, mouseX+146, mouseY+70);//vordereKontur
  quad(mouseX+146, mouseY+67, mouseX+42, mouseY-16, mouseX+62, mouseY-16, mouseX+177, mouseY+46);

  //WingLeftTOp
  fill(#E3E4E8);
  quad(mouseX+152, mouseY+65, mouseX+67, mouseY-59, mouseX+97, mouseY-60, mouseX+191, mouseY+45);
  quad(mouseX+148, mouseY+64, mouseX+64, mouseY-59, mouseX+66, mouseY-59, mouseX+150, mouseY+65);//vordereKontur

  //KanoneLinksOben
  fill(#071EAF);
  noStroke();
  ellipse(mouseX+115, mouseY-57, 12, 12);
  quad(mouseX+71, mouseY-71, mouseX+115, mouseY-64, mouseX+114, mouseY-52, mouseX+70, mouseY-59);
  fill(0);
  stroke(#FC2008);
  ellipse(mouseX+70, mouseY-65, 12, 12);
  noStroke();
  quad(mouseX+122, mouseY-58, mouseX+153, mouseY-53, mouseX+154, mouseY-50, mouseX+120, mouseY-56);
  ellipse(mouseX+157, mouseY-52, 5, 5);


  //mainShuttleTOP
  fill(255);
  stroke(160);
  fill(#626BA0);
  quad(mouseX+130, mouseY+85, mouseX+164, mouseY+118, mouseX+190, mouseY+75, mouseX+161, mouseY+51);//Hintern
  fill(#606BAF);
  quad(mouseX+161, mouseY+51, mouseX+190, mouseY+75, mouseX+200, mouseY+66, mouseX+174, mouseY+43);//obererTeilBack
  fill(#2D42C1);
  quad(mouseX+174, mouseY+43, mouseX+200, mouseY+66, mouseX+233, mouseY+52, mouseX+216, mouseY+33);//zwischenTurbinen
  fill(#A6ACD1);
  quad(mouseX+216, mouseY+33, mouseX+233, mouseY+52, mouseX+240, mouseY+44, mouseX+231, mouseY+32);//R2DS cockpit
  fill(#E3E4E8);
  quad(mouseX+231, mouseY+32, mouseX+240, mouseY+44, mouseX+252, mouseY+43, mouseX+242, mouseY+34);//nach R2D2
  fill(#2D42C1);
  quad(mouseX+242, mouseY+34, mouseX+252, mouseY+43, mouseX+273, mouseY+36, mouseX+266, mouseY+32);//vordere Nase
  fill(#E3E4E8);
  quad(mouseX+266, mouseY+32, mouseX+273, mouseY+36, mouseX+278, mouseY+34, mouseX+270, mouseY+29);//vordere spitze
  fill(#626BA0);
  quad(mouseX+195, mouseY+70, mouseX+273, mouseY+36, mouseX+272, mouseY+43, mouseX+165, mouseY+117);//mainShuttleLeftSIDE

  //VerbindungFlügelUntenRechts zu Main
  fill(#2D42C1);
  quad(mouseX+190, mouseY+119, mouseX+187, mouseY+105, mouseX+226, mouseY+73, mouseX+208, mouseY+107);









  //VerbindungFlügelObenLinks zu Main

  fill(#2D42C1);

  quad(mouseX+157, mouseY+54, mouseX+139, mouseY+36, mouseX+181, mouseY+31, mouseX+191, mouseY+39);
  noStroke();

  //TurbineLinksOben
  fill(#171D48);
  ellipse(mouseX+187, mouseY+21, 23, 25);
  quad(mouseX+129, mouseY+14, mouseX+185, mouseY+9, mouseX+192, mouseY+32, mouseX+135, mouseY+36);
  stroke(0);
  fill(#FC2008);
  ellipse(mouseX+131, mouseY+25, 25, 24); 

  //TurbineRechtsUnten
  fill(#171D48);
  quad(mouseX+159, mouseY+139, mouseX+207, mouseY+107, mouseX+228, mouseY+114, mouseX+180, mouseY+155);
  fill(#FC2008);
  stroke(0);
  ellipse(mouseX+166, mouseY+150, 25, 24);

  //RechtsUntenKanone

  fill(#071EAF);
  quad(mouseX+282, mouseY+223, mouseX+296, mouseY+186, mouseX+307, mouseY+195, mouseX+291, mouseY+225);
  fill(0);
  stroke(#FC2008);
  ellipse(mouseX+286, mouseY+225, 12, 12);
  noStroke();
  ellipse(mouseX+302, mouseY+192, 12, 12);

  quad(mouseX+301, mouseY+184, mouseX+314, mouseY+157, mouseX+316, mouseY+157, mouseX+304, mouseY+186); //Spitze
  ellipse(mouseX+315, mouseY+157, 5, 5);



  //WingRightBottom
  stroke(0);
  fill(#E3E4E8);
  quad(mouseX+206, mouseY+133, mouseX+302, mouseY+215, mouseX+300, mouseY+216, mouseX+204, mouseY+135);
  quad(mouseX+206, mouseY+133, mouseX+302, mouseY+215, mouseX+310, mouseY+197, mouseX+242, mouseY+104);


  //WingRightTop
  fill(#E3E4E8);
  stroke(0);
  quad(mouseX+200, mouseY+102, mouseX+345, mouseY+168, mouseX+346, mouseY+166, mouseX+214, mouseY+108);//vordereKontur
  quad(mouseX+251, mouseY+86, mouseX+352, mouseY+151, mouseX+344, mouseY+166, mouseX+201, mouseY+101);



  //RechtsObenKanone
  noStroke();
  fill(#071EAF);
  ellipse(mouseX+352, mouseY+131, 12, 12);
  quad(mouseX+341, mouseY+160, mouseX+347, mouseY+128, mouseX+357, mouseY+132, mouseX+350, mouseY+164);

  fill(0);
  stroke(#FC2008);
  ellipse(mouseX+346, mouseY+163, 12, 12);
  noStroke();
  quad(mouseX+352, mouseY+124, mouseX+359, mouseY+98, mouseX+360, mouseY+99, mouseX+356, mouseY+125);
  ellipse(mouseX+359, mouseY+98, 4, 4);// vordere kleine Spitze

  //TurbineRechtsOben
  noStroke();
  fill(#171D48);
  ellipse(mouseX+253, mouseY+73, 24, 25);
  quad(mouseX+211, mouseY+82, mouseX+246, mouseY+63, mouseX+258, mouseY+83, mouseX+221, mouseY+101);
  stroke(0);
  fill(#FC2008);
  ellipse(mouseX+212, mouseY+93, 20, 24);


  //laserShots
  
}
