/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Analog switch example
 * Based on based on this Lab on the ITP Physical Computing site: 
 * https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 * Social Body Lab, 2018 Oct.
**************************************************************************/
//Processing file

import processing.serial.*;
Serial myPort;    
int sensor1;
int sensor2;
int sensor3;
float mappedSensor1;
float mappedSensor2;
float mappedSensor3;
//int value;

// change this to the threshold for your sensor
int threshold = 850;

void setup()
{
size(600, 600);
background(225);
stroke(160);
fill(50);

  // List all the available serial ports in the console
  printArray(Serial.list());

  // Change the 0 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[7];
  myPort = new Serial(this, portName, 9600);
   // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
}

void draw(){
  rect(0,0,600,600);
  
  if (sensor1 > threshold ) {
    fill(57, 255, 20);
  } else {
    fill(253, 78, 179);
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
    sensor1 = sensors[0];  
    sensor2 = sensors[1]; 
    sensor3 = sensors[2];
    mappedSensor1 = map(sensor1, 0, 1023, height, 0);
    mappedSensor2 = map(sensor1, 0, 1023, height, 0);
    mappedSensor3 = map(sensor1, 0, 1023, height, 0);
  }
}