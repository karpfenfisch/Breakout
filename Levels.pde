class Levels
{
  ArrayList levList = new ArrayList();
  BufferedReader reader;
  public void LoadLevel(int number)
  {
    blList = ((Level)levList.get(number-1)).blocks;
    wallList = ((Level)levList.get(number-1)).walls;
  }

  public Levels()
  {
    mkLevels();
    addLevels();
  }
  void ReadLevel(String Path) throws Exception //FORMAT-RULES: First number ob blocks in heigth and width; Example: h6w11 
  //              At the end of the document: x
  {
    Level tempLev = new Level();
    String Temp;
    float hei = 0;
    float wid = 0;
    reader = createReader(Path);
    Temp=reader.readLine();
    println(Temp);
    int indexw = 0;
    if (Temp.charAt(0)!='h')throw new Exception("LevelFile corrupt");
    indexw = Temp.indexOf("w");
    hei = Integer.valueOf(Temp.substring(1, indexw));
    println(hei);
    wid = Integer.valueOf(Temp.substring(indexw+1));
    wid = width/wid;
    float bhei = 400 / hei;
    for (int cnt = 0; cnt < hei; cnt += 1)
    {
      Temp = reader.readLine();
      println(Temp);
      float x = 0;
      float y = 20 + hei + cnt * bhei;
      for (int i = 0; i < Temp.length(); i += 1)
      {
        switch(Temp.charAt(i))//Known Symbols
        {
        case ' ': 
          break;
        case 'X':
          tempLev.AddBallSplit(x, y, wid, bhei);
          break;
        case 'B': 
          tempLev.AddBlock(wid, bhei, x, y); 
          break;
        case 'S': 
          tempLev.AddSplit(x, y, wid, bhei, 3);
          break;
        case 'W':
          tempLev.AddWall(x, y, wid, bhei);
          break;
        case 'M':
          tempLev.AddMultiSplit(x, y, wid, bhei, 3, 2);
          break;
        default: 
          throw new Exception("Unrecogniced Symbol!");
        }
        x += wid;
      }
    }
    Temp = reader.readLine();
    if (Temp.charAt(0) != 'x')throw new Exception("End Errror!");
    levList.add(tempLev);
  }
  void addLevels()
  {
    try
    {
      ReadLevel("/Levels/LevelTriangle.txt");
      ReadLevel("/Levels/LevelBSplit.txt");
      ReadLevel("/Levels/LevelTest.txt");
      ReadLevel("/Levels/LevelSplit.txt");
    }
    catch(Exception e) {
      println(e);
    }
  }
  //TestLevels
  Level BallSplitTest = new Level();
  Level multisplittest = new Level();
  //END Testlevels
  void mkLevels()
  {
    BallSplitTest.AddBallSplit(100, 100, 300, 200);
    multisplittest.AddMultiSplit(100, 100, 300, 200, 5, 5);
  }
  class Level
  {
    ArrayList blocks = new ArrayList();
    ArrayList walls = new ArrayList();

    Level()
    {
    }
    public void AddBallSplit(float x, float y, float wid, float hei)
    {
      blocks.add(new BallSplitBlock(x, y, wid, hei));
    }
    public void AddWall(float x, float y, float wid, float hei)
    {
      walls.add(new Wall(x, y, wid, hei));
    }
    public void AddSplit(float x, float y, float wid, float hei, int LH)
    {
      blocks.add(new SplitBlock(x, y, wid, hei, LH));
    } 
    public void AddMultiSplit(float x, float y, float wid, float hei, int LH, int splits)
    {
      blocks.add(new MultiSplit(x, y, wid, hei, LH, splits));
    }

    Level(int x0, int y0, int x1, int y1, int numX, int numY)
    {
      AddBlockField(numX, numY, x0, y0, x1, y1);
    }
    public void AddBlock(float wid, float hei, float x, float y)
    {
      blocks.add(new Block(x, y, wid, hei));
    }
    public void AddBlockLine(float num, float thi, float posY)
    {
      for (int i=0;i<num;i+=1)
      {
        blocks.add(new Block(i*width/num, posY, width/num, thi));
      }
    }
    public void AddBlockField(float numx, float numy, int x0, int y0, int x1, int y1)
    {
      for (int i=1;i<numy+1;i+=1)
      {
        AddBlockLine(numx, (y1-y0)/numy, y0+i*(y1-y0)/numy);
      }
    }
  }
}

