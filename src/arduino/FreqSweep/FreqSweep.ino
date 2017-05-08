/*
Frequency Sweep at fixed current, with triggers on channels.
Use this to obtain frequency responses of EEG system/electrodes etc.
*/


//#####################################


/* USER CHANGES THESE VALUES!!!!*/

long Amplitude = 100; // amplitude in uA to inject
const int NumFreq = 20; // number of frequencies to check
int Freq[NumFreq] = { 500  ,1000  ,1500  ,2000  ,2500  ,3000  ,3500  ,4000  ,4500  ,5000  ,5500  ,6000  ,6500  ,7000  ,7500  ,8000  ,8500  ,9000  ,9500,  10000 };

int Injection_pair[2] = { 2,4 }; // which electrodes the current is injected between

int InjectionTime = 5000; // injection time in ms

// Libraries to include

#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB
#include "Switches.h" // Constants for switching channels
#include "CS_comm.h" // Constants used in serial communication with Current Source
#include "Pins.h" // constants used in indicator pins and reseting ALL pins to defaults etc.
#include "Errors.h" // error codes and warning messages
#include "System_Control.h" //control constants - idle time definition etc.
#include "Messages.h"

/*############ CS Communications stuff - consts in CS_Comm.h ############*/

char CS_inputBuffer[CS_buffSize]; //char buffer to store output from current source
int CS_inputFinished = 0; //flag for complete response from current source
int LongDispWind = 0; // flag for if we have more than 3 digit length of repeats/freqs/prt so that we use the shorter text on the bottom window
char CS_outputBuffer[50]; // char array buffer for output strings to CS
int CS_commgoodness = 1; // flag for current communication goodness

/*############ PC Communications stuff - consts in PC_Comm.h ############*/

char PC_outputBuffer[50]; // char array buffer for output strings to PC
int PC_commgoodness = 1;
int PC_inputgoodness = 0;

/*############ Injection Stuff  - consts in Injection.h ############*/

int Switch_goodness = 0; //flag for whether switches are behaving themselves

/*########### System Control stuff - consts in System_Control.h ############*/

int SingleFreqMode = 0; // flag for single frequency mode
int StimMode = 0; // flag for Stimulation mode - only stimulation stuff if needed
int state = 0; // what the system should be doing each iteration

long lastidle = 0; // timing for idle mode - if been idle for a few seconds then change display (maybe send heartbeat message to pc)
int checkidle = 1; //should we check idle?

int FirstInj = 0; // flag for doing the first injection - so we dont wait to switch at start
int SwitchesProgrammed = 0; // flag for whether the switches are programmed or not
int Switchflag = 0; // do we need to switch?
int Stimflag = 0; // should we stimulate?

long lastInjSwitch = 0; //time when channels were switched - SingleFreqMode
long lastFreqSwitch = 0; //time when Freq was last changed - MultipleFreqMode
long lastStimTrigger = 0; //time when stimulation trigger was last activated
long currentMicros = 0; // current time in micros

int iFreq = 0; //current frequency
int iPrt = 0; //current protocol line
int iRep = 0; //current protocol repetition
int iStim = 0; // current stimulation number

/*ALL DEFINITIONS DONE FINIALLY!*/

void setup() {
	// setup PC connection
	//Serial.begin(115200); //THIS IS FOR DEBUGGING ONLY

	init_pins(); // make sure switches are closed asap and set all low
	reset_pins();
	reset_pins_pwr();
	reset_ind();
	SwitchesPwrOn();

	// setup CS connection
	Serial1.begin(57600); // 57600 fastest baud that worked with AD chip - sparkfun connector may allow 115200 which would be nice
	CS_commgoodness = CS_init(); // make sure CS is off asap

	// setup PC connection
	Serial.begin(115200);

	Serial.println("hello there");

	CS_commgoodness = CS_init();

	//Serial.print("init done");

	if (CS_commgoodness)
	{
		Serial.print("CS CONNECTED OK"); // everything is totally fine!
	}

	else
	{
		Serial.print("CS COMMM BAD!");
	}


	CS_Disp("FREQ SWEEP");
	CS_Disp_Wind2("Checking Things");


}

void loop() {

	//int statein = state;
	char c = '#'; //placeholder value 

	//read serial byte if one is available
	if (Serial.available() > 0)
	{

		c = Serial.read();
		Serial.println("Starting Sweep");
		FreqSweep();
	}

}


void FreqSweep()
{

	CS_Disp("FREQ SWEEP");
	CS_Disp_Wind2("Lets do this");


	Serial.println("Programming Switches");
	programswitches(Injection_pair[0], Injection_pair[1], TotalPins);

	digitalWriteDirect(SYNC, HIGH);

	Serial.println("Sending defaults to current source");
	CS_AutoRangeOn(); //set ranging to normal
	CS_commgoodness = CS_sendsettings_check(Amplitude, Freq[0]); // send settings to current source

	Serial.println("Starting Current Source");
	CS_start();

	digitalWrite(IND_SWITCH, 0);
	for (int iFreq = 0; iFreq < NumFreq; iFreq++)
	{
		Serial.print("Sending Settings ");
		Serial.print(iFreq);
		Serial.print(" freq :");
		Serial.println(Freq[iFreq]);

		CS_commgoodness = CS_sendsettings_check(Amplitude, Freq[iFreq]); // send settings to current source
		CS_Disp("FREQ SWEEP HAPPENING");
		CS_Disp_Wind2("Woo!");

		sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"%dHz Freq %d of %d\"", Freq[iFreq], iFreq+1, NumFreq); //make string to send to CS
		Serial1.println(CS_outputBuffer); // send to CS

		digitalWrite(IND_SWITCH,1);
   delay(1);
		digitalWrite(IND_SWITCH, 0);

		delay(InjectionTime);

		digitalWrite(IND_SWITCH, 1);
    delay(1);
		digitalWrite(IND_SWITCH, 0);

	}

	CS_stop();
	//remove anything left from the current source buffer - we dont care about it anymore!
	CS_serialFlush();

	CS_Disp("FREQ SWEEP DONE");
	CS_Disp_Wind2("Hooray!");

	Serial.println("All done!");

}



//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}




