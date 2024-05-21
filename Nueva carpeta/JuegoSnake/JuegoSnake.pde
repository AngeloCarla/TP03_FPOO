private Escenario escenario;
private Snake snake;
private JoyPad joyPad;
private ArrayList<Animal> animalesComidos;

void setup() {
  size(600, 600);
  snake = new Snake(new PVector(width/2, height/2));
  joyPad = new JoyPad();
}

void draw() {
  background(0);
  snake.display();

  if (joyPad.IsUp()) {
    snake.mover(1);
  }
  if (joyPad.IsDown()) {
    snake.mover(2);
  }
  if (joyPad.IsLeft()) {
    snake.mover(3);
  }
  if (joyPad.IsRight()) {
    snake.mover(4);
  }
}

void keyReleased() {
  if (key=='w'||key=='W'||keyCode==UP) {
    joyPad.setUp(true);
    joyPad.setDown(false);
    joyPad.setLeft(false);
    joyPad.setRight(false);
  }

  if (key=='s'||key=='S'||keyCode==DOWN) {
    joyPad.setDown(true);
    joyPad.setUp(false);
    joyPad.setLeft(false);
    joyPad.setRight(false);
  }

  if (key=='a'||key=='A'||keyCode==LEFT) {
    joyPad.setLeft(true);
    joyPad.setUp(false);
    joyPad.setDown(false);
    joyPad.setRight(false);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) {
    joyPad.setRight(true);
    joyPad.setUp(false);
    joyPad.setDown(false);
    joyPad.setLeft(false);
  }
}
