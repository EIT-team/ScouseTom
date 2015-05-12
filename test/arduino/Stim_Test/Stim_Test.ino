/*
Code to check stim - triangle wave out on "STIM OUT" Pin


*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

#include <Wire.h>
int del_short = 20; // time to delay between digipot settings
int del_long = 1000*1000; // time to delay between waves
int MinVal=210;
int MaxVal=255;

void setup() {
  // put your setup code here, to run once:
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200);
  Serial.println("Hello! Testing ScouseTom STIM now");
  DigipotSetR(MaxVal);
  //power pins
  pinMode(PWR_STIM, OUTPUT);
  pinMode(IND_STIM,OUTPUT);
  digitalWriteDirect(PWR_STIM, LOW);
  digitalWriteDirect(IND_STIM, LOW);
  DigipotSetR(MaxVal);
    Serial.println("You should see a triangle wave on the stim out pin...");
      digitalWriteDirect(PWR_STIM, HIGH);
  digitalWriteDirect(IND_STIM, HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:
  

  
  
  for (int iPot = MinVal; iPot <= MaxVal; iPot++)
		{
			
			DigipotSetR(iPot); // set potentiometer
			delayMicroseconds(del_short);
		}

  for (int iPot = MaxVal; iPot >= MinVal; iPot--)
		{
			
			DigipotSetR(iPot); // set potentiometer
			delayMicroseconds(del_short);
		}
  

}

void DigipotSetR(int val)// sets wiper on digipot
{
  Wire.beginTransmission(44); // transmit to device #44 (0x2c)
  // device address is specified in datasheet
  Wire.write(byte(0x00));            // sends instruction byte
  Wire.write(val);             // sends potentiometer value byte
  Wire.endTransmission();     // stop transmitting
}





//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}

