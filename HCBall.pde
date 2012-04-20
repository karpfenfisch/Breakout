class HCBall extends Ball
{
  public HCBall(float X, float Y)
  {
    super(X,Y);
    col = color(#FF0000);
  }
  void BoardCol()
  {
    if ((Y+Rad>=485)&&((X+Rad>=brd.X)&&(X-Rad<=brd.X+brd.bWidth)))
    {
      reflectVert();
      Dir += areatest();
      Speed += 1;
      if(Speed > 10)Speed = 10;
      recalcChanges();
    }
  }
  void specialAction()
  {
    Balls.add(new HCBall(X,Y));
  }
}
