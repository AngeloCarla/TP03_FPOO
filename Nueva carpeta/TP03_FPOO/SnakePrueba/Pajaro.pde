class Pajaro extends Animal { 
  /* --- CONSTRUCTORES --- */
  public Pajaro(PVector posicion) {
    super(posicion, loadImage("pajaro.png"));
    this.ancho = 50;
    this.alto = 50;
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la imagen del Pajaro
  public void display() {
    image(imagen, posicion.x, posicion.y, this.ancho, this.alto);
    dibujarLimites();
  }
//* Metodo para verificar la Colision
  public boolean verificarColision(Snake snake) {
    // Coordenadas del snake
    float snakeLeft = snake.getPosicion().x;
    float snakeRight = snake.getPosicion().x + snake.getAncho();
    float snakeTop = snake.getPosicion().y;
    float snakeBottom = snake.getPosicion().y + snake.getAlto();
    // Coordenadas del animal
    float animalLeft = this.posicion.x;
    float animalRight = this.posicion.x + this.ancho;
    float animalTop = this.posicion.y;
    float animalBottom = this.posicion.y + this.alto;
    // Comprueba si hay solapamiento entre las coordenadas
    if (snakeRight >= animalLeft && snakeLeft <= animalRight &&
      snakeBottom >= animalTop && snakeTop <= animalBottom) {
      // Hay colisión
      return true;
    } else {
      // No hay colisión
      return false;
    }
  }

  public void dibujarLimites() {
    noFill();
    rectMode(CENTER);
    stroke(0,255,0);
    rect(posicion.x, posicion.y, this.ancho, this.alto);
  }
}
