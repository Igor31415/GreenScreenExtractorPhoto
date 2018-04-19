class Module extends ModuleUI {
  Module(PApplet parent) {
    super(parent);
    output = createImage(1, 1, ARGB);
  }
  int x, y;
  PImage output;
  PImage draw(PImage i) {
    return output;
  }
}
class ModuleUI {
  ControlP5 cp5;
  ModuleUI(PApplet parent) {
    cp5 = new ControlP5(parent);
  }
}