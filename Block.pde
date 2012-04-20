class Block implements Idrawable
{
  public int LeftHits = 5;
  public float wid;
  public float hei;
  public float X;
  public float Y;

  public Block()
  {
  }
  public Block(float x, float y, float w, float h)
  {
    wid = w;
    hei = h;
    X = x;
    Y = y;
  }
  public Block(float x, float y, float w, float h, int LH)
  {
    wid = w;
    hei = h;
    X = x;
    Y = y;
    LeftHits = LH;
  }

  public void drw()
  {
    fill(lerpColor(full, empty, LeftHits/10f));
    rect(X, Y, wid, hei);
  }
  color full = color(#FF0000);
  color empty = color(#00FF00);

  public void BallHit(int dmg)
  {
    LeftHits -= dmg;
    LifeCheck();
  }
  void LifeCheck()
  {
    if (LeftHits <= 0)blList.remove(blList.indexOf(this));
    game.money += 1;
  }
}

