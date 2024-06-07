abstract class Animal extends Collider {
  protected PVector posicion;
  protected PImage imagen;
  protected int ancho;
  protected int alto;

  /* --- CONSTRUCTORES --- */
  //* Metodo para inicializar la Posicion e Imagen del Animal
  public Animal(PVector posicion, PImage imagen) {
    this.posicion = posicion;
    this.imagen = imagen;
    this.ancho = 50;
    this.alto = 50;
  }
  /* --- METODOS --- */
  //* Metodo display abstracto
  abstract void display();

  //* Método para verificar colisión con el snake
  abstract boolean verificarColision(Snake snake);

  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return posicion;
  }

  public int getAncho() {
    return this.ancho;
  }

  public int getAlto() {
    return this.alto;
  }
}
