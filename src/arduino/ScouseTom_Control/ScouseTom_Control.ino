/*
Arduino Control Code for breadboard and PCB version - controlled by Matlab code (for now) ScouseTom_Init ScouseTom_Start etc.

Overview of commands is SOMEWHERE


########
23/04/15 - Fixed bug where first switch after turning on power to switches was not working - caused by setting pins too fast after power, fixed by reseting switches after pwr on
- added delay to start time as Current source takes some time to actually turn on

Last Major Update - set stim voltage programmatically, power to stim and switches turned off when not in use, PCB and breadboard pin numbering in separate header files

########
To do:

Set number of cycles to inject rather than time - best done in matlab though will need to get array of injection times too

Check that sources and sinks arent the same for a line in the protocol

Tidy up:
- everything under "do stuff" would be easier if it was replaced with inline functions - that way they could be jumped too in visual studio
- rearrange code into more logical tabs - the multifreq stuff within "CS_comm" for example
Debug mode - use #IF to set verbose debug mode

Pulse trains - so kirill can replicate thomas' experiments on nerve - repeated stim should demonstrate refactory period. Also could be used to replicate BOLD experimental paradigm - with

Lower power consumption - it is possible to set pmc_enable_sleep to save some power, or even put the SAM3X into "backup" mode, awakened by interupt on RX pin, but not sure how
also it is possible to turn off/lower clocks when not in use, and turn off adc's etc. my googling failed me. THis is unlikely to reduce the consumption by much however.
########

Jimmy wrote this so blame him

*/


//#####################################
// Libraries to include

#include <Wire.h> //i2c for digipot

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB
#include "Stim.h" //Constants for stimulator things, with definitions of functions
#include "Switches.h" // Constants for switching channels
#include "CS_comm.h" // Constants used in serial communication with Current Source
#include "PC_comm.h" // Constants used in communicaltion with PC
#include "Pins.h" // constants used in indicator pins and reseting ALL pins to defaults etc.
#include "Errors.h" // error codes and warning messages
#include "Messages.h" // OK messages and other misc. things
#include "System_Control.h" //control constants - idle time definition etc.
#include "Injection.h" // injection defaults - max number of protocol lines etc.

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

int Injection[maxInjections][2] = { 0 }; //number of injections in protocol - max 200 to avoid dynamic memory allocation
int NumInj = 0; //number of injection pairs in protocol - set from PC comm
int NumFreq = 0; // number of frequencies (and corresponding amplitudes) to use - set from PC comm
int NumElec = 0; // number of electrodes used - this is used in contact check at the moment, but likely used for dual systems too
int NumRep = 0; // number of time whole protocol is repeated - total recording time is MeasTime*NumFreq*NumRep

long  Amp[maxFreqs] = { 0 }; //amplitude in uA - container for max 20
long  Freq[maxFreqs] = { 0 }; //freq in Hz - contaier for max 20 set in
long MeasTime[maxFreqs] = { 0 }; //injection time in microseconds - set by user (USER SELECTS MILLISECONDS BUT SCALED IN MICROSECONDS AS DUE IS FASTER)

int FreqOrder[maxFreqs] = { 0 }; // order of the frequencies - initilised
long curFreq = 0; // index of frequency vector current being injected

long StartElapsed_CS = 0;// time since CS_Start was called
long StartTime_CS = 0; //time when CS_Start() was called

int iContact = 0; // counter for contact check loop
int ContactEndofSeq = 0; // flag for whether contact check is finished
long ContactTime = 0; // contact impedance measurement time in us

long BadElecs[maxBadElecs] = { 0 }; // bad electrodes
int NumBadElec = 0; // number of bad electrodes 


/*############ Indicator Pin things - consts in Pins.h and PCBPins.h ############*/

int pulses[NumInd] = { 0 }; //pulses left to do on the indicator channels
int indpinstate[NumInd] = { 0 }; //current state of the indicator pins
int iInd = 0; // counter for for loop in ind pins ISR (save defining all the time)
int IndinterruptCtr[NumInd] = { 0 }; // iterations of the interrupt routine for each pin channel

