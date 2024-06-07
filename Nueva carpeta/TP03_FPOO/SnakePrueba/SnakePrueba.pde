private Escenario escenario;
private Snake snake;
private JoyPad joyPad;
private PantallaInicio inicio;
private SpawnAnimal spawn;
int estado = MaquinaEstados.PantallaInicio;

void setup() {
  size(600, 600);
  frameRate(60); // La velocidad de Frames por Segundo
  escenario = new Escenario();
  Cabeza cabeza = new Cabeza("cabezaUp.png", "cabezaDown.png", "cabezaLeft.png", "cabezaRight.png"); // Inicializacion de la clase Cabeza
  Cuerpo cuerpo = new Cuerpo("cuerpo.png");
  snake = new Snake(new PVector(width/2, height/2), new PVector(100, 100), cabeza, cuerpo); // inicilizacion de la clase Snake
  joyPad = new JoyPad(); // Inicializacion de la clase JoyPad para el movimiento
  inicio = new PantallaInicio();
  spawn = new SpawnAnimal();
}

void draw() {
  background(0);
  // image(fondo, width/2, height/2, 600, 600); //Imagen del fondo
  /* --- JOYPAD --- */
  if (estado == MaquinaEstados.Jugando) {
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
    /* --- COLISION --- */
    // Verifica colisión con cada animal
    for (int i = spawn.getAnimales().size() - 1; i >= 0; i--) {
      Animal animal = spawn.getAnimales().get(i);
      if (snake.verificarColision(animal)) {
        spawn.getAnimales().remove(i);
        spawn.generarAnimales();
        snake.agregarCuerpo();
        break;
      }
    }
  }
  /* --- MAQUINA ESTADOS --- */
  switch(estado) {
  case MaquinaEstados.PantallaInicio:
    inicio.display();
    break;
  case MaquinaEstados.Jugando:
    snake.display();
    escenario.display();
    spawn.visualizarAnimales();
    break;
  case MaquinaEstados.PantallaGanador:
    break;
  case MaquinaEstados.PantallaPerdedor:
    break;
  case MaquinaEstados.PantallaPausa:
    text("Snake", width/2, 50);
    text("Pulsa 'P' para continuar", width/2, 80);
    textAlign(CENTER);
    break;
  }
}

void keyReleased() {
  //Pantalla Pausa
  if (key=='p'||key=='P') {
    if (estado == MaquinaEstados.Jugando) {
      estado = MaquinaEstados.PantallaPausa;
    } else if (estado == MaquinaEstados.PantallaPausa) {
      estado = MaquinaEstados.Jugando;
    }
  }
  //Control JoyPad
  if (estado == MaquinaEstados.Jugando) {
    if (key=='w'||key=='W'||keyCode==UP) { //Arriba
      joyPad.setUp(true);
      joyPad.setDown(false);
      joyPad.setLeft(false);
      joyPad.setRight(false);
    }

    if (key=='s'||key=='S'||keyCode==DOWN) { //Abajo
      joyPad.setDown(true);
      joyPad.setUp(false);
      joyPad.setLeft(false);
      joyPad.setRight(false);
    }

    if (key=='a'||key=='A'||keyCode==LEFT) { //Izquierda
      joyPad.setLeft(true);
      joyPad.setUp(false);
      joyPad.setDown(false);
      joyPad.setRight(false);
    }

    if (key=='d'||key=='D'||keyCode==RIGHT) { //Derecha
      joyPad.setRight(true);
      joyPad.setUp(false);
      joyPad.setDown(false);
      joyPad.setLeft(false);
    }
  }
}

void mouseMoved() {
  if (mouseX >= 50 + 175 && mouseX <= 50 - 175 + 500 && mouseY >= 200 + 175 && mouseY <= 200 - 175 + 400) {
    inicio.isMouseOver = true;
  } else {
    inicio.isMouseOver = false;
  }
}

void mousePressed() {
  if (mouseButton == LEFT && inicio.isMouseOver) {
    inicio.isPressed = true;
  }
}

void mouseReleased() {
  if (mouseButton == LEFT && inicio.isPressed) {
    if (estado == MaquinaEstados.PantallaInicio || estado == MaquinaEstados.PantallaGanador || estado == MaquinaEstados.PantallaPerdedor) {
      estado = MaquinaEstados.Jugando; // Cambia al estado de juego
    }
    inicio.isPressed = false;
  }
}
