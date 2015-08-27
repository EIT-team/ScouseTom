/*
Code to check turning on PWR to stim is working OK

Turns on switch pwr, then stim pwr


*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

#include <Wire.h>
int del = 1000 * 1000; // time to delay between high and low

void setup() {
  // put your setup code here, to run once:
Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200);
  Serial.println("Hello! Testing ScouseTom PWR now");
 DigipotSetR(50);
  //power pins
  pinMode(PWR_STIM, OUTPUT);
  pinMode(PWR_SWITCH, OUTPUT);

  digitalWriteDirect(PWR_STIM, LOW);
  digitalWriteDirect(PWR_SWITCH, LOW);
  
  DigipotSetR(50);

}

void loop() {
  // put your main code here, to run repeatedly:

  digitalWriteDirect(PWR_STIM, LOW);
  digitalWriteDirect(PWR_SWITCH, LOW);
	delayMicroseconds(del);
  digitalWriteDirect(PWR_STIM, HIGH);
  digitalWriteDirect(PWR_SWITCH, HIGH);
	delayMicroseconds(del);


}

/**
* Sets wiper on digipot
*/
void DigipotSetR(int val)
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

