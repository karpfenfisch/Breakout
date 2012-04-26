import controlP5.*;
PImage curs = new PImage();//needed for invisible cursor

public ArrayList blList; //List that contains all Blocks (used for detecting win(if empty))
public ArrayList wallList; //List that contains all Walls(Blocks that cannot be destroyed(ignored for detecting win))
public ArrayList Balls; //List that contains all Balls that are active at the time
public Board brd;
public Game game;
public Menu menu;
public Levels levels;
public boolean upd = true;
public int Lev = 1;
public ControlP5 cp5;
public Button bttest;
public ControlWindow controlWindow;
void setup()
{
  size(500, 500);
  background(00);
  cp5 = new ControlP5(this);
  cursor(curs,0,0);
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
  //if (menu.active)menu.checkButtons();
}
void keyPressed()
{
  if ( key == 's')
  {//Toggle betwenn 60 and 120 fps
    if (frameRate >= 60) frameRate(60);
    else frameRate(120);
  }
  else if (key == 'h') game.HC = !game.HC; //Toggle between the usage of HCBalls and Balls
  else if (key == ' ') if (!game.win&&!game.gmover) upd = !upd; //Toggle between paused game and running game
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
  // if (menu.active)drawMenu();
}
//void drawMenu()
//{
//  menu.drw();
//  fill(#FF0000);
//  //Life and Money in Menu
//  textSize(20);
//  text(game.Lifes, 60, 485);
//  text("Balls:", 10, 485);
//  text(game.money, 450, 485);
//  text("$", 485, 485);
//}
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

