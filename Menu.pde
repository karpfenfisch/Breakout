class Menu implements Idrawable
{ 
  public boolean active = false;
  Button[] butArr = new Button[4];
  int boardsizecost = 10;

  public void drw()
  {
    //if (active)for (int i = 0;i < butArr.length;i+=1)butArr[i].drw();
  }
  public void checkButtons()
  {
    for (int i = butArr.length-1;i>= 0;i-=1)
    {
      //if (butArr[i].mouseOver())ButtonFunction(i);
    }
  }
  void controlEvent(ControlEvent theEvent) 
  {
  println("!!!!!!!!!!!!!!!!!!!!!!!!");
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
    //mkButtons();
  }
  public Menu() 
  {
    controlWindow = cp5.addControlWindow("Menu",100,100,400,200)
                     .hideCoordinates()
                     .setBackground(color(40))
                     ;
    cp5.addButton("Boardsize")
      .setPosition(1,1)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Start")
      .setPosition(1,32)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Faster_Board")
      .setPosition(1,63)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Additional_Ball")
      .setPosition(1,94)
      .setSize(398,30)
      .setWindow(controlWindow);
    //mkButtons();
    cp5.window("Menu").hide();
  }
  public void Start()
  {
    println("!!!!!!!!!!????????????!!!!!!!!!!!!");
    game.startNew();
  }
  public void Boardsize()
  {
    println("!!!!!!!!!!!!!!!!!!!!!!!!");
    if (game.money >= boardsizecost)
      {
        brd.bWidth += 10;
        game.money -=boardsizecost;
        boardsizecost*=2;
      }
    println("?????????????");
  }
  public void mkButtons()
  {
    cp5.addButton("Boardsize")
      .setPosition(1,1)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Start")
      .setPosition(1,32)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Faster_Board")
      .setPosition(1,63)
      .setSize(398,30)
      .setWindow(controlWindow);
    cp5.addButton("Additional_Ball")
      .setPosition(1,94)
      .setSize(398,30)
      .setWindow(controlWindow);
//    butArr[1] = new Button(5, 190, "Boardsize +10 "+boardsizecost+"$");
//    butArr[0] = new Button(5, 5, "START AGAIN/NEXT");
//    butArr[2] = new Button(5, 225, "FASTER BOARD     35$");
//    butArr[3] = new Button(5, 260, "ADDITIONAL BALL        50$");
  }
}

