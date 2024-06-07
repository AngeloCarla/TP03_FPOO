class PantallaInicio {
  PImage inicio, start1, start2;
  boolean isMouseOver = false;
  boolean isPressed = false;
  int x = 50;
  int y = 200;
  int ancho = 500;
  int alto = 400;

  public PantallaInicio() {
    start1 = loadImage("start1.png");
    start2 = loadImage("start2.png");
    inicio = loadImage("InicioSnake.png");
  }

  void display() {
    image(inicio, 0, 0, 600, 600);
    // Dibuja el botón de inicio
    if (isPressed) {
      image(start1, x, y, ancho, alto);
    } else if (isMouseOver) {
      image(start2, x, y, ancho, alto);
    } else {
      image(start1, x, y, ancho, alto);
    }
  }
}
