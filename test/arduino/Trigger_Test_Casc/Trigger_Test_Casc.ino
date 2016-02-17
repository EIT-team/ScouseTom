/*
Code which pulses all the trigger channels on and off in sequence to check the actichamp trigger codes
*/

#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

int del = 100 * 1000; // time to delay between high and low in microseconds

int gap = 500 * 1000; // gap between pulses


void setup() {

	// setup PC connection
	Serial.begin(115200);
	Serial.println("ScouseTom Trigger Check: All IND pins should go high and low every 100ms");

	init_pins_ind();



}
 
void loop() {
 

	digitalWriteDirect(IND_SWITCH, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_STIM, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_START, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_STOP, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_FREQ, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_EX_1, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_EX_2, HIGH);
	delayMicroseconds(gap);
	digitalWriteDirect(IND_EX_3, HIGH);
	delayMicroseconds(gap);
	ind_low();
	delayMicroseconds(gap);
	delayMicroseconds(gap);
	delayMicroseconds(gap);


}


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


