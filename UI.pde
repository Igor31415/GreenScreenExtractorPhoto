class UI {
  ControlP5 cp5;

  UI(PApplet parent) {
    cp5 = new ControlP5(parent);

    cp5.addButton("AMod>>>")
      .setValue(0)
      .setPosition(452, grabberAposY)
      .setSize(80, 30)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
          activeModules[0].cp5.setPosition(10000, 1000);
          cursorA += 1;
          cursorA %= A.length;
          activeModules[0] = A[cursorA];
          activeModules[0].cp5.setPosition(activeModules[0].x, activeModules[0].y);
        }
      }
    }
    );

    cp5.addButton("<<<AMod")
      .setValue(0)
      .setPosition(372, grabberAposY)
      .setSize(80, 30)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
          activeModules[0].cp5.setPosition(10000, 1000);
          cursorA += A.length -1;
          cursorA %= A.length;
          activeModules[0] = A[cursorA];
          activeModules[0].cp5.setPosition(activeModules[0].x, activeModules[0].y);
        }
      }
    }
    );

    cp5.addButton("BMod>>>")
      .setValue(0)
      .setPosition(452, grabberBposY)
      .setSize(80, 30)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
          activeModules[1].cp5.setPosition(10000, 1000);
          cursorB += 1;
          cursorB %= B.length;
          activeModules[1] = B[cursorB];
          activeModules[1].cp5.setPosition(activeModules[1].x, activeModules[1].y);
        }
      }
    }
    );

    cp5.addButton("<<<BMod")
      .setValue(0)
      .setPosition(372, grabberBposY)
      .setSize(80, 30)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction() == ControlP5.ACTION_RELEASE) {
          activeModules[1].cp5.setPosition(10000, 1000);
          cursorB += B.length -1;
          cursorB %= B.length;
          activeModules[1] = B[cursorB];
          activeModules[1].cp5.setPosition(activeModules[1].x, activeModules[1].y);
        }
      }
    }
    );
  }
}