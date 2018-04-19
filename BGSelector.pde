class BGSelector extends Module {
  File directory;
  String myImgPath = "";
  String [] fileList;
  PImage []imgs;
  int cursor = 0;
  int grabberHeight = 275;
  int grabberWidth;
  PImage bg;                       //Background img
  PGraphics pg;

  BGSelector(PApplet parent, int x, int y, String path) {
    super(parent);
    pg = createGraphics(800, 600);
    myImgPath = path;
    directory = new File(myImgPath);
    fileList = directory.list();
    imgs = new PImage [fileList.length];
    this.x = x;
    this.y = y;

    for (int i=0; i<fileList.length; i++) {
      String [] splitedName = split(fileList[i], ".");

      if (splitedName.length < 2 ) 
      {
        continue;
      }

      if (splitedName[splitedName.length-1] .toLowerCase().equals ("jpg")  ||
        splitedName[splitedName.length-1] .toLowerCase().equals ("jpeg")  ||
        splitedName[splitedName.length-1] .toLowerCase().equals ("png"))
      {       
        imgs [i] = loadImage(myImgPath + "/" + fileList[i]);
      }
    }
    this.cp5.setPosition(x, y);
    this.cp5.setPosition(10000, 10000);

    cp5.addButton("<<<")      //ADD CALLBACK IN INTERACTIONSETUP
      .setValue(0)
      .setPosition(0, 0)
      .setSize(50, 30)
      .setColorBackground(color(60, 150, 54))
      .setColorForeground(color(45, 230, 60))
      .setColorActive(color(0, 250, 5))
      ;

    cp5.addButton(">>>")
      .setValue(0)
      .setPosition(50, 0)
      .setSize(50, 30)
      .setColorBackground(color(60, 150, 54))
      .setColorForeground(color(45, 230, 60))
      .setColorActive(color(0, 250, 5))
      ;

    cp5.addTextarea("txt")
      .setPosition(150, 0)
      .setSize(150, 100)
      .setFont(createFont("arial", 14))
      .setLineHeight(14)
      .setColor(color(240))
      .setColorBackground(color(255, 1))
      .setColorForeground(color(255, 1))
      .setText("BGSelector")
      ;
  }

  PImage draw(PImage i) {
    //if (output.width != i.width || output.height != i.height) output = createImage(800, 600, ARGB);
    grabberWidth = round(i.width*(grabberHeight/((float)i.height)));
    bg = imgs[cursor];
    /*pg.beginDraw();
     pg.background(0);
     pg.image(bg, 0, 0, 800, 600);
     pg.image(i, 0, 0, 800, 600);
     pg.endDraw();*/
    // output.loadPixels();
    //pg.loadPixels();


    //output.pixels = pg.pixels;
    //output.updatePixels();
    output = bg;
    image(output, x, y + 30, grabberWidth, grabberHeight);

    return output;
  }

  void next() {
    cursor++;
    cursor = cursor % imgs.length;
  }

  void previous() {
    cursor = cursor + imgs.length - 1;
    cursor = cursor % imgs.length;
  }
}