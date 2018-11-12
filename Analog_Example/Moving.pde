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
int value1;
int[]serialInArray = new int [2];
int serialCount=0;
boolean firstContact = false;

int x = 0;
int y = 0;
PImage img1;
PImage img2;

void setup()
{
size(900, 900);
stroke(160);
fill(255,255,255);
String portName = Serial.list()[1]; 
myPort = new Serial(this, portName, 9600);
img1 = loadImage("1.png");
img2 = loadImage("cl.png");
}

void draw(){
background(img2);
image(img1, x+378, y+378, 126,95);
  
if ((value1 <= 230) && (value1 >= 195)){
y += 1;
}

else if ((value1 <= 250) && (value1 >= 231)){
y -= 1;
}

else{
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
value1 = serialInArray[0];
port.write('A');
serialCount = 0;
println();
}}}
