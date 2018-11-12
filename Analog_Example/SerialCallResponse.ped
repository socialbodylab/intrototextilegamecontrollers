/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Verifying port number 
 * Processing Example code:
 * https://processing.org/reference/libraries/serial/Serial.html
 * Social Body Lab, 2018 Oct.
**************************************************************************/
//Processing file

import processing.serial.*;

// The serial port:
Serial myPort;       

// List all the available serial ports:
printArray(Serial.list());

// Open the port you are using at the rate you want:
myPort = new Serial(this, Serial.list()[0], 9600);
  
// Send a capital A out the serial port:
myPort.write(65);
