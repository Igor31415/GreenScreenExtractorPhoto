class Preview extends Module {
  float speed = 300;
  int t0;
  PImage ModuleAoutput;                //output sent by the active module from the A display
  PImage ModuleBoutput;                //output sent by the active module from the B display
  String textValue = "";

  int imgWidth = 800;
  int imgHeight;
  //int previewHeight = 840;

  Preview(PApplet parent) {
    super(parent);
    t0=millis();

    cp5.addSlider("Speed")
      .setPosition(550, 100)
      .setSize(100, 20)
      .setRange(1, 1000)
      .setValue(300)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        preview1.setSpeed(theEvent.getController().getValue());
      }
    }
    );
    cp5.addButton("Export")
      .setValue(0)
      .setPosition(1314, 80)
      .setSize(80, 40)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
          textValue = preview1.cp5.get(Textfield.class, "input").getText();
          saveGif(textValue);
        }
      }
    }
    );

    cp5.addTextfield("input")
      .setPosition(1000, 80)
      .setSize(300, 40)
      .setFont(createFont("arial", 20))
      .setColor(color(255))
      .setAutoClear(false)
      .setLabel("");
  }

  void draw(PImage imgA, PImage imgB) {
    if (output.width != imgA.width || output.height != imgA.height) output = createImage(imgA.width, imgA.height, ARGB);

    ModuleAoutput = imgA;
    ModuleBoutput = imgB;
    if (millis()-t0 > speed) {
      swapImg();
      t0 = millis();
      //println("swapImg");
    }

    imgHeight = round(output.height*(imgWidth/((float)output.width)));
    image(output, 550, (height/2)-(imgHeight/2), imgWidth, imgHeight);
  }

  void swapImg() {
    if (output == ModuleAoutput) {
      output = ModuleBoutput;
    } else {
      output = ModuleAoutput;
    }
  }

  void setSpeed(float s) {
    speed = s;
  }
}