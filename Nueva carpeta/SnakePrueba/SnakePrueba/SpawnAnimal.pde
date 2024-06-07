class SpawnAnimal {
  private ArrayList<Animal> animales; //ArrayList que almacena los animales generados
  /* --- CONSTRUCTORES --- */
  public SpawnAnimal() {
    animales = new ArrayList<Animal>();
    generarAnimales();
  }
  /* --- METODOS --- */
  //* Metodo para Generar Animales
  public void generarAnimales() {
    for (int i = 0; i < 1; i++) {
      //Genera animales en una posicion aleatoria dentro del campo de Juego
      PVector posicion = new PVector(random(100, width - 100), random(100, height - 100));
      Animal animal = generarAnimalAleatorio(posicion);//Genera un Animal Aleatorio
      animales.add(animal);//Agrega el Animal a la lista
    }
  }
  //* Metodo para Generar Animales Aleatorios
  private Animal generarAnimalAleatorio(PVector posicion) {
    String[] tipos = {"raton", "pajaro", "insecto"};//Array que almacena los tipos de animal
    String tipo = tipos[int(random(tipos.length))];//Elige un Animal Aleatorio
    switch(tipo) {
    case "raton":
      return new Raton(posicion);
    case "pajaro":
      return new Pajaro(posicion);
    case "insecto":
      return new Insecto(posicion);
    default:
      return null;
    }
  }
  //* Metodo para Visualizar los Animales
  public void visualizarAnimales() {
    for (Animal animal : animales) {
      animal.display();//Llama al metodo display de cada animal
    }
  }
  //* Metodo para obtener la Lista de Animales
  public ArrayList<Animal> getAnimales() {
    return animales;
  }
}