int pulsesleft = 0; // number of pulses left to do - used in indpins_check
int pulseleftptr = 0; // pointer for for loop in indpins_check, defined here for speed
int indpulseson = 0; // are pulses active? this flag is used to prevent checking pulses left when we know there are none

/*############ Stimulation Trigger stuff - consts in Stim.h ############*/

long StimTriggerTime = 0; //time between stimulation triggers in microseconds
long StimOffset = 0; // time stimulation occurs after injection pair switch
long StimOffsetCurrent = 0; // offset for current stimulation - this is set to be either StimOffset or 0
long StimPulseWidth = 0; // width of stimulation pulse in microseconds - received from PC
int StimPulseWidthTicks = 0; // width of pulse in 1.5 uS Ticks of TC4 handler

int NumDelay = 0; //the total number of possible delays, as calcluated from the freq and the time gap - set by stim calcdelays
int Stim_delays[360] = { 0 }; //holds all possible delays up to a maximum of 360 - these are the number of ticks to wait before starting trigger
int Stim_phases[360] = { 0 }; // phases each of the delays equate too - cast to int because who cares about .5 of a degree of phase?
int Stim_PhaseOrder[360] = { 0 }; //order of the phase delays - shuffled and sent to PC every time it gets to the end

int d1 = 0; //current delay before stimulation trigger - in ticks of TC4 handler
int d2 = 0;// time to stop stimulation trigger - d1+Stimpulsewidth - in ticks of TC4 handler
int StiminterruptCtr = 0; // counter of the number of ticks of the TC4 handler since pmark pulse
int Stim_pinstate = 0; //current state of the stimulator pin IND_STIM

int Stim_goflag = 0; // flag for setting whether we should be stimulating at the moment - this is needed as I had to start the TC4 handler *before* setting the Stim_ready flag, so a few of the TC4 handler would run before stim should start
int Stim_ready = 0; // are we ready to stimulate again? this is so we ignore phase markers within the stim pulse

int CS_PhaseMarker = 0; // phase in degrees which phase marker occurs on the current source - set so that delay of 0 in stim routine occurs at ~0 phase
int PMARK_TEST_FLAG = 0; // flag used in PMARK check routines - this is set high by ISR_PMARK_TEST if all working ok
int CS_Pmarkgoodness = 0; // flag to confirm Phasemarker has been checked ok

/*########### Stimulation Voltage stuff - consts in Stim.h ############*/

