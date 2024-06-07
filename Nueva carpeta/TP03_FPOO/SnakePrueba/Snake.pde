class Snake extends Collider {
  private PVector posicion;
  private PVector velocidad;
  private ArrayList<PVector> cuerpoPosicion;
  private Cabeza cabeza;
  private Cuerpo cuerpo;

  /* --- CONSTRUCTORES --- */
  public Snake() {
    posicion = new PVector();
    velocidad = new PVector();
    this.ancho = 10;
    this.alto = 10;
    cuerpoPosicion = new ArrayList<PVector>();
  }

  public Snake(PVector posicion, PVector velocidad, Cabeza cabeza, Cuerpo cuerpo) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.cabeza = cabeza;
    this.cuerpo = cuerpo;
    this.ancho = 30;
    this.alto = 30;
    cuerpoPosicion = new ArrayList<PVector>();
    cuerpoPosicion.add(posicion.copy());
  }

  /* --- METODOS --- */
  void display() {
    dibujar();
  }

  //* Metodo para dibujar la Cabeza
  public void dibujar() {
    imageMode(CENTER);
    cabeza.visualizarCabeza(posicion, ancho, alto);
    dibujarCuerpo();
    dibujarLimites();
  }

  public void dibujarCuerpo() {
    for (int i = 0; i < cuerpoPosicion.size(); i++) {
      cuerpo.visualizarCuerpo(cuerpoPosicion.get(i), ancho, alto);
    }
  }
  
  public void dibujarLimites() {
    noFill();
    rectMode(CENTER);
    stroke(255, 0, 0);
    rect(posicion.x, posicion.y, ancho, alto);
  }

  public void agregarCuerpo() {
    // Obtiene la última posición del último segmento del cuerpo y añade un nuevo segmento en esa posición
    PVector ultimaPosicion = cuerpoPosicion.get(cuerpoPosicion.size() - 1).copy();
    cuerpoPosicion.add(ultimaPosicion);
  }

  public void actualizarPuntaje() {
  }

  public boolean verificarColision(Animal animal) {
    // Llama al método de colisión específico del animal
    return animal.verificarColision(this);
  }

  //* Metodo para mover al Snake
  public void mover(int direccion) {
    // Implementacion DelaTime en el movimiento del Snake
    PVector movimiento = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    cabeza.setDireccion(direccion);

    PVector nuevaPosicion = posicion.copy();

    switch(direccion) {
    case 1: // ARRIBA
      if (posicion.y - movimiento.y >= 20) {
        nuevaPosicion.y -= movimiento.y;
      }
      break;
    case 2: // ABAJO
      if (posicion.y + movimiento.y <= height - 20) {
        nuevaPosicion.y += movimiento.y;
      }
      break;
    case 3: // IZQUIERDA
      if (posicion.x - movimiento.x >= 20) {
        nuevaPosicion.x -= movimiento.x;
      }
      break;
    case 4: // DERECHA
      if (posicion.x + movimiento.x <= width - 20) {
        nuevaPosicion.x += movimiento.x;
      }
      break;
    }

    // Actualiza la posición de cada segmento del cuerpo, comenzando desde el último
    if (cuerpoPosicion.size() > 0) {
      for (int i = cuerpoPosicion.size() - 1; i > 0; i--) {
        cuerpoPosicion.set(i, cuerpoPosicion.get(i - 1).copy());
      }
      cuerpoPosicion.set(0, posicion.copy());
    }
    posicion = nuevaPosicion;
  }

  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return this.posicion;
  }

  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  public PVector getVelocidad() {
    return this.velocidad;
  }

  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
