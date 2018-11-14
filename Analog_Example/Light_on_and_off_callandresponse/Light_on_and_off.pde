/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Analog switch example
 * Arduino Example code:
 * https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
 * Social Body Lab, 2018 Oct.
**************************************************************************/
//Processing file

import processing.serial.*;
Serial myPort;    
int value;
int[]serialInArray = new int [1];
int serialCount=0;
boolean firstContact = false;
PImage img1; 
PImage img2;

void setup()
{
  size(900, 900);
  background(225);
  stroke(160);
  fill(255,255,255);
  String portName = Serial.list()[1]; 
  myPort = new Serial(this, portName, 9600);
  img1 = loadImage("on.png");
  img2 = loadImage("off.png");

}

void draw(){
  rect(0,0,900,900);
  
if (value >= 200){
 image(img2, 0, 0);
}




else{
 image(img1,0, 0);
}}
    
void serialEvent(Serial port){
     int inByte = port.read();
     if (firstContact == false){
       if(inByte == 'A'){
         port.clear ();
         firstContact = true;
         port.write('A');
       }}
       else{
         serialInArray[serialCount] = inByte;
         print(inByte+ "\t");
         serialCount++;
         delay (8);
         
         if (serialCount==1){
           value = serialInArray[0];
           
           port.write('A');
           serialCount = 0;
           println();
         }}}
