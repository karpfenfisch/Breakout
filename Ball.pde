class Ball implements Iupdateable, Idrawable
{
  float X;
  float Y;
  float Speed = 5;
  float Rad = 5;
  float Dir = 0;
  float XChange;
  float YChange;
  color col = color(#FFFFFF);
  int dmg = 1;

  boolean killball = true;//determines if Balls get destroyed when they leave the screen on the bottom

  //C O N S T R U C T O R S/////////////////////

  public Ball(float x, float y)
  {
    X = x;
    Y = y;
    recalcChanges();
  }
  public Ball(float x, float y, float deg)
  {
    X = x;
    Y = y;
    Dir = deg;
    recalcChanges();
  }
  public Ball(float x, float y, float rad, float speed)
  {
    X = x;
    Y = y;
    Speed = speed;
    Rad = rad;
    recalcChanges();
  }

  //U P D A T E - F U N C T I O N S////////

  void recalcChanges()
  {
    XChange = sin(radians(Dir))*Speed/3f;
    YChange = cos(radians(Dir))*Speed/3f;
  }
  public void update()
  {
    X += XChange;
    Y -= YChange;
    if ((X >= width-Rad)||(X < Rad))reflectHor();
    else if ((Y <= Rad+25)||(Y> height-Rad))reflectVert();
    //if ball leaves the screen it gets deleted
    if ((X >= width+Rad)||(X < -Rad))Balls.remove(Balls.indexOf(this));
    else if ((Y <= -Rad+25)||(Y> height+Rad))Balls.remove(Balls.indexOf(this));
    if (killball)
    {
      if (Y+Rad >= 495)
      {
        Balls.remove(Balls.indexOf(this));
      }
    }
    collDetect();
  }
  void reflectVert()
  {
    Dir = 180 - Dir;
    recalcChanges();
  }
  void reflectHor()
  {
    Dir = - Dir;
    recalcChanges();
  }
  void reflectHor(boolean toTheLeft)
  {
    if ( (toTheLeft && XChange > 0) ||((!toTheLeft) && XChange < 0))
    {
      reflectHor();
    }
  }
  void reflectVert(boolean toTheTop)
  {    
    if ( (toTheTop && YChange < 0) ||((!toTheTop) && YChange > 0))
    {
      reflectVert();
    }
  }  

  //C O L I S S I O N - D E T E C T I O N ///////////

  void collDetect()
  {
    BoardCol();
    BlockCol();
    WallCol();
  }
  void BoardCol()
  {
    if ((Y+Rad>=485)&&((X+Rad>=brd.X)&&(X-Rad<=brd.X+brd.bWidth)))
    {
      reflectVert();
      Dir += areatest();
      recalcChanges();
    }
  }
  float areatest()
  {
    float val = X+Rad - brd.X;
    return map(val, -Rad, brd.bWidth+2*Rad, -35, 35);
  }

  void BlockCol()
  {
    for (int i = blList.size()-1; i >= 0; i -=1)
    {
      Block temp = (Block)blList.get(i);
      float fact = 1.5;
      if (((Y+fact*Rad >= temp.Y)&&(Y-fact*Rad <= temp.Y+temp.hei))&&((X+fact*Rad >= temp.X)&&(X-fact*Rad <= temp.X+temp.wid)))
      {
        //        float antifact = 0.5;
        //        if ((X+Rad*antifact>= temp.X)&&(X-Rad*antifact <= temp.X+temp.wid))reflectVert();
        //        if ((Y+Rad*antifact >= temp.Y)&&(Y-Rad*antifact <= temp.Y+temp.hei))reflectHor();
        if (((Y+Rad >= temp.Y)&&(Y-Rad <= temp.Y+temp.hei))&&((X+Rad >= temp.X)&&(X-Rad <= temp.X+temp.wid)))
        {
          if ((X+Rad >= temp.X)  &&  (X-Rad <= temp.X))  
          {      
            reflectHor(true);
          }
          else if ((X-Rad <= (temp.X+temp.wid)) && (X+Rad >= (temp.X+temp.wid)))
          {
            reflectHor(false);
          }
          if ((Y+Rad >= temp.Y && Y-Rad <= temp.Y)) 
          {
            reflectVert(true);
          }
          else if ((Y-Rad <= temp.Y+temp.hei && Y+Rad >= temp.Y+temp.hei))
          {
            reflectVert(false);
          }
          //        float dX = X-temp.X;
          //        float dY = Y-temp.Y;
          //        float deg = atan(dX/dY);
          //        if((dX <= -Rad)||(dY >= temp.hei + Rad))reflectHor();
          //        if((dY <= -Rad)||(dY >= temp.wid +Rad)) reflectVert();
          if (blList.get(i) instanceof BallSplitBlock)
          {
            specialAction();
          }
          damage(i);
          return;
        }
      }
    }
  }
  void WallCol()
  {
    for (int i = wallList.size()-1; i >= 0; i -=1)
    {
      Block temp = (Block)wallList.get(i);
      float fact = 1.5;
      if (((Y+fact*Rad >= temp.Y)&&(Y-fact*Rad <= temp.Y+temp.hei))&&((X+fact*Rad >= temp.X)&&(X-fact*Rad <= temp.X+temp.wid)))
      {
        //        float antifact = 0.5;
        //        if ((X+Rad*antifact>= temp.X)&&(X-Rad*antifact <= temp.X+temp.wid))reflectVert();
        //        if ((Y+Rad*antifact >= temp.Y)&&(Y-Rad*antifact <= temp.Y+temp.hei))reflectHor();
        if (((Y+Rad >= temp.Y)&&(Y-Rad <= temp.Y+temp.hei))&&((X+Rad >= temp.X)&&(X-Rad <= temp.X+temp.wid)))
        {
          if ((X+Rad >= temp.X)  &&  (X-Rad <= temp.X))  
          {      
            reflectHor(true);
          }
          else if ((X-Rad <= (temp.X+temp.wid)) && (X+Rad >= (temp.X+temp.wid)))
          {
            reflectHor(false);
          }
          if ((Y+Rad >= temp.Y && Y-Rad <= temp.Y)) 
          {
            reflectVert(true);
          }
          else if ((Y-Rad <= temp.Y+temp.hei && Y+Rad >= temp.Y+temp.hei))
          {
            reflectVert(false);
          }
          //        float dX = X-temp.X;
          //        float dY = Y-temp.Y;
          //        float deg = atan(dX/dY);
          //        if((dX <= -Rad)||(dY >= temp.hei + Rad))reflectHor();
          //        if((dY <= -Rad)||(dY >= temp.wid +Rad)) reflectVert();
          return;
        }
      }
    }
  }
  void specialAction()
  {
    Balls.add(new Ball(X,Y));
  }
  void damage(int ind)
  {
    ((Block)blList.get(ind)).BallHit(dmg);
  }

  //D R A W - F U N C T I O N ////////

  public void drw()
  {
    fill(col);
    ellipse(X, Y, Rad*2, Rad*2);
  }
}

