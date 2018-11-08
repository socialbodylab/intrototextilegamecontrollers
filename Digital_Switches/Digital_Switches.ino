/**************************************************************************
 * Textile Game Controller workshop 
 * Working with Arduino Micro board and conductive materials
 * Digital switch example
 * This can control an exsisting game called Everything avaliable on Steam
 * It has controls for the camera's movement (Arrow Keys) and rolling function (W) in the game
 * Arduino Example code:
 * https://www.arduino.cc/reference/en/language/functions/usb/keyboard/keyboardwrite/
 * https://www.arduino.cc/en/Reference/KeyboardModifiers
 * Keyboard Ascii References:
 * http://www.asciitable.com/
 * Social Body Lab, 2018 Oct.
**************************************************************************/
#include <Keyboard.h>
/*******Change the control to any key you want *******/
int UpPin = 9; // Set Pin 9 on Arduino to Up key
int DownPin = 8; // Set Pin 8 on Arduino to Down key
int LeftPin = 7; // Set Pin 7 on Arduino to Left key
int RightPin = 6; // Set Pin 6 on Arduino to Right key
int SpacePin = 5; // Set Pin 5 on Arduino to Space Key (In this game, it's W on keyboard)

void setup()
{
  pinMode(UpPin, INPUT);  // Set each button/key as an input
  pinMode(DownPin, INPUT);  
  pinMode(LeftPin, INPUT);  
  pinMode(RightPin, INPUT);  
  pinMode(SpacePin, INPUT_PULLUP);  
  Keyboard.begin(); 
  digitalWrite(UpPin, HIGH);  // Pull the button/key high
  digitalWrite(DownPin, HIGH);
  digitalWrite(LeftPin, HIGH);
  digitalWrite(RightPin, HIGH);
}

void loop()
{
 if (digitalRead(SpacePin) == LOW) {
  Keyboard.press(87); // Hold Space key to make the game character roll/move, it's necessary in this game to hold the key 
  delay(100); // delay 
  }
  if (digitalRead(UpPin) == 0)  // if the button goes low
  {
    Keyboard.write(218);  // Up arrow key
    Keyboard.release(87); // Release the space key
    delay(500);  // delay   
  }
  if (digitalRead(DownPin) == 0)  
  {
    Keyboard.write(217);  //Down arrow key
    Keyboard.release(87); // Release the space key
    delay(500);     
  }
  if (digitalRead(LeftPin) == 0)  
  {
    Keyboard.write(216);  //Left arrow key
    Keyboard.release(87); // Release the space key
    delay(500);  
  }
  if (digitalRead(RightPin) == 0)  
  {
    Keyboard.write(215);  //Right arrow key
    Keyboard.release(87); // Release the space key
    delay(500);  
  }
  else
  {
    Keyboard.release(87); // Release the space key if no actions
  }
}

