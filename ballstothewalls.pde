PShape[][] field;
int score;
PShape player;
/** Formål spil
  En bane med prikker som vi kan skyde ned.
  En plade i bunden som man bruger til at bounce bold.
  En bold.
  Når bolden rammer en prik så popper prikken med en chance på 10% for at få en bonus.
*/
int leftBorder = -10;
int rightBorder = 690;
int currentPlayerX = 0;

void setup() {
  frameRate(60);
  size(800, 800);
  // Creating the PShape as a square. The
  // numeric arguments are similar to rect().
  field = createSquares(25, 10);
  player = player(leftBorder);
    background(87, 150, 56);
}

void draw() {
  background(87, 150, 56);
  playerMovement();
  translate(currentPlayerX, 0);
  shape(player, 25, 25);
}

PShape[][] createSquares(int rows, int cols) {
  PShape[][] squares = new PShape[rows][cols];
  
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      PShape square = createShape(RECT, i*5, j*5, 20, 20);
      square.setFill(color(i, j, 255));
      square.setStroke(false);
      squares[i][j] = square;
    }
  }
  
  return squares;
}

PShape player(int x) {
  PShape player = createShape(RECT, x, (height-100), 100, 20);
  player.setFill(color(255, 255, 7));
  player.setStroke(false);
  return player;
}

void playerMovement() {
   if(keyPressed) {
    if(keyCode == LEFT && currentPlayerX >= leftBorder) {
      currentPlayerX -= 10;
    }
    if(keyCode == RIGHT && currentPlayerX != rightBorder) {
      currentPlayerX += 10;
    }
  }
}

PShape createBall() {
  PShape ball = createShape(ELLIPSE, 0, 0, 25, 25); 
  ball.setFill(color(255, 0, 0));
  ball.setStroke(false);
  return ball;
}
