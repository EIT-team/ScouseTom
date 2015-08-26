/*
Stuff for initilalising pins and indicator pins*/



#include "Pins.h"

int pulses[NumInd] = { 0 }; //pulses left to do on the indicator channels
int indpinstate[NumInd] = { 0 }; //current state of the indicator pins
int iInd = 0; // counter for for loop in ind pins ISR (save defining all the time)
int IndinterruptCtr[NumInd] = { 0 }; // iterations of the interrupt routine for each pin channel

int pulsesleft = 0; // number of pulses left to do - used in indpins_check
int pulseleftptr = 0; // pointer for for loop in indpins_check, defined here for speed
int indpulseson = 0; // are pulses active? this flag is used to prevent checking pulses left when we know there are none



void init_pins()
{
	//Set all pins as outputs and set initial values

	// pins for switching
	pinMode(DINp, OUTPUT);
	pinMode(DINn, OUTPUT);
	pinMode(SCLK, OUTPUT);
	pinMode(SYNC, OUTPUT);
	pinMode(RESET, OUTPUT);

	//pins for indicator channels
	pinMode(IND_SWITCH, OUTPUT);
	pinMode(IND_STIM, OUTPUT);
	pinMode(IND_FREQ, OUTPUT);
	pinMode(IND_START, OUTPUT);
	pinMode(IND_STOP, OUTPUT);

	pinMode(IND_EX_1, OUTPUT);
	pinMode(IND_EX_2, OUTPUT);
	pinMode(IND_EX_3, OUTPUT);




	//interupt channels
	pinMode(INTR_PMARK, INPUT);

	//power pins
	pinMode(PWR_STIM, OUTPUT);
	pinMode(PWR_SWITCH, OUTPUT);


	//pinMode(LED, OUTPUT);
	//pinMode(fakepmarkpin, OUTPUT);

	//set default values on every pin

}

void reset_pins()
{
	//set all pins to default value - this is called by init but also when stopping injection

	digitalWriteDirect(DINp, LOW);
	digitalWriteDirect(DINn, LOW);
	digitalWriteDirect(SCLK, LOW);
	digitalWriteDirect(SYNC, LOW);
	digitalWriteDirect(RESET, LOW);


}

void reset_ind()
{
	//reset all indicator pins 
	digitalWriteDirect(IND_SWITCH, LOW);
	digitalWriteDirect(IND_STIM, LOW);
	digitalWriteDirect(IND_FREQ, LOW);
	digitalWriteDirect(IND_START, LOW);
	digitalWriteDirect(IND_STOP, LOW);

	//digitalWriteDirect(LED, LOW);
	//digitalWrite(fakepmarkpin, LOW);
}



void reset_pins_pwr()
{
	//reset all power pins
	digitalWrite(PWR_STIM, LOW);
	digitalWrite(PWR_SWITCH, LOW);
}


void indpins_check() //this checks if there are any pulses left on any of the indicator pins - if not then turn off timer 
{
	if (indpulseson) //if the pulses are apparently on (this is a bit uncessary but used to make this run faster)
	{

		pulsesleft = 0;
		for (pulseleftptr = 0; pulseleftptr < NumInd; pulseleftptr++) // cycle through the pulses left array
		{
			if (pulses[pulseleftptr] > pulsesleft)
			{
				pulsesleft = pulses[pulseleftptr];
			}
		}


		if (pulsesleft == 0) //if none left then turn off the ind timer and set flag low 
		{
			TC_Stop(TC2, 2);
			indpulseson = 0;
			//	Serial.println("stopped ind tc");
		}
	}

}

void indpins_pulse(int StartChn, int StopChn, int SwitchChn, int FreqChn) // this adds pulses to the buffer on each indicator channel 
{
	indpulseson = 1; // set pins on flag

	//add new pulses to array
	pulses[0] += StartChn;
	pulses[1] += StopChn;
	pulses[2] += SwitchChn;
	pulses[3] += FreqChn;
	//	Serial.println("pulsin");
	//start ind pulse timer
	TC_Start(TC2, 2);
}

void indpins_init() //initialise the indicator pins
{
	//reset all variables for indicator pins - this is me being overcautious, these should all be set ok 
	TC_Stop(TC2, 2); // stop ind ISR, just in case

	for (int i = 0; i < NumInd; i++)
	{
		pulses[i] = 0;
		indpinstate[i] = 0;
		IndinterruptCtr[i] = 0;
	}

	iInd = 0; // counter for for loop in ind pins ISR (save defining all the time)
	pulsesleft = 0;
	pulseleftptr = 0;
	indpulseson = 0;
}

void indChnIdent() //pulses to send at start of injections to indicate which indicator pins are which
{
	
	//pulses indicator pins
	indpins_pulse(3, 5, 4, 6); //number of pulses is a bit odd as 4 was used previously on switch chn, so dont want kirill to shout at me for making him change one line of code
	
	int del = 430;
	//pulses stimuator pin - harcoded at the moment
	digitalWriteDirect(IND_STIM, HIGH);
	delayMicroseconds(del);
	digitalWriteDirect(IND_STIM, LOW);
	delayMicroseconds(del);
	digitalWriteDirect(IND_STIM, HIGH);
	delayMicroseconds(del);
	digitalWriteDirect(IND_STIM, LOW);
	//delayMicroseconds(500);


}

void TC8_Handler() // this is the ISR for the indicator pins - cycles through all of the pins if they should change their state - this runs every 10uS
{
	// We need to get the status to clear it and allow the interrupt to fire again
	TC_GetStatus(TC2, 2); //here TC2,2 means TIMER 2 channel 2

	for (iInd = 0; iInd < NumInd; iInd++) // cycle through the indicator pins
	{
		if (pulses[iInd] > 0) //if we have some pulses left to do
		{
			if (!indpinstate[iInd] && (IndinterruptCtr[iInd] < indpulsewidth)) // set pin high if less than pulse width
			{
				digitalWriteDirect(indpins[iInd], 1);
				indpinstate[iInd] = 1;
			}
			else if (indpinstate[iInd] && (IndinterruptCtr[iInd] > indpulsewidth)) //set pin low if greater than pulse wifth
			{
				digitalWriteDirect(indpins[iInd], 0);
				indpinstate[iInd] = 0;
			}
			IndinterruptCtr[iInd]++; //increment tick counter
			if (IndinterruptCtr[iInd] == indpulsewidthtotal) // if total pulse length (HIGH and LOW) happened then decrement pulses left
			{
				pulses[iInd]--;
				IndinterruptCtr[iInd] = 0;
			}

		}
	}
}