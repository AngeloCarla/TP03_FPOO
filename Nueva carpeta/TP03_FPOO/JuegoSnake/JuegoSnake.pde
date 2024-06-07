private Escenario escenario;
private Snake snake;
private JoyPad joyPad;
private ArrayList<Animal> animalesComidos;
float lastTime;

void setup() {
  size(600, 600); 
  frameRate(60); // La velocidad de Frames por Segundo
  Cabeza cabeza = new Cabeza("cabezaUp.png", "cabezaDown.png", "cabezaLeft.png", "cabezaRight.png"); // Inicializacion de la clase Cabeza
  snake = new Snake(new PVector(width/2, height/2), new PVector(100, 100), cabeza); // inicilizacion de la clase Snake
  joyPad = new JoyPad(); // Inicializacion de la clase JoyPad para el movimiento
  lastTime = millis(); // Guarda el tiempo actual de la variable lastTime
}

void draw() {
  float currentTime = millis(); // Obtiene el tiempo actual
  float deltaTime = (currentTime - lastTime) / 1000.0; //calcula el tiempo desde el ultimo Frame
  lastTime = currentTime; //se actualiza el valor del lastTime para el proximo ciclo
  
  background(0);
  snake.display();

  if (joyPad.IsUp()) {
    snake.mover(1, deltaTime);
  }
  if (joyPad.IsDown()) {
    snake.mover(2, deltaTime);
  }
  if (joyPad.IsLeft()) {
    snake.mover(3, deltaTime);
  }
  if (joyPad.IsRight()) {
    snake.mover(4, deltaTime);
  }
}

void keyReleased() {
  if (key=='w'||key=='W'||keyCode==UP) { //arriba
    joyPad.setUp(true);
    joyPad.setDown(false);
    joyPad.setLeft(false);
    joyPad.setRight(false);
  }

  if (key=='s'||key=='S'||keyCode==DOWN) { //abajo
    joyPad.setDown(true);
    joyPad.setUp(false);
    joyPad.setLeft(false);
    joyPad.setRight(false);
  }

  if (key=='a'||key=='A'||keyCode==LEFT) { //izquierda
    joyPad.setLeft(true);
    joyPad.setUp(false);
    joyPad.setDown(false);
    joyPad.setRight(false);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) { //derecha
    joyPad.setRight(true);
    joyPad.setUp(false);
    joyPad.setDown(false);
    joyPad.setLeft(false);
  }
}
