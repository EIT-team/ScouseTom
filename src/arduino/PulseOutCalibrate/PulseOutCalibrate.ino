/*

Calibrates the output of the stimulation circuit for digipot settings

as wiper is is "rheostat" mode - Wiper connected to ground and Pos A to load - the resistance is minimal at position 256 and maximal at 0

corresponding Labview VI is called Stim_cal

Stim Pin is connected to PFI0 on USB DAQ  as trigger for analogue record
AISN is connected to 5V on arduino to allow for wider range of voltages to be recorded
AI0 and AI1 are RSEN mode (relative to AISN) 
AI0 connected to Stimulator Output from the MosFET which is sent to stimulator
AI1 connected to Vstim ref - the voltage output from the lm317
AI2 connected to the 5V pin used for AISN for subsequent recalculation

Arudino sends pot setting over serial before doing one pulse, the labview VI reads the incoming serial and then runs the tigger activated analog read
The labview VI is slow as it is inefficiently coded, thus the long delays between sending serial command and setting pulse high. 

Pulses are output for each setting ebtween minval and max val, repeated reps number of times

Serial output -1 when finished, which should stop the VI running too 


*/

#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

#include <Wire.h>

int currentval = 0;

int hightime = 220; // time of pulse high - 200 ms sampled in LV - a bit higher to ensure only HIGH value recorded
int lowtime = 100; // time pulse low 
int pulsedelay = 500;// delay between each setting of the digipot
int serialdelay = 500; // delay between sending potentiometer value and setting pin high - this is to give time for labview to get its shit together. VI is inefficient as cant do proper retriggering


int MinVal = 210; //minimum pot value
int MaxVal = 250; //maximum pot value (must be below 256)

int reps = 10;


void setup()
{
	Wire.begin(); // join i2c bus (address optional for master)
	Serial.begin(115200);
	//Serial.println("hey there!");

	pinMode(PWR_STIM, OUTPUT);
	digitalWrite(PWR_STIM, HIGH);    // turn the LED off by making the voltage LOW


	pinMode(IND_STIM, OUTPUT);
	digitalWrite(IND_STIM, LOW);    // turn the LED off by making the voltage LOW

	// wait for PC to be ready 
	establishContact();


	for (int iRep = 0; iRep < reps; iRep++)
	{


		// cycle through all values of resisitance
		for (int iPot = MinVal; iPot <= MaxVal; iPot++)
		{
			Serial.println(iPot);
			DigipotSetR(iPot); // set potentiometer
			delay(serialdelay);
			pulsestim(1); // pulse pin
			delay(pulsedelay); // wait a bit 
		}
	}


	digitalWrite(IND_STIM, LOW);
	DigipotSetR(MinVal); // reset as I think 256 causes some weirdness
	Serial.println("-1");
	digitalWrite(IND_STIM, LOW);


}


void loop()
{




}



/**
* sets wiper on digipot
*/
void DigipotSetR(int val)
{
	Wire.beginTransmission(44); // transmit to device #44 (0x2c)
	// device address is specified in datasheet
	Wire.write(byte(0x00));            // sends instruction byte
	Wire.write(val);             // sends potentiometer value byte
	Wire.endTransmission();     // stop transmitting
}

void pulsestim(int rep)
{
	//just sets pin high and low in badly coded fashion


	for (int i = 0; i < rep; i++)
	{
		digitalWrite(IND_STIM, HIGH);   // turn the LED on (HIGH is the voltage level)
		delay(hightime);              // wait for a second
		digitalWrite(IND_STIM, LOW);    // turn the LED off by making the voltage LOW
		delay(lowtime);              // wait for a second

	}


}



void establishContact() {
	//

	while (Serial.available() <= 0) {
		Serial.print('A');   // send a capital A
		delay(300);
	}
	char inb = Serial.read();
}
