class JoyPad {
  private boolean up;
  private boolean down;
  private boolean left;
  private boolean right;

  public boolean IsUp() {
    return this.up;
  }

  public void setUp(boolean up) {
    this.up = up;
  }
  public boolean IsDown() {
    return this.down;
  }

  public void setDown(boolean down) {
    this.down = down;
  }

  public boolean IsLeft() {
    return this.left;
  }

  public void setLeft(boolean left) {
    this.left = left;
  }
  public boolean IsRight() {
    return this.right;
  }

  public void setRight(boolean right) {
    this.right = right;
  }
}
