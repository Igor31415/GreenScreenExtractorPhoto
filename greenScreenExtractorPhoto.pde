import controlP5.*;
import gifAnimation.*;

Module activeModules [];    //Array containing the two current active modules
Module A [];                //Array containing all the modules available to browse for the upper display
Module B [];                //Array containing all the modules available to browse for the bottom display
int cursorA = 0;            //Pointer to the current active module for A[]
int cursorB = 0;            //Pointer to the current active module for B[]
UI ui;
Preview preview1;
String myPath = "C:/Users/Igor/Desktop/STAGE2018/greenScreenExtractorPhoto/Output/";   //Path to the output folder, where the Gif will be saved
String pathA = "C:/Users/Igor/Desktop/STAGE2018/greenScreenExtractorPhoto/A";          //path to the inputA folder. (pictures)
String pathB = "C:/Users/Igor/Desktop/STAGE2018/greenScreenExtractorPhoto/B";          //path to the inputB folder.   ""
String pathC = "C:/Users/Igor/Desktop/STAGE2018/greenScreenExtractorPhoto/C";          //path to the background folder.   ""
int grabberAposY = 46-30;
int grabberBposY = 400-30;

void setup() {
  size (1440, 745, P3D);

  activeModules = new Module [2];

  A = new Module [3];
  B = new Module [3];

  A[0] = new ImageGrabber(this, 46, grabberAposY, pathA);      //Stocks the first instance of the ImageGrabber class in A[0]
  B[0] = new ImageGrabber(this, 46, grabberBposY, pathB);    //Stocks the second instance of the ImageGrabber class in B[0]

  A[1] = new Chroma(this, 46, grabberAposY);          //Stocks the first instance of the Chroma class in A[1]
  B[1] = new Chroma(this, 46, grabberBposY);            //Stocks the first instance of the Chroma class in B[1]

  A[2] = new BGSelector(this, 46, grabberAposY, pathC);
  B[2] = new BGSelector(this, 46, grabberBposY, pathC);
  interactionSetup();

  ui = new UI(this);

  activeModules[0] = A[cursorA];                        //Set the current active modules for A as activeModules 0
  activeModules[1] = B[cursorB];                        //Set the current active modules for B as activeModules 1

  preview1 = new Preview(this);
}

void draw() {
  background(25, 1, 45);

  activeModules[0].draw(cursorA > 0 ? A[cursorA-1].output : null);
  activeModules[1].draw(cursorB > 0 ? B[cursorB-1].output : null);
  /*
  if (activeModules[0]==A[0] || activeModules[0]==A[1]) {        //If the active module for the A display is either ImageGrabber or Chroma, you feed the grabber output to the draw(PImage)
   activeModules[0].draw(A[0].output);
   }
   if (activeModules[1]==B[0] || activeModules[1]==B[1]) {       //If the active module for the B display is either ImageGrabber or Chroma, you feed the grabber output to the draw(PImage)
   activeModules[1].draw(B[0].output);
   }
   if (activeModules[0]==A[2]) {                                 // When the active module is the BGSelector, the input for the draw(PImage) must be the output from the Chroma.
   activeModules[0].draw(A[1].output);
   }
   if (activeModules[1]==B[2]) {                                // bis
   activeModules[1].draw(B[1].output);
   }
   */
  preview1.draw(activeModules[0].output, activeModules[1].output);    //Feed the output of the activeModules to the preview draw(PImage,PImage)
}


void saveGif(String name) {
  GifMaker gifExport = new GifMaker((PApplet)this, myPath + name + ".gif");
  gifExport.setRepeat(0);
  //gifExport.setTransparent(0,0,0);
  //gifExport.setTransparent(3,253,5);
  gifExport.setDelay(parseInt(preview1.speed));
  gifExport.addFrame(preview1.ModuleAoutput);
  gifExport.setDelay(parseInt(preview1.speed));
  gifExport.addFrame(preview1.ModuleBoutput);
}