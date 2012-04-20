class SplitBlock extends Block
{
  public SplitBlock(float x, float y, float wid, float hei, int LH)
  {
    super(x, y, wid, hei, LH);
  }
  public void BallHit(int dmg)
  {
    spl();
  }
  void spl()
  {
    blList.add(new Block(X, Y, wid/2, hei/2, LeftHits));
    blList.add(new Block(X+wid/2, Y, wid/2, hei/2, LeftHits));
    blList.add(new Block(X, Y+hei/2, wid/2, hei/2, LeftHits));
    blList.add(new Block(X+wid/2, Y+hei/2, wid/2, hei/2, LeftHits));
    blList.remove(blList.indexOf(this));
  }
}
class MultiSplit extends SplitBlock
{
  int toSplit = 2;
  public MultiSplit(float x, float y, float wid, float hei, int LH, int splits)
  {
    super(x, y, wid, hei, LH);
    toSplit = splits;
  }
  void spl()
  {
    toSplit -=1;
    int LH = 1;
    if(LeftHits -1 > 1)LH = LeftHits -1;
    if (toSplit == 1)
    {
      blList.add(new SplitBlock(X, Y, wid/2, hei/2, LH));
      blList.add(new SplitBlock(X+wid/2, Y, wid/2, hei/2, LH));
      blList.add(new SplitBlock(X, Y+hei/2, wid/2, hei/2, LH));
      blList.add(new SplitBlock(X+wid/2, Y+hei/2, wid/2, hei/2, LH));
      blList.remove(blList.indexOf(this));
    }
    else
    {
      blList.add(new MultiSplit(X, Y, wid/2, hei/2, LH, toSplit));
      blList.add(new MultiSplit(X+wid/2, Y, wid/2, hei/2, LH, toSplit));
      blList.add(new MultiSplit(X, Y+hei/2, wid/2, hei/2, LH, toSplit));
      blList.add(new MultiSplit(X+wid/2, Y+hei/2, wid/2, hei/2, LH, toSplit));
      blList.remove(blList.indexOf(this));
    }
  }
}

