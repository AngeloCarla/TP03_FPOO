int filas = 40;
int columnas = 40;
int bs = 20;// --> Tamaño base
//Array para que la serpiente creazca
ArrayList<Integer> posX = new ArrayList<Integer>();
ArrayList<Integer> posY = new ArrayList<Integer>();
//Direccion de la sepiente
int dir = 1;
int[] dx = {0, 0, -1, 1};
int[] dy = {-1, 1, 0, 0};
//Posiciones para la manzana
int appleX;
int appleY;
//Fin de juego
boolean gameOver = false;

void setup() {
  size(600, 600);
  frameRate(8);

  posX.add(10);
  posY.add(10);

  appleX = (int)random(0, 30);
  appleY = (int)random(0, 30);
}

void draw() {
  background(25); //Fondo
  if (gameOver==true) {
    //Pantalla del GameOver
    fill(155);
    textSize(20);
    text("Press SPACE to restart", 210, height/2);
    //Si el gameOver es verdadero, no se mostraria ni Manzana y ni Serpiente
    posX.clear();
    posY.clear();
    posX.add(-10);
    posY.add(-10);
    appleX = -1;
    appleY = -1;
  } else {
    //Escenario en cuadriculas
    stroke(50);
    for (int i = 0; i < filas; i++) { //Filas
      line(0, i*bs, width, i*bs);
    }
    for (int i = 0; i < columnas; i++) { //Columnas
      line(i*bs, 0, i*bs, height);
    }
  }

  dibujarSnake();
  dibujarManzana();
  comerManzana();
  detectarBordes();
  detectarSnake();
  mover();
}

/* --- METODOS DE VISUALIZACIONES --- */
//Metodos para dibujar la Serpiente
void dibujarSnake() {
  fill(40, 50, 230);
  //Dibuja el Snake centrado en la cuadricula
  for (int i = 0; i < posX.size(); i++) {
    rect(posX.get(i)*bs, posY.get(i)*bs, bs, bs);
  }
}

//Metodo para dibujar las Manzanas
void dibujarManzana() {
  fill(215, 0, 75);
  //Dibuja la Manzana en un lugar aleatorio y centrado en la cuadricula
  rect(appleX * bs, appleY * bs, bs, bs);
}

/* --- METODOS DE COLISION --- */
//Metodo para detectar los bordes de la pantalla
void detectarBordes() {
  //Al salir de la pantalla el GameOver queda en falso
  if ((posX.get(0) <= 0)/*IZQUIERDA*/||(posY.get(0) <= 0)/*ARRIBA*/||
    (posX.get(0) >= columnas -11)/*DERECHA*/||(posY.get(0) >= filas -11)/*ABAJO*/) {
    gameOver = true;
  }
}

//Metodo para detectar el Snake con mas de 2 tamaños(Cuadradros)
void detectarSnake() {
  for (int i = 2; i < posX.size(); i++) {
    for (int j = 2; j < posY.size(); j++) {
      //Si la posicion en 0 de X e Y es igual a la posicion mayor a 2
      if ((posX.get(0) == posX.get(i)) && (posY.get(0) == posY.get(i))) {
        gameOver = true;
      }
    }
  }
}

//Metodo para detectar la colision entre la Manzana y el Snake en posicion 0 (cabeza)
void comerManzana() {
  //Si las posiciones en X e Y del Snake son iguales a las posiciones en X e Y de la Manzana
  if ((posX.get(0) == appleX) && (posY.get(0) == appleY)) {
    //Añade en posiciones aleatorias la manzana
    appleX = (int)random(0, 30);
    appleY = (int)random(0, 30);
    //Añade un tamaño al Snake
    posX.add(posX.get(posX.size()-1));
    posY.add(posY.get(posY.size()-1));
  }
}

/* --- METODO PARA REINICIAR EL JUEGO ---*/
void restart() {
  gameOver = false;
  //Inicializa todas las posiciones nuevamente
  posX.clear();
  posY.clear();
  posX.add(10);
  posY.add(10);
  appleX = (int)random(0, 30);
  appleY = (int)random(0, 30);
}

/* --- METODOS PARA MOVER --- */
//Metodo para mover a la serpiente
void mover() {
  posX.add(0, posX.get(0)+dx[dir]);
  posY.add(0, posY.get(0)+dy[dir]);
  posX.remove(posX.size()-1);
  posY.remove(posY.size()-1);
}

void keyPressed() {
  if (key=='w'||key=='W'||keyCode==UP) dir = 0;
  if (key=='s'||key=='S'||keyCode==DOWN) dir = 1;
  if (key=='a'||key=='A'||keyCode==LEFT) dir = 2;
  if (key=='d'||key=='D'||keyCode==RIGHT) dir = 3;
  if (keyCode==' ' && gameOver==true) {
    restart();
  }
}
