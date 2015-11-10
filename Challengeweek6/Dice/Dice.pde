/* Make a working Dice that changes when clicked and with nice graphics + for animation
 Either use Processing 2D primitives like elipse rect etc or create your own graphics for the Dice.*/

int lastResult = 2;
PImage defaultlImage;
int diceSize = 80;

float xPos = 0;
float yPos = 0;
float xVel = 2;
float yVel = 0.5;

void setup() {
  size(1000, 800);
  //If you use images load them here for better performance
  xPos = width/2;
  defaultlImage = loadImage("default.jpg");
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(55);
}

void draw() {
  background(255);
  if (lastResult == 1) {
    //Show number 1
  } else if (lastResult == 2) {
    //Show number 2
    //image(defaultlImage,100,100);
  }
  drawDice();  
}

/**Method that creates a new random number every time it is called*/
void getNewNumber() {
  lastResult = int(random(1, 6);
}

void mouseClicked() {
  if (clickOnDice()) {
    getNewNumber();
    throwDice();
  }
}

boolean clickOnDice() {
  boolean onDice = false;
  if (mouseX > xPos-(diceSize/2) && mouseX < xPos+(diceSize/2) && mouseY > yPos-(diceSize/2) && mouseY < yPos+(diceSize/2)) onDice = true;  
  return onDice;
}

void throwDice() {
  xPos = width/2;
  yPos = 50;
  xVel = random(-6, 6);
  
}

void drawDice() {
  if (yPos < height/3*2) {
    yVel+=0.5;
    xPos+= xVel;
  }
  
  yPos+= yVel;
  
  if (yPos > height/3*2) {
    yPos = height/3*2;
    yVel = -yVel/2;
    xVel = xVel/2;
    if (yVel < 0.35 && yVel > -0.35) yVel=0;
  }
  
  fill(255);
  rect(xPos, yPos, diceSize, diceSize);
  fill(0);
  text(lastResult, xPos, yPos+20);
}
