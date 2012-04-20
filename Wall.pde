class Wall extends Block
{
  public Wall (float x, float y, float wid, float hei)
  {
    super(x, y, wid, hei);
  }
  public void drw()
  {
    fill(200);
    rect(X, Y, wid, hei);
  }
  public void BallHit(int dmg) {
  }
}

