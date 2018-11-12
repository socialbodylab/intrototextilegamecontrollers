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

void setup()
{
size(600, 600);
background(225);
stroke(160);
fill(50);
String portName = Serial.list()[1]; 
myPort = new Serial(this, portName, 9600);
}

void draw(){
  rect(0,0,600,600);
  
if ((value <= 190) && (value >= 170)){
fill(210,255,113);//Green
}

else if ((value <= 211) && (value >= 191)){
fill(255,251,113);//Yellow
}

else if ((value <= 232) && (value >= 212)){
fill(255,208,113);//Orange
}

else if ((value <= 253) && (value >= 233)){
fill(255,125,113);//Red
}

else{
  fill(206,206,206);
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
