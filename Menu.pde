class Menu implements Idrawable
{
  public boolean active = false;
  Button[] butArr = new Button[4];
  int boardsizecost = 10;

  public void drw()
  {
    if (active)
    {
      for (int i = 0;i < butArr.length;i+=1)
      {
        butArr[i].drw();
      }
    }
  }
  public void checkButtons()
  {
    for (int i = butArr.length-1;i>= 0;i-=1)
    {
      if (butArr[i].mouseOver())ButtonFunction(i);
    }
  }
  void ButtonFunction(int ind)
  {
    switch (ind)
    {
    case 1:
      if (game.money >= boardsizecost)
      {
        brd.bWidth += 10;
        game.money -=boardsizecost;
        boardsizecost*=2;
      }
      break;
    case 0:
      game.startNew();
      active = false;
      break;
    case 2:
      if (game.money >= 35)
      {
        game.money -= 35;
        brd.speed += 1;
      }
      break;
    case 3:
      if (game.money >= 50)
      {
        game.Lifes += 1;
        game.money -= 50;
      }
      break;
    }
    mkButtons();
  }
  public Menu() 
  {
    mkButtons();
  }
  public void mkButtons()
  {
    butArr[1] = new Button(5, 190, "Boardsize +10 "+boardsizecost+"$");
    butArr[0] = new Button(5, 5, "START AGAIN/NEXT");
    butArr[2] = new Button(5, 225, "FASTER BOARD     35$");
    butArr[3] = new Button(5, 260, "ADDITIONAL BALL        50$");
  }
}

