/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Digital switch example
 * Based on based on this Lab on the ITP Physical Computing site: 
 * https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 * Social Body Lab, 2018 Oct.
**************************************************************************/

int sensor1val;
int sensor2val;
int sensor3val;

void setup() {
  //start serial connection
  Serial.begin(9600);
}

void loop() {
  // read the sensor value
  sensor1val = analogRead(0);
  // print out the sensor value
  Serial.print(sensor1val);
  // print a comma to separate the values
  Serial.print(",");

  // read the sensor value
  sensor2val = analogRead(1);
  // print out the sensor value
  Serial.print(sensor2val);
  // print a comma to separate the values
  Serial.print(",");

  // read the sensor value
  sensor3val = analogRead(2);
  // print out the sensor value and add a line break
  Serial.println(sensor3val);

  delay(1); // the delay is necessary for the serial communication


}
