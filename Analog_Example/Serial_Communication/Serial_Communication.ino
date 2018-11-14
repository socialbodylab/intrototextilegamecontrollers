/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Digital switch example
 * Arduino Example code:
 * https://www.arduino.cc/en/Tutorial/SerialCallResponse
 * Social Body Lab, 2018 Oct.
**************************************************************************/

char val;
int felt = 0;
int value = 0;
int inByte = 0;

void setup() {
Serial.begin(9600);
establishContact();
}

void loop() {
if(Serial.available()>0);{
inByte=Serial.read();

value= analogRead (felt);
value = value/4;
delay(10);
}
Serial.write(value);
}

void establishContact(){
while(Serial.available()<=0){
Serial.print('A');
delay(300);
}}
