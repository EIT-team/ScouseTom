/*
Code which pulses all the trigger channels on and off in sequence to check the actichamp trigger codes
*/

#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB
#include "Pins.h" // constants used in indicator pins and reseting ALL pins to defaults etc.
int del = 100 * 1000; // time to delay between high and low in microseconds

int gap = 500 * 1000; // gap between pulses


/*############ Indicator Pin things - consts in Pins.h and PCBPins.h ############*/

int pulses[NumInd] = { 0 }; //pulses left to do on the indicator channels
int indpinstate[NumInd] = { 0 }; //current state of the indicator pins
int iInd = 0; // counter for for loop in ind pins ISR (save defining all the time)
int IndinterruptCtr[NumInd] = { 0 }; // iterations of the interrupt routine for each pin channel

int pulsesleft = 0; // number of pulses left to do - used in indpins_check
int pulseleftptr = 0; // pointer for for loop in indpins_check, defined here for speed
int indpulseson = 0; // are pulses active? this flag is used to prevent checking pulses left when we know there are none

int iTrigChk = 0; //iteration of indicator pin check loop




void setup() {

	// setup PC connection
	Serial.begin(115200);
	Serial.println("ScouseTom Trigger ID Check: Channel ID codes run a single time");

	init_pins();
	indpins_init();
	reset_ind();

	/*########################################################
	SETUP TIMERS FOR STIMULATOR TRIGGER AND FOR INDICATOR PINS
	##########################################################*/

	//number comes from here https://github.com/ivanseidel/DueTimer/blob/master/TimerCounter.md
	//set timer interupts - this might possible conflict with servo library as I didnt check.....
	pmc_set_writeprotect(false);		 // disable write protection for pmc registers

	pmc_enable_periph_clk(ID_TC8); // enable TC8 or instance T8 on timer TC2 channel 2 - this is the timer for indicator pins

	// set up timers and interupts - set channel on timers, set to "wave mode" meaning an output rather than "capture" to read ticks
	TC_Configure(TC2, 2, TC_CMR_WAVE | TC_CMR_WAVSEL_UP_RC | TC_CMR_TCCLKS_TIMER_CLOCK2); // use TC2 channel 2 in "count up mode" using MCLK /8 clock1 to give 10.5MHz

	TC_SetRC(TC2, 2, 105); // count 105 ticks on the 10.5MHz clock before calling the overflow routine - this gives an interupt every 10 uS

	//enable timer interupts on timer setup for indicators
	TC2->TC_CHANNEL[2].TC_IER = TC_IER_CPCS;   // IER = interrupt enable register
	TC2->TC_CHANNEL[2].TC_IDR = ~TC_IER_CPCS;  // IDR = interrupt disable register

	//Enable the interrupt in the nested vector interrupt controller

	// TC8_IRQn where 8 is the timer number * timer channels (3) + the channel number (=(2*3)+2) for timer2 channel2
	NVIC_EnableIRQ(TC8_IRQn);

	/*#######################################################
	Finished with timer stuff
	#########################################################*/

	delay(100);

	indChnIdent();



}
 
void loop() {
 
	indpins_check(); // get rid of ind pins


}


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
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
				digitalWriteDirect(IND_EX_3, 0);
			}
			else if (indpinstate[iInd] && (IndinterruptCtr[iInd] > indpulsewidth)) //set pin low if greater than pulse wifth
			{
				digitalWriteDirect(indpins[iInd], 0);
				indpinstate[iInd] = 0;
				digitalWriteDirect(IND_EX_3,1);
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