class Cabeza {
  private PImage snakeUp;
  private PImage snakeDown;
  private PImage snakeLeft;
  private PImage snakeRight;
  private PImage imgActual;

  public Cabeza(String pathUp, String pathDown, String pathLeft, String pathRight) {
    snakeUp = loadImage(pathUp);
    snakeDown = loadImage(pathDown);
    snakeLeft = loadImage(pathLeft);
    snakeRight = loadImage(pathRight);
    imgActual = snakeUp; //Imagen por defecto
  }

  public void visualizarCabeza(PVector posicion, int ancho, int alto) {
    image(imgActual, posicion.x, posicion.y, ancho, alto);
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
