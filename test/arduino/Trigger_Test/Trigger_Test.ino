/*
Code which pulses all the trigger channels on and off to check if everything is OK


*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

int del = 100 * 1000; // time to delay between hgih and low


void setup() {

	// setup PC connection
	Serial.begin(115200);
	Serial.println("ScouseTom Trigger Check: All IND pins should go high and low every 100ms");

	init_pins_ind();



}
 
void loop() {
  // put your main code here, to run repeatedly:

	ind_low();
	delayMicroseconds(del);
	ind_high();
	delayMicroseconds(del);


}


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


