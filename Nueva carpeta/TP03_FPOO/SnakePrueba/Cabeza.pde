class Cabeza {
  private PImage snakeUp;
  private PImage snakeDown;
  private PImage snakeLeft;
  private PImage snakeRight;
  private PImage imgActual;

  /* --- CONSTRUCTORES --- */
  public Cabeza(String pathUp, String pathDown, String pathLeft, String pathRight) {
    snakeUp = loadImage(pathUp);
    snakeDown = loadImage(pathDown);
    snakeLeft = loadImage(pathLeft);
    snakeRight = loadImage(pathRight);
    imgActual = snakeUp;
  }
  
  /* --- METODOS --- */
  public void visualizarCabeza(PVector posicion, int ancho, int alto) {
    rectMode(CENTER);
    fill(45,172,193);
    rect(posicion.x,posicion.y,ancho,alto);
    //image(imgActual, posicion.x, posicion.y, ancho, alto);
  }
  
  public void setDireccion(int direccion) {
    switch(direccion) {
    case 1:
      imgActual = snakeUp;
      break;
    case 2:
      imgActual = snakeDown;
      break;
    case 3:
      imgActual = snakeLeft;
      break;
    case 4:
      imgActual = snakeRight;
      break;
    }
  }
}