int StimWiperValue = 0; // Wiper position for setting voltage of stimulation - must be 0-256 although usable range is between 215 and 250 with 215 approx 10V and 250 ~3V

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
	Serial.begin(115200);

	init_pins(); // make sure switches are closed asap and set all low
	reset_pins();
	reset_pins_pwr();
	reset_ind();

	/*
	SwitchesPwrOn();

	Serial.println("1on");
	programswitches(4, sinkpin);
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(500);
	Serial.println("1off");
	SwitchesPwrOff();
	delay(500);
	*/

	// setup CS connection
	Serial1.begin(57600); // 57600 fastest baud that worked with AD chip - sparkfun connector may allow 115200 which would be nice
	CS_commgoodness = CS_init(); // make sure CS is off asap


	Wire.begin(); // start I2C
	Stim_SetDigipot(StimOffValue); // set potentiometer to highest resistance to minimise current draw

	randomSeed(analogRead(0)); // seed random number generator assumes A0 is floating!

	//Serial.println("hey there you motherfucker");
	establishContact();

	/*
	SwitchesPwrOn();
	Serial.println("2on");
	programswitches(4, sinkpin);
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(500);
	Serial.println("2off");
	SwitchesPwrOff();
	delay(500);
	*/

	/*########################################################
	SETUP TIMERS FOR STIMULATOR TRIGGER AND FOR INDICATOR PINS
	##########################################################*/

	//number comes from here https://github.com/ivanseidel/DueTimer/blob/master/TimerCounter.md
	//set timer interupts - this might possible conflict with servo library as I didnt check.....
	pmc_set_writeprotect(false);		 // disable write protection for pmc registers
	pmc_enable_periph_clk(ID_TC4);	 // enable peripheral clock TC7 this means isntance T7 on TC2 channel 1  - this is the timer for the stim trigger output
	pmc_enable_periph_clk(ID_TC8); // enable TC8 or instance T8 on timer TC2 channel 2 - this is the timer for indicator pins
	//pmc_enable_periph_clk(ID_TC6); // enable TC6 or instance T6 on timer TC2 channel 0 - this is the timer for the fake pmark

	// set up timers and interupts - set channel on timers, set to "wave mode" meaning an output rather than "capture" to read ticks
	TC_Configure(TC1, 1, TC_CMR_WAVE | TC_CMR_WAVSEL_UP_RC | TC_CMR_TCCLKS_TIMER_CLOCK1); // use TC1 channel 1 in "count up mode" using MCLK /2 clock1 to give 42MHz
	TC_Configure(TC2, 2, TC_CMR_WAVE | TC_CMR_WAVSEL_UP_RC | TC_CMR_TCCLKS_TIMER_CLOCK2); // use TC2 channel 2 in "count up mode" using MCLK /8 clock1 to give 10.5MHz
	//TC_Configure(TC2, 0, TC_CMR_WAVE | TC_CMR_WAVSEL_UP_RC | TC_CMR_TCCLKS_TIMER_CLOCK4); // use TC2 channel 0 in "count up mode" using MCLK /128 clock1 to give 656.25 kHz

	TC_SetRC(TC1, 1, 63); // count 63 ticks on the 42MHz clock before calling the overflow routine - this gives an interupt every 1.5 uS
	TC_SetRC(TC2, 2, 105); // count 105 ticks on the 10.5MHz clock before calling the overflow routine - this gives an interupt every 10 uS
	//TC_SetRC(TC2, 0, 110); // count 110 ticks on the 656.25 kHz clock before calling the overflow routine - this gives an interupt every 167uS (equal to pmark at 6khz - kirills target freq)
	//TC_Start(TC1, 1); //start stim trig timer
	//TC_Start(TC2, 2); //start ind timer
	//TC_Start(TC2, 0); //start pmark fake timer

	// enable timer interrupts on the timer for stim tigger output
	TC1->TC_CHANNEL[1].TC_IER = TC_IER_CPCS;   // IER = interrupt enable register
	TC1->TC_CHANNEL[1].TC_IDR = ~TC_IER_CPCS;  // IDR = interrupt disable register
	//enable timer interupts on timer setup for indicators
	TC2->TC_CHANNEL[2].TC_IER = TC_IER_CPCS;   // IER = interrupt enable register
	TC2->TC_CHANNEL[2].TC_IDR = ~TC_IER_CPCS;  // IDR = interrupt disable register
	//enable timer interupts on timer setup for fake pmark
	//TC2->TC_CHANNEL[0].TC_IER = TC_IER_CPCS;   // IER = interrupt enable register
	//TC2->TC_CHANNEL[0].TC_IDR = ~TC_IER_CPCS;  // IDR = interrupt disable register

	//Enable the interrupt in the nested vector interrupt controller
	// TC4_IRQn where 4 is the timer number * timer channels (3) + the channel number (=(1*3)+1) for timer1 channel1
	NVIC_EnableIRQ(TC4_IRQn);
	// TC8_IRQn where 8 is the timer number * timer channels (3) + the channel number (=(2*3)+2) for timer2 channel2
	NVIC_EnableIRQ(TC8_IRQn);
	// TC6_IRQn where 6 is the timer number * timer channels (3) + the channel number (=(2*3)+0) for timer2 channel0
	//NVIC_EnableIRQ(TC6_IRQn);

	/*#######################################################
	Finished with timer stuff
	#########################################################*/

	//Serial.println("timer set ok");
	//Serial.println("initialising");

	// initialise current source again and check the phase marker connection

	CS_commgoodness = CS_init();

	//Serial.print("init done");



	if (CS_commgoodness)
	{
		// check phase marker if current source connection ok
		CS_Pmarkgoodness = CheckPmark();

		if (CS_Pmarkgoodness)
		{
			Serial.print(CS_commokmsg); // everything is totally fine!
		}
		else
		{
			Serial.print(CS_pmarkerrmsg);
		}
	}

	else
	{
		Serial.print(CS_commerrmsg);
	}


}

