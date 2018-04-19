class Chroma  extends Module {
  float treshold = 0;
  PVector target;
  PVector targetPos;
  int grabberHeight = 300;
  int grabberWidth;
  boolean toggle = false;

  Chroma(PApplet parent, int x, int y) {
    super(parent);
    
    target = new PVector();
    targetPos = new PVector();
    this.x = x;
    this.y = y;
    this.cp5.setPosition(10000, 10000);

    cp5.addSlider("Threshold")
      .setPosition(0, 0)
      .setSize(100, 20)
      .setRange(0, 0.4)
      .setValue(0)
      .setColorBackground(color(160, 20, 60))
      .setColorForeground(color(240, 20, 60))
      .setColorActive(color(240, 20, 59))
      ;

    cp5.addButton("SetTarget")
      .setValue(0)
      .setPosition(0, 0+30)
      .setSize(486, grabberHeight)
      .setColorForeground(color(0, 1))
      .setColorBackground(color(0, 1))
      .setColorActive(color(0, 1))
      .setLabel("")
      ;

    cp5.addToggle("toggle")
      .setPosition(200, 00)
      .setSize(50, 20)
      .setValue(false)
      .setMode(ControlP5.SWITCH)
      .setColorBackground(color(160, 20, 60))
      .setColorForeground(color(240, 20, 60))
      .setColorActive(color(240, 20, 59))
      .setLabel("")
      ;
  }

  void setTreshold(float t) {
    treshold = t;
  }

  void setTarget(int x, int y) {
    targetPos.set(x, y);
    int c = get(x, y);
    target.set(
      c >> 16 & 0xFF, 
      c >> 8 & 0xFF, 
      c >> 0 & 0xFF
      );
    target = RGBtoHSB(target);
    println(target);
  }

  void drawTarget() {
    //println(targetPos);
    ellipseMode(CENTER);
    stroke(255);
    strokeWeight(3);
    colorMode(HSB, 1, 1, 1);
    fill(target.x, target.y, target.z);
    ellipse(targetPos.x, targetPos.y, 20, 20);
    colorMode(RGB, 255, 255, 255);
  }

  PImage draw(PImage input) {    //reçoit l'imput du greenScreenExtractor

    grabberWidth = round(output.width*(grabberHeight/((float)output.height)));
    if (input == null) return output;
    if (output.width != input.width || output.height != input.height) output = createImage(input.width, input.height, ARGB);
    if (toggle) {
      chromaProcess(input);
    }
    image(toggle ? output : input, x, y+30, grabberWidth, grabberHeight);
    if (targetPos.x!=0 || targetPos.y!=0 || targetPos.z!=0) {
      drawTarget();
    }
    return output;
  }

  void chromaProcess(PImage input) {
    input.loadPixels();
    output.loadPixels();
    for (int i = 0; i < input.pixels.length; i ++) {
      int a = input.pixels[i] >> 24 & 0xFF;
      int r = input.pixels[i] >> 16 & 0xFF;
      int g = input.pixels[i] >> 8 & 0xFF;
      int b = input.pixels[i] >> 0 & 0xFF;
      PVector current = RGBtoHSB(r, g, b);
      float dd = abs(current.x - target.x);
      output.pixels[i] = color(r, g, b, a * (dd < treshold ? 0 : 255));
    }
    input.updatePixels();
    output.updatePixels();
  }

  PVector RGBtoHSB(int r, int g, int b) {
    return RGBtoHSB(new PVector (r, g, b));
  }
  PVector RGBtoHSB(PVector input) {
    float hue, saturation, brightness;
    int r = (int)input.x;
    int g = (int)input.y;
    int b = (int)input.z;
    PVector output = new PVector();
    int cmax = (r > g) ? r : g;
    if (b > cmax) cmax = b;
    int cmin = (r < g) ? r : g;
    if (b < cmin) cmin = b;
    brightness = ((float) cmax) / 255.0f;
    if (cmax != 0)
      saturation = ((float) (cmax - cmin)) / ((float) cmax);
    else
      saturation = 0;
    if (saturation == 0)
      hue = 0;
    else {
      float redc = ((float) (cmax - r)) / ((float) (cmax - cmin));
      float greenc = ((float) (cmax - g)) / ((float) (cmax - cmin));
      float bluec = ((float) (cmax - b)) / ((float) (cmax - cmin));
      if (r == cmax)
        hue = bluec - greenc;
      else if (g == cmax)
        hue = 2.0f + redc - bluec;
      else
        hue = 4.0f + greenc - redc;
      hue = hue / 6.0f;
      if (hue < 0)
        hue = hue + 1.0f;
    }
    output.x = hue;
    output.y = saturation;
    output.z = brightness;
    return output;
  }
}