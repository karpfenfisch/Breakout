class Board implements Iupdateable, Idrawable
{
  public float bWidth = 120;
  public float X;
  public float speed = 5;

  public Board(int x)
  {
    X=x;
  }

  public void update()
  {
    ctrl();
  }
  public void drw()
  {
    for (float i = -bWidth/2;i<= bWidth/2;i+=1)
    {
      stroke(lerpColor(#0000FF, #FFFFFF, map(abs(i), bWidth/2, 0, 0, 1)));
      line(X+i+bWidth/2, 485, X+i+bWidth/2, 495);
      stroke(#000000);
    }
  }
  public void ctrl()
  {
    float aim = mouseX-(bWidth/2);
    float dis = abs(aim -X);
    int minus = 1;
    if (aim < X)minus = -1;
    if (dis <= speed/3f)
    {
      X = aim;
    }
    else
    {
      X += minus*speed/3f;
    }
  }
}

