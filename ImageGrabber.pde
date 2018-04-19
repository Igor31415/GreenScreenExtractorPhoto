class ImageGrabber extends Module {
  File directory;
  String myImgPath = "";
  String [] fileList;
  PImage []imgs;
  int cursor = 0;
  int setOutputWidth = 800;
  int setOutputHeight = 600;
  int outputHeight;
  int outputWidth;
  int widthOffset;
  int heightOffset;

  ImageGrabber(PApplet parent, int x, int y, String path) {
    super(parent);
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

    cp5.addButton("<<<")
      .setValue(0)
      .setPosition(0, 0)
      .setSize(50, 30);

    cp5.addButton(">>>")
      .setValue(0)
      .setPosition(50, 0)
      .setSize(50, 30);

    cp5.addTextarea("txt")
      .setPosition(150, 0)
      .setSize(150, 100)
      .setFont(createFont("arial", 14))
      .setLineHeight(14)
      .setColor(color(240))
      .setColorBackground(color(255, 1))
      .setColorForeground(color(255, 1))
      .setText("ImageGrabber")
      ;
  }

  PImage draw(PImage i) {
    //output = imgs[cursor];

    if (imgs[cursor].width > imgs[cursor].height) {
      outputWidth = round(setOutputHeight * (imgs[cursor].width/((float)imgs[cursor].height)));
      widthOffset = round(imgs[cursor].width/2 - setOutputWidth/2);
      if (widthOffset < 0) widthOffset =0;
      imgs[cursor].resize(outputWidth, setOutputHeight);
      output = imgs[cursor].get(widthOffset, 0, setOutputWidth, setOutputHeight);
    } else {
      outputHeight = round(setOutputWidth * (imgs[cursor].height/((float)imgs[cursor].width)));
      heightOffset = round(imgs[cursor].height/2 - setOutputHeight/2);
      if (heightOffset < 0) heightOffset =0;
      imgs[cursor].resize(setOutputWidth, outputHeight);
      output = imgs[cursor].get(0, heightOffset, setOutputWidth, setOutputHeight);
    }
    image(output, x, y+30, setOutputWidth/2, setOutputHeight/2);
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