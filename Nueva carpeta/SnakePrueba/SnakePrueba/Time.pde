static class Time {
  /* METODOS */
  //* Metodo estatico con el calculo del DeltaTime
  static float getDeltaTime(float frame) {
    int framePorSegundo = round(frame);
    float deltaTime = 1.0/framePorSegundo;
    return deltaTime;
  }
}
