class Snake {
  private PImage snake;
  private PVector posicion;
  private ArrayList<Cuerpo> cuerpo;
  private PVector velocidad;

  public Snake() {
    posicion = new PVector();
    velocidad = new PVector(10, 10);
  }

  public Snake(PVector posicion) {
    this.posicion = posicion;
    velocidad = new PVector(10, 10);
  }

  void display() {
    dibujar();
  }

  public void dibujar() {
    fill(45,180,25);
    rect(this.posicion.x, this.posicion.y, 50, 50);
  }

  public void comerAnimal() {
  }

  public void actualizarPuntaje() {
  }

  public void actualizarTiempo() {
  }

  public void mover(int direccion) {
    switch(direccion) {
    case 1: //arriba
      if (posicion.y - velocidad.y >= 0) {
        this.posicion.y -= this.velocidad.y;
      }
      break;
    case 2: //abajo
      if (posicion.y + velocidad.y <= height - 50) {
        this.posicion.y += this.velocidad.y;
      }
      break;
    case 3: //izquierda
      if (posicion.x - velocidad.x >= 0) {
        this.posicion.x -= this.velocidad.x;
      }
      break;
    case 4: //derecha
      if (posicion.x + velocidad.x <= width - 50) {
        this.posicion.x += this.velocidad.x;
      }
      break;
    }
  }
}
