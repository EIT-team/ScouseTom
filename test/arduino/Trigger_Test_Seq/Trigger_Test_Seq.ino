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
 
	ind_pulse(del, gap, IND_SWITCH);
	ind_pulse(del, gap, IND_STIM);
	ind_pulse(del, gap, IND_START);
	ind_pulse(del, gap, IND_STOP);
	ind_pulse(del, gap, IND_FREQ);
	ind_pulse(del, gap, IND_EX_1);
	ind_pulse(del, gap, IND_EX_2);
	ind_pulse(del, gap, IND_EX_3);
  ind_pulse(del, gap, BONUS_1);
  ind_pulse(del, gap, BONUS_2);
  ind_pulse(del, gap, BONUS_3);
  ind_pulse(del, gap, BONUS_4);
	ind_low();


}


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


