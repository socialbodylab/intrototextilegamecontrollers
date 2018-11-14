/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Analog sensor example
 * Works with AnalogReadSerial example in Arduino
 * Based on based on this Lab on the ITP Physical Computing site: 
 * https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 
 * Social Body Lab, 2018 Oct.
 **************************************************************************/
//Processing file

import processing.serial.*;
Serial myPort;    
int value;
PImage img1; 
PImage img2;

// change this to the threshold for your sensor
int threshold = 850;

void setup()
{
  size(900, 900);
  background(225);
  stroke(160);
  fill(255, 255, 255);

  // prints numbered list of all serial ports
  printArray(Serial.list());
  
  // change the number in the [] to the number for your serial port
  String portName = Serial.list()[6];
  
  myPort = new Serial(this, portName, 9600);
  img1 = loadImage("on.png");
  img2 = loadImage("off.png");
}

void draw() {
  rect(0, 0, 900, 900);

  if (value >= threshold) {
    image(img2, 0, 0);
  } else {
    image(img1, 0, 0);
  }
}

void serialEvent(Serial port) {

  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');

  if (myString != null) {

    //trim it
    myString = trim(myString);

    // convert it to a number:
    value = int(myString);

    println(value);
  }
}
