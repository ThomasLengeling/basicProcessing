
MidiIO midiIO;

//Values for Sliders
String [] sliders= {
  "bkgValue", "radioVal", "slider03", "slider04", "slider05", "slider06", "slider07", "slider08"
};
float [] sliderMin= {
  0, 1, 0, 0, 0.4, 0, 1, 1
};

float [] sliderMax= {
  255, 150, TWO_PI, TWO_PI, 3.5, 1, 550, 550
};

float [] sliderDefaulValues = {
  0, 100, 90, 50, 1, 0, 0, 1
};
//Declaramos valores para los knobs
String [] knobs= {
  "alphaValue", "knob02", "knob03", "knob04", "knob05", "knob06", "knob07", "knob08"
};
float [] knobMin= {
  0, 0, 0, 10, 10, 10, 0, 0
};
float [] knobMax= {
  255, 2555, 4, 400, 500, 500, 255, 255
};
float [] knobDefaulValues = {
  255, 0, 1, 20, 10, 10, 0, 255
};

//Values for Buttons
String [] butt1= {
  "shapeChanger", "button02", "button03", "button04", "button05", "button06", "button07", "button08"
};
String [] butt2= {
  "button11", "button12", "button13", "button14", "button15", "button16", "button17", "button18"
};

String [] butt3= {
  "button21", "button22", "button23", "button24", "button25", "button26", "button27", "button28"
};

void noteOff(Note note, int device, int channel) {
  int num = note.getPitch();
  int val = 0;
  int index=num%10 - 1;
  int group=num/10;

  println("num"+ num);
  if (group == 0 && index< sliders.length) {
    controlP5.controller(sliders[index]).setValue(map(val, 0, 127, sliderMin[index], sliderMax[index]));
  } 
  else if (group == 1 && index< knobs.length) {
    controlP5.controller(knobs[index]).setValue(map(val, 0, 127, knobMin[index], knobMax[index]));
  }
  else if (group == 2 && index< butt1.length) {
    controlP5.controller(butt1[index]).setValue(val);
  }
  else if (group == 3 && index< butt2.length) {
    controlP5.controller(butt2[index]).setValue(val);
  }
  else if (group ==4 && index< butt3.length) {
    controlP5.controller(butt3[index]).setValue(val);
  }
}

void controllerIn(promidi.Controller controller, int device, int channel) {
  int num = controller.getNumber();
  int val = controller.getValue();

  int index=num%10 - 1;
  int group=num/10;

  //  println(group+ "group");
  //  println(index+ "index");

  if (group == 0 && index< sliders.length) {
    controlP5.controller(sliders[index]).setValue(map(val, 0, 127, sliderMin[index], sliderMax[index]));
  } 
  else if (group == 1 && index< knobs.length) {
    controlP5.controller(knobs[index]).setValue(map(val, 0, 127, knobMin[index], knobMax[index]));
  }
  else if (group == 2 && index< butt1.length) {
    controlP5.controller(butt1[index]).setValue(val);
  }
  else if (group == 3 && index< butt2.length) {
    controlP5.controller(butt2[index]).setValue(val);
  }
  else if (group ==4 && index< butt3.length) {
    controlP5.controller(butt3[index]).setValue(val);
  }
}


//SET UP FOR MIDI
void setupMidi() {
  try {
    midiIO = MidiIO.getInstance(this);
    midiIO.printDevices();
    midiIO.openInput(0, 0);
  }
  catch(java.lang.IndexOutOfBoundsException e) {
    println("-----//////////////////////////-------");
    println("NO MIDI CONECTED");
    println("-----//////////////////////////-------");
  }
}

