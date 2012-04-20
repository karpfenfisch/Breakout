public ArrayList blList;
public ArrayList wallList;
public ArrayList Balls;
public Board brd;
public Game game;
public Menu menu;
public Levels levels;
public boolean upd = true;
public int Lev = 1;

void setup()
{
  size(500, 500);
  background(00);
  cursor(CROSS);
  game = new Game();
  menu = new Menu();
  levels = new Levels();
  Balls = new ArrayList();
  blList = new ArrayList();
  wallList = new ArrayList();
  brd = new Board(mouseX);
  levels.LoadLevel(1);
}

void mouseClicked()
{
  game.addBall();
  if (menu.active)menu.checkButtons();
}
void keyPressed()
{
  if ( key == 's')
  {
    if (frameRate >= 60) frameRate(60);
    else frameRate(120);
  }
  else if (key == 'h')
  {
    if (game.HC)game.HC = false;
    else game.HC = true;
  }
  else if (key == ' ')
  {
    if (!game.win&&!game.gmover)
    {
      if (upd)upd=false;
      else upd = true;
    }
  }
}
void draw()
{
  println(frameRate);
  if (upd) 
  {
    updateAll();
    updateAll();
    updateAll();
  }
  background(00);
 
  drawAll();
}

void updateAll()
{
  game.update();
  brd.update();
  for (int i = Balls.size()-1; i >= 0; i-=1)((Iupdateable)Balls.get(i)).update();
}
void drawPause()
{
  fill(255, 255, 255, 150);
  rect(-5, -5, 505, 505);
  fill(00);
  textSize(85);
  if (game.gmover)text("GAME OVER", 8, 150);
  else if (game.win)text("VICTORY", 65, 150);
  else text("PAUSE", 120, 150);
  if (menu.active)drawMenu();
}
void drawMenu()
{
  menu.drw();
  fill(#FF0000);
  //Life and Money in Menu
  textSize(20);
  text(game.Lifes, 60, 485);
  text("Balls:", 10, 485);
  text(game.money, 450, 485);
  text("$", 485, 485);
}
void drawGame()
{
  //grey bar on top of the screen during game
  fill(200);
  rect(-1, -1, 502, 27);
  //Life, Money and Time during Game
  fill(#FF0000);
  textSize(20);
  text("Balls:", 10, 20);
  text(game.Lifes, 60, 20);
  text(game.money, 450, 20);
  text("$", 485, 20);
  text(game.time, 200, 20);
}
void drawAll()
{
  if (!upd) drawPause();
  else 
  {
   //Crosshair
  fill(#00FF00);
  rect(mouseX, 0, 2, 500);
  rect(0, mouseY, 500, 2);
  //EndCrosshair
  drawGame();
  brd.drw();
  for (int i = blList.size()-1; i >= 0; i -= 1) ((Idrawable)blList.get(i)).drw();
  for (int i = wallList.size()-1; i >= 0; i -= 1) ((Idrawable)wallList.get(i)).drw();
  for (int i = Balls.size()-1; i >= 0; i -= 1) ((Idrawable)Balls.get(i)).drw();
  }
}

