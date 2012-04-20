class Button implements Idrawable
{
  float X;
  float Y;
  String Name;
  public Button(int x, int y, String name)
  {
    X = x;
    Y = y;
    Name = name;
  }
  public boolean mouseOver()
  {
    if(((mouseX > X)&&(mouseX < X+490))&&((mouseY < Y+30)&&(mouseY > Y)))return true;
    else return false;
  }
  public void drw()
  {
    fill(#000000);
    rect(X,Y,490,30);
    fill(#FFFFFF);
    textSize(25);
    text(Name,X+5,Y,490,30);
  }
}
