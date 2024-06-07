class Cuerpo extends Collider {
  private PImage cuerpo;

  /* --- CONSTRUCTORES --- */
  public Cuerpo(String path) {
    cuerpo = loadImage(path);
  }

  /* --- METODOS --- */
  public void visualizarCuerpo(PVector posicion, int ancho, int alto) {
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(posicion.x, posicion.y, ancho, alto);
    // image(cuerpo, posicion.x, posicion.y, ancho, alto);
  }
}