void loop() {

	//int statein = state;

	indpins_check(); // get rid of ind pins

	char c = '#'; //placeholder value 

	//read serial byte if one is available
	if (Serial.available() > 0)
	{

		c = Serial.read();
		//Serial.print(c);
	}

	// if byte has been read then get new CMD
	if (c != '#')
	{
		getCMD(c);
	}

	/*
	if (state != statein)
	{
	Serial.print("CMD change: State changed from ");
	Serial.print(statein);
	Serial.print(" to ");
	Serial.println(state);
	}
	*/

	// do stuff based on what the state is
	dostuff();
	/*
	if (state != statein)
	{
	Serial.print("dostuff change: State changed from ");
	Serial.print(statein);
	Serial.print(" to ");
	Serial.println(state);
	}
	*/

}

void dostuff()
{
	switch (state)
	{
	case 0: // this is the do nothing state
	{
		//Serial.println("Chilling");
		//delay(10);

		if (checkidle)
		{
			lastidle = millis();
			checkidle = 0;
			//Serial.println("reset idle counter");
		}
		else
		{
			long currentmillis = millis();
			if ((currentmillis - lastidle) > idlewait)
			{
				CS_Disp("Idle...");
				CS_Disp_Wind2("Twiddling thumbs");
				checkidle = 1;
				//here is where the pmc_enable_sleep_mode stuff would go
			}
		}
	}
	break;

	case 1: // start injection state
	{
		//Serial.println("lets start injecting shall we?");

		if (PC_inputgoodness && CS_commgoodness) // only do anything if settings are ok
		{
			CS_Disp("ITS EIT TIME!");
			CS_Disp_Wind2("Lets bloody do this");

			Serial.print(CS_commokmsg); // send ok msg to pc

			//pulse pins different amounts so we can find them in the EEG loading
			indChnIdent();

			
			//reset all counters
			iFreq = 0;
			iPrt = 0;
			iRep = 0;
			iStim = 0;

			state = 2; //move to injecting state next loop
			FirstInj = 1; // flag that we are on the first injection
			SwitchesProgrammed = 0; // show that switches are not set

			if (SingleFreqMode) // see if we are in single freq mode and then set some of the settings that wont change
			{
				CS_commgoodness = CS_sendsettings_check(Amp[iFreq], Freq[iFreq]); // send settings to current source

				/* do this in the first iteration of the inject state - so the communication order the is the same!
				if (StimMode && CS_commgoodness) // initialise stimulator trigger if we are in stim mode
				{
				CS_commgoodness = stim_init(Freq[iFreq]);
				}
				*/

				if (!CS_commgoodness)
				{
					state = 0; // dont start injection if things are fucked
					Serial.print(CS_commerrmsg);
					CS_Disp("CS SET ERROR");
					CS_Disp_Wind2("NOOOOOOOOOOOO");
				}
				else
				{
					// everything is ok - lets inject!
					Serial.print(CS_commokmsg);
					CS_Disp("CS SET OK");
					CS_Disp_Wind2("SingleFreqMode");
					// turn on switches ready for injecting and that
					SwitchesPwrOn();

					//Serial.println("Switches POWERED ON");
					delay(50);
				}
			}
			else // we are in multifrequency mode and thus we need to set more stuff before we start injection
			{
				//not sure mate
			}

		}
		else // if settings are not ok then dont do anything
		{
			if (!CS_commgoodness)
			{
				Serial.print(CS_commerrmsg);
			}
			else
			{
				Serial.print(CS_settingserrmsg);
			}
			state = 0;
			checkidle = 1;
		}
	}
	break;
	case 2: //injection
	{
		/* INJECTION!!! THIS IS THE MAIN EVENT FOLKS

		main flow of this is:

		SinglefrequencyMode - as the old "switchesserialV5" code. Current Source Started then check if MeasTime has elapsed then change switches

		MultiFreqMode - all freqs inejcted in random order before switching channels. Switches closed as CS stopped between each freq.

		Switchflag is set either by being the first iteration, or by MeasTime being elapsed. in single freqmode Switchflag is used for changing channels,
		but for multifreqmode it refers to switching frequencies.

		*/


		if (SingleFreqMode) // if only doing 1 frequency then we can copy and paste the code from previous iterations
		{
			if (!SwitchesProgrammed)
			{
				/*Serial.print("Channels I am about to program: ");
				Serial.print(Injection[iPrt][0]);
				Serial.print(" and ");
				Serial.println(Injection[iPrt][1]);*/
				///* debug trig */indpins_pulse(0, 0, 0, 2);
				SetSwitchesFixed(); // if switches havent been programmed then do that based on iPrt and take a set amount of time
			}

			if (FirstInj == 1) // if its the first time then switch straight away, otherwise check if the switch time has been met
				//if this is the first time we are injecting we need to send settings to the current source
			{

				if (StimMode)
				{
					stim_init(Freq[iFreq]);
				}


				///* debug trig */indpins_pulse(0, 0, 0, 1);


				//start current source
				StartTime_CS = micros();
				CS_start();

				///* debug trig */indpins_pulse(0, 0, 0, 1);

				//display some stuff on the front
				CS_Disp("EIT is happening...");
				CS_Disp_single(Amp[iFreq], Freq[iFreq], iRep, NumRep);

				indpins_pulse(1, 0, 0, 0); //send start pulse to indicators

				lastInjSwitch = micros(); //start timer


				PC_sendupdate(); //send stuff to PC

				FirstInj = 0; // we dont want this to happen again
				Switchflag = 1; //we also want to switch the channels right now



				if (StimMode) {
					Stimflag = 1;
					lastStimTrigger = lastInjSwitch;
					StimOffsetCurrent = StimOffset;
				}


				// delay the start of injection to give the current source time to get ready
				StartElapsed_CS = micros() - StartTime_CS;

				if (StartElapsed_CS < (StartDelay_CS - 10))
				{
					delayMicroseconds(StartDelay_CS - StartElapsed_CS);
				}


				//Serial.println("Starting SingleInject");
			}
			else //if its not the first time, then see if we need to switch by checking time
			{
				currentMicros = micros();
				//Serial.println(currentMicros);
				if ((currentMicros - lastInjSwitch) > (MeasTime[0] /*- SwitchTimeFix */)) // time to switch is MeasTime, but we fixed the time taken to program switches in SetSwitchesFixed
				{
					Switchflag = 1; // if it is time to switch then set it to do that!
					/*sprintf(PC_outputBuffer, "Switch: %d", currentMicros - lastInjSwitch);
					Serial.println(PC_outputBuffer);*/
				}
				else if ((currentMicros - lastStimTrigger) > (StimTriggerTime + StimOffsetCurrent) && StimMode) // if after offset aND we are in stim mode then
				{
					Stimflag = 1;
					digitalWriteDirect(PWR_STIM, HIGH); //turn off stimulator power supply

					/*sprintf(PC_outputBuffer, "Stim: %d", currentMicros - lastInjSwitch);
					Serial.println(PC_outputBuffer);*/
				}
			}


			if (StimMode && Stimflag) //if we are in stim mode and time to stimulate is passed
			{
				//Serial.println("doing stim");
				//sprintf(PC_outputBuffer, "Stim: %d", currentMicros - lastInjSwitch);
				//Serial.println(PC_outputBuffer);

				stim_nextphase(); // do the next one
				Stimflag = 0; // reset stimulation flag
				StimOffsetCurrent = 0; // set offset to 0 as its not the first stimulation for this protocol line anymore
			}


			if (Switchflag) // if we have been told to switch
			{
				if (iRep == NumRep) // if we have reached the total number of injections
				{
					state = 3; // do stop command
				}
				else // otherwise carry on with switching etc.
				{

					/* debug trig */indpins_pulse(0, 0, 0, 1);

					SwitchChn(); // switch channel
					StimOffsetCurrent = StimOffset; //reset the stimoffset as we are switching again
				}

				// indicator and stimulation things here too!!!!!!!

				if (iPrt == 0 && iRep > 0 && iRep < NumRep) // if we have a new thing to display then update
				{
					CS_Disp_single(Amp[iFreq], Freq[iFreq], iRep, NumRep);

					PC_sendupdate();
				}
				Switchflag = 0;
				Stimflag = 0;
			}
		}
		else //MULTIFREQUENCY MODE
		{
			if (FirstInj) //if this is the first time it is called then setup straight away
			{

				CS_Disp("EIT IS GO");
				Switchflag = 1;

				indpins_pulse(1, 0, 0, 0); //send start pulse to indicators

				if (StimMode) Stimflag = 1;

				FirstInj = 0;
				//Serial.println("Starting MultiInject");
				shuffle(FreqOrder, NumFreq);
				//send info to PC
				PC_sendupdate();

				//turn on power to switches
				SwitchesPwrOn();

			}
			else // if this is NOT the first time called, then check if time has elapsed before changing frequency
			{
				currentMicros = micros();
				if ((currentMicros - lastFreqSwitch) > (MeasTime[curFreq] /*- SwitchTimeFix*/)) // time to switch is MeasTime, but we fixed the time taken to program switches in SetSwitchesFixed
				{
					Switchflag = 1; //set that we should switch now
				}
				else if ((currentMicros - lastStimTrigger) > (StimTriggerTime + StimOffsetCurrent) && StimMode) // if enough time has elapsed AND we are in stim mode then
				{
					Stimflag = 1;
				}
			}

			if (StimMode) //only do this if stim mode
			{
				if (Stimflag && (currentMicros - lastInjSwitch) > StimOffset) // if we have been told to switch and offset has passed
				{
					Stimflag = 0; // reset stimulation flag
					stim_nextphase(); // do the next one
					StimOffsetCurrent = 0; // set offset to 0 as its not the first stimulation for this protocol line anymore
				}
			}

			if (Switchflag) //if we have been told to switch then...
			{
				//Serial.println("doing switchflag stuff");
				if (iRep == NumRep) //if total number of repetitions have been reached then stop this madness
				{
					state = 3;
				}
				else // if it is business as usual then change freq
				{
					if (iFreq == NumFreq) //if we have done all the frequencies then change injection channels
					{
						CS_next_chn(); // call function to increment iPrt and shuffle Freqorder again, and sent to PC

					}

					CS_next_freq(); // this function is the guts of multifreqmode - stop CS, send new settings, then start again
					StimOffsetCurrent = StimOffset; //reset the stimoffset as we are switching again
				}
				Switchflag = 0;
			}
		}



	}

	break;

	case 3: // stop injection state
	{
		CS_stop(); //stop current source
		stim_stop(); //stop stimulation
		Stim_SetDigipot(StimOffValue); // set stim voltage low again
		SwitchesPwrOff(); // turn off switch network
		reset_pins_pwr(); //turn off power to switches and stim - duplication here but only of 2 clock cycles so its ok...

		indpins_pulse(0, 1, 0, 0); // indicate injection has stopped

		//front panel stuff
		CS_Disp("Inj Stopped");
		CS_Disp_Wind2("Immortality reached");

		//Serial.println("Stopping injection");
		Serial.print(CS_finishedmsg);

		reset_pins(); //over the top but reset all of the switches again

		state = 0;
		checkidle = 1;

	}

	break;

	case 5: //start contact check
	{
		if (PC_inputgoodness && CS_commgoodness) // only do anything if settings are ok
		{
			CS_Disp("Contact Check");
			CS_Disp_Wind2("Lets go!");

			Serial.print(CS_commokmsg); // send ok msg to pc

			//pulse pins different amounts so we can find them in the EEG loading
			indChnIdent();

			//reset all counters
			iFreq = 0;
			iPrt = 0;
			iRep = 0;
			iStim = 0;
			iContact = 0;

			state = 6; //move to injecting state next loop
			FirstInj = 1; // flag that we are on the first injection
			SwitchesProgrammed = 0; // show that switches are not set
			ContactEndofSeq = 0; // restart contact seq


			CS_commgoodness = CS_sendsettings_check(ContactAmp, ContactFreq); // send settings to current source

			/* do this in the first iteration of the inject state - so the communication order the is the same!
			if (StimMode && CS_commgoodness) // initialise stimulator trigger if we are in stim mode
			{
			CS_commgoodness = stim_init(Freq[iFreq]);
			}
			*/

			if (!CS_commgoodness)
			{
				state = 0; // dont start injection if things are fucked
				Serial.print(CS_commerrmsg);
				CS_Disp("CS SET ERROR");
				CS_Disp_Wind2("NOOOOOOOOOOOO");
			}
			else
			{
				Serial.print(CS_commokmsg);
				CS_Disp("CS SET OK");
				CS_Disp_Wind2("Contact Check");

			}
		}
		else // if settings are not ok then dont do anything
		{
			Serial.print(CS_settingserrmsg);
			state = 0;
			checkidle = 1;
		}
	}
	break;

	case 4: // initialise or "get settings" state
	{
		//do the CS init again
		//Serial.println("initialising");
		CS_commgoodness = 0;
		CS_commgoodness = CS_init();

		if (CS_commgoodness)
		{
			Serial.print(CS_commokmsg);
		}
		else
		{
			Serial.print(CS_commerrmsg);
		}
		CS_Disp("Reading from PC");
		CS_Disp_Wind2("Hang on a second....");

		//get settings from PC
		PC_commgoodness = 0;
		PC_commgoodness = PC_getsettings();

		if (PC_commgoodness)
		{
			Serial.print(CS_commokmsg);
			CS_Disp("SETTINGS READ OK!");
			CS_Disp_Wind2("WOOO :DDD");
		}
		else
		{
			//Serial.println(CS_settingserrmsg);
			Serial.print(CS_commerrmsg);
			CS_Disp("SETTINGS ERROR!");
			CS_Disp_Wind2("BOO >:(");
		}

		/*check settings are ok - all sent to CS with verification ONCE
		not checked during injection as takes too long
		*/

		if (PC_commgoodness)
		{
			//Serial.println("checking inputs");
			PC_inputgoodness = checkinputs(); // check inputs

			if (!PC_inputgoodness) // moan if its not ok
			{
				//Serial.println("INPUT CHECK FAILED");
				Serial.print(CS_settingserrmsg);
				CS_Disp("WEIRD SETTINGS");
				CS_Disp_Wind2("WTF????");
			}
			else
			{
				Serial.print(CS_commokmsg);
				CS_Disp("Settings check out ok");
				CS_Disp_Wind2("Lets do some EIT why not");
			}

		}


		state = 0; //back to idle when done
		checkidle = 1;

	}
	break;
	case	7: //check triggers
	{
		//this is badly coded because who cares

		indpins_pulse(50, 50, 50, 50);
		delay(50); //make sure this finished before we do other stuff
		state = 0;
		/*Serial.print("ind done");
		Serial.println(state);
		*/

	}
	break;
	case 6: //contact check
	{

		if (!SwitchesProgrammed)
		{
			/*Serial.print("Channels I am about to program: ");
			Serial.print(Injection[iPrt][0]);
			Serial.print(" and ");
			Serial.println(Injection[iPrt][1]);*/

			SetSwitchesFixed_Contact(); // if switches havent been programmed then do that based on iPrt and take a set amount of time
		}

		if (FirstInj == 1) // if its the first time then switch straight away, otherwise check if the switch time has been met
			//if this is the first time we are injecting we need to send settings to the current source
		{
			//turn on power to switches
			digitalWriteDirect(PWR_SWITCH, HIGH);

			//start current source
			CS_start();
			//display some stuff on the front
			CS_Disp("Checking Contact");
			CS_Disp_Contact(iContact, NumElec);

			indpins_pulse(1, 0, 0, 0);
			//indpins_pulse(0, 0, 3, 0); // compatible with OLD CODE ONLY


			FirstInj = 0;
			Switchflag = 1;
			lastInjSwitch = micros();

		}
		else //if its not the first time, then see if we need to switch by checking time
		{
			currentMicros = micros();
			//Serial.println(currentMicros);
			if ((currentMicros - lastInjSwitch) > (ContactTime /*- SwitchTimeFix */)) // time to switch is MeasTime, but we fixed the time taken to program switches in SetSwitchesFixed
			{
				Switchflag = 1; // if it is time to switch then set it to do that!
				/*sprintf(PC_outputBuffer, "Switch: %d", currentMicros - lastInjSwitch);
				Serial.println(PC_outputBuffer);*/
			}



			if (Switchflag) // if we have been told to switch
			{
				if (ContactEndofSeq == 1) // if we have reached the total number of injections
				{
					state = 3; // do stop command
					//for OLD CODE COMPATONLY
					//indpins_pulse(0, 0, 5, 0);
				}
				else // otherwise carry on with switching etc.
				{

					SwitchChn_Contact(); // switch channel
					CS_Disp_Contact(iContact, NumElec);
				}

				Switchflag = 0;

			}
		}

	}
	break;
	}
}


