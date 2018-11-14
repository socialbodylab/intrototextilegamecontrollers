/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
* Analog sensor example
 * Works with AnalogReadSerial example in Arduino
 * Based on based on this Lab on the ITP Physical Computing site: 
 * https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
**************************************************************************/
//Processing file

import processing.serial.*;
Serial myPort;    
int value;
int x = 0;
int y = 0;
PImage img1;
PImage img2;
// change this to the threshold for your sensor
int threshold1 = 980;
int threshold2 = 960;

int threshold3 = 950;
int threshold4 = 930;
void setup()
{
  size(900, 900);
  stroke(160);
  fill(255,255,255);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
  img1 = loadImage("cloud.png");
  img2 = loadImage("sky.png");
}

void draw(){
background(img2);
image(img1, x+378, y+378, 126,95);
  
if ((value <= threshold1) && (value >= threshold2)){
y += 1;
}

else if ((value <= threshold3) && (value >= threshold4)){
y -= 1;
}

else{

}}
    
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
