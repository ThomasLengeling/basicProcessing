import java.awt.Frame;
import javax.swing.JFrame;
import controlP5.*;
import promidi.*;

float   alphaVal;
float   bkgColor;
boolean changeShape;
float   radio = 50;

PFrame controlWindowFrame;

float noiseValue = 0.3;
float incRadio;

void setup() {
  size(600, 600, P2D);
  //size(displayWidth, displayHeight, P2D);

  frame.setLocation(0, 0);


  smooth();
  background(0);

  controlWindowFrame = new PFrame();

  setupMidi();
  incRadio = radio;
}



void draw() {
  noStroke();
  rectMode(CORNER);
  fill(bkgColor, alphaVal);
  rect(0, 0, width, height);

  noFill();
  strokeWeight(20);
  stroke(0, 250, 200);


  if (changeShape) {
    ellipseMode(RADIUS);
    ellipse(width/2, height/2, incRadio, incRadio);
  }
  else {
    rectMode(CENTER);
    rect(width/2, height/2, incRadio, incRadio);
  }
  
  incRadio = noise(noiseValue)*radio;
  noiseValue += 0.028;
}

void keyPressed() {
  if ( key == 'a')
    frame.setLocation(100, 0);
}

