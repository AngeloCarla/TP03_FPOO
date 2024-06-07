class Escenario {
  private float puntaje;
  private int tiempo;
  private int tiempoInicial;
  /* --- CONSTRUCTORES --- */
  public Escenario() {
    puntaje = 0;
    tiempoInicial = millis();
  }
  /* --- METODOS --- */
  public void display() {
    visualizarEscenario();
  }
  //* Metodo para visualizar el Escenario
  public void visualizarEscenario() {
    
    mostrarPuntaje();
    mostrarTiempo();
  }

  public void mostrarPuntaje() {
    textSize(20);
    fill(255);
    textAlign(LEFT);
    text("Puntaje: " + puntaje, 200, 35);
  }
  //* Metodo que establece y visualiza el Tiempo Trascurrido
  public void mostrarTiempo() {
    textSize(20);
    fill(255);
    textAlign(LEFT);
    if (joyPad.up==true||joyPad.down==true||joyPad.left==true||joyPad.right==true) {
      tiempo = (millis() - tiempoInicial) / 1000;// Calcula el tiempo transcurrido en segundos
    }
    text("Tiempo: " + tiempo + "s", 45, 35);
  }
}
