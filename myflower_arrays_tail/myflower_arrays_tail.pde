Flower myFlower1;
Flower myFlower3;

int num = 50;
Flower[] mySnake;

float scale = 0.995;

void setup() {
  size(900, 800, P2D);
  background(#43AF76);

  int _r1= 60;
  int _petals=7;
  float _x=100;
  float _y=200;

  int _pc=#FFA000;
  // myFlower1 = new Flower(_r1, _petals, width/2, height,_pc);
  myFlower1=new Flower();

  myFlower3 = new Flower(_r1, _petals, mouseX, mouseY, _pc, 100);

  mySnake = new Flower[50];

  for (int i = 0; i < num; i++) {
    mySnake[i] = new Flower(_r1, _petals, mouseX, mouseY, _pc, 100);
  }
}



void draw() {
  background(#43AF76);
  if (myFlower1.overlaps(myFlower3) == true )
  {
    background(#FF0000);
  } 

  myFlower1.move();
  myFlower1.bounce();
  myFlower1.display();

  myFlower3.x=mouseX;
  myFlower3.y=mouseY;

  myFlower3.display();

  // Shift the values in the myFlower array to the right - NOTE counting from TOP DOWN
  for (int i = num-1; i > 0; i--) {
    mySnake[i].x=mySnake[i-1].x;
    mySnake[i].y=mySnake[i-1].y;
    mySnake[i].r=mySnake[i-1].r*pow(scale, i);
  }
  // Add the new values to the beginning of the array
  mySnake[0].x = mouseX;
  mySnake[0].y = mouseY;
  // Draw the "tail"
  for (int i = num-1; i > 0; i--) {
    mySnake[i].display();
  }
}
