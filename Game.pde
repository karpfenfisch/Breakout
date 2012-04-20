class Game implements Iupdateable
{
  public int Lifes = 3;
  boolean over = false;
  public boolean win = false;
  public boolean gmover = false;
  public int money = 0;
  public int time = 0;
  public boolean HC = false;

  public Game() {
  }
  public void startNew()
  {
    upd = true;
    win = false;
    gmover = false;
    menu.active = false;
    levels = new Levels();
    levels.LoadLevel(Lev);
    over = false;
    time = 0;
  }
  public void win()
  {
    over = true;
    println("WIN");
    upd = false;
    win = true;
    Lifes += 3;
    Balls.clear();
    menu.active = true;
    Lev += 1;
  }
  public void gameover()
  {
    over = true;
    println("GAME OVER");
    upd = false;
    gmover = true;
    Lifes = 3;
    Balls.clear();
    menu.active = true;
  }
  public void update()
  {
    if (Balls.size()!= 0)
      time += 1;
    if (Lifes <= 0&&Balls.size()==0)gameover();
    else if (blList.size() == 0)win();
  }
  public void addBall()
  {
    if (!over&&Lifes>0)
    {
      if(HC)
      {
        Balls.add(new HCBall(mouseX, 480));
      }
      else
      {
      Balls.add(new Ball(mouseX, 480));
      }
      Lifes -= 1;
    }
  }
}

