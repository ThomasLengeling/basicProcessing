ControlP5 controlP5;
ControlWindow controlWindow;

//creation Second Window
public class PFrame extends JFrame {

  secondApplet s;
  public PFrame() {
    setBounds(0, 0, 940, 370);
    s = new secondApplet();
    add(s);
    s.init();
    show();
  }
}

public class secondApplet extends PApplet {
  public void setup() {
    background(0);
    menuSetup();
  }

  public void draw() {
    background(0);
  }


  public void menuSetup() {
    controlP5 = new ControlP5(this);
    controlP5.setAutoDraw(true);
    
    
    //Korg nano-kontrol automatic gui creation
    int x1=10;
    int y1=10;

    for (int i=0; i < sliders.length; i++)
      controlP5.addSlider(sliders[i]).setRange(sliderMin[i], sliderMax[i]).setValue(sliderDefaulValues[i])
        .setPosition(x1+60+i*115, y1+100).setSize(18, 180)
          .setColorForeground(color(255));

    for (int i=0; i < knobs.length; i++) {
      controlP5.addKnob(knobs[i]).setRange(knobMin[i], knobMax[i]).setValue(knobDefaulValues[i])
        .setPosition(x1+i*118, y1).setRadius(35).setViewStyle(Knob.ARC)
          .setDragDirection(Knob.VERTICAL).setColorBackground(color(0, 160, 100))
            .setColorForeground(color(255));
    }

    for (int i=0; i < butt1.length; i++) {
      controlP5.addToggle(butt1[i]).setValue(false).setPosition(x1+i*115, y1+100).setValue(false)
        .setSize(35, 35).setColorActive(color(255));
    }

    for (int i=0; i < butt2.length; i++) {
      controlP5.addToggle(butt2[i]).setValue(false).setPosition(x1+i*115, y1+170).setValue(false)
        .setSize(35, 35).setColorActive(color(255));
    }

    for (int i=0; i < butt3.length; i++) {
      controlP5.addToggle(butt3[i]).setValue(false).setPosition(x1+i*115, y1+230).setValue(false)
        .setSize(35, 35).setColorActive(color(255));
    }
  }
  
  //NAME OF THE FUNTIONs
  void bkgValue(float a){
    bkgColor = a;
  }
  
  void alphaValue(float a){
    alphaVal  =a;
  }
  
  void shapeChanger(){
     changeShape =  !changeShape;
  }
  
  void radioVal(float a){
   radio =  a;
  }
  
}