//function to read command from PC and then put system in "state"
void getCMD(char CMDIN)
{
	switch (CMDIN)
	{
	case 'X': //set to idle "do nothing" state (I dont know why you would need this)
		state = 0;
		break;
	case 'H': // Halt injection state
	{
		if (state != 0) // if system is NOT idle
		{
			state = 3;
		}
		break;
	}
	case 'S': //start injection
	{
		if (state == 0) // if the system is idle ONLY
		{
			state = 1;
		}
		break;
	}
	case 'I': // Initialise settings - read from PC and set CS defaults
	{
		if (state == 0) // if the system is idle ONLY
		{
			state = 4;
		}
		break;
	}
	case 'C': //start contact impedance check
	{
		if (state == 0) // if the system is idle ONLY
		{
			state = 5;
		}
		break;
	}
	case 'T': // check trigger state
	{
		if (state == 0) // if the system is idle ONLY
		{
			state = 7;
		}
		break;
	}

	default: // if not one of these commands then keep state the same
		state = state; //a bit didactic but hey
		break;
	}
}




void TC4_Handler() //this is the ISR for the 667kHz timer - runs every 1.5 uS - this is as fast as I could reliably get it as worst case code takes 1.357 uS to run
{
	// We need to get the status to clear it and allow the interrupt to fire again
	TC_GetStatus(TC1, 1); //here TC2,1 means TIMER 2 channel 1

	if (Stim_goflag) //if we should go
	{
		//StiminterruptCtr++; //increment intrctr
		if (!Stim_pinstate && StiminterruptCtr >= d1) // check if timer is up and pulse still low
		{
			digitalWriteDirect(IND_STIM, 1); //write pin high
			Stim_pinstate = !Stim_pinstate;
		}
		else if (Stim_pinstate && StiminterruptCtr >= d2)
		{

			digitalWriteDirect(IND_STIM, 0); //write pin low
			Stim_pinstate = !Stim_pinstate;

			Stim_goflag = 0; //stop it from happening again
			TC_Stop(TC1, 1);

		}

		StiminterruptCtr++; //increment intrctr
	}
	else
	{
		StiminterruptCtr = 0; //reset intrcntr

	}
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

/*

void TC6_Handler() //this runs every 166uS which is the same rate as the pmark on the CS at 6kHz - fake pmark
{
// We need to get the status to clear it and allow the interrupt to fire again
TC_GetStatus(TC2, 0); //here TC2,2 means TIMER 2 channel 0
digitalWriteDirect(fakepmarkpin, 1);
digitalWriteDirect(fakepmarkpin, 0);
}
*/


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}



