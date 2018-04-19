void interactionSetup() {

  A[0].cp5.getController("<<<")              //Handle the callbacks for the first instance of the ImageGrabber
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((ImageGrabber)activeModules[0]).previous();
      }
    }
  }
  );
  A[0].cp5.getController(">>>")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((ImageGrabber)activeModules[0]).next();
      }
    }
  }
  );    



  B[0].cp5.getController("<<<")              //Handle the callbacks for the second instance of the ImageGrabber
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((ImageGrabber)activeModules[1]).previous();
      }
    }
  }
  );
  B[0].cp5.getController(">>>")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((ImageGrabber)activeModules[1]).next();
      }
    }
  }
  );    





  A[1].cp5.getController("Threshold")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      ((Chroma)activeModules[0]).setTreshold(theEvent.getController().getValue());
    }
  }
  );
  A[1].cp5.getController("SetTarget")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        if (!((Chroma)activeModules[0]).toggle) {
          ((Chroma)activeModules[0]).setTarget(mouseX, mouseY);
        }
      }
    }
  }
  );
  A[1].cp5.getController("toggle")              //Handle the callbacks for the first instance of the Chroma
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((Chroma)activeModules[0]).toggle = !((Chroma)activeModules[0]).toggle;
        //println(((Chroma)activeModules[0]).toggle);
      }
    }
  }
  );  





  B[1].cp5.getController("Threshold")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      ((Chroma)activeModules[1]).setTreshold(theEvent.getController().getValue());
    }
  }
  );
  B[1].cp5.getController("SetTarget")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        if (!((Chroma)activeModules[1]).toggle) {
          ((Chroma)activeModules[1]).setTarget(mouseX, mouseY);
        }
      }
    }
  }
  );
  B[1].cp5.getController("toggle")              //Handle the callbacks for the second instance of the Chroma
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((Chroma)activeModules[1]).toggle = !((Chroma)activeModules[1]).toggle;
        //println(((Chroma)activeModules[0]).toggle);
      }
    }
  }
  );
  
  
  
  
  
  A[2].cp5.getController("<<<")              //Handle the callbacks for the first instance of the ImageGrabber
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((BGSelector)activeModules[0]).previous();
      }
    }
  }
  );
  A[2].cp5.getController(">>>")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((BGSelector)activeModules[0]).next();
      }
    }
  }
  );    





  B[2].cp5.getController("<<<")              //Handle the callbacks for the second instance of the ImageGrabber
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((BGSelector)activeModules[1]).previous();
      }
    }
  }
  );
  B[2].cp5.getController(">>>")
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
        ((BGSelector)activeModules[1]).next();
      }
    }
  }
  );
}    