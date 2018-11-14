/**************************************************************************
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

void setup()
{
  size(900, 900);
  background(225);
  stroke(160);
  fill(255, 255, 255);

  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
  img1 = loadImage("on.png");
  img2 = loadImage("off.png");
}

void draw() {
  rect(0, 0, 900, 900);

  if (value >= 900) {
    image(img2, 0, 0);
  } else {
    image(img1, 0, 0);
  }
}

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    // println(myString);
    myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    // add a linefeed at the end:
    println();
    value = sensors[0];  
  }
}
