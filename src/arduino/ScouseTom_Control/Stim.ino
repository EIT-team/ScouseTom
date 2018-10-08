void stim_nextphase()
{
	//digitalWriteDirect(PWR_STIM, HIGH); //turn on stimulator power supply

	d1 = Stim_delays[Stim_PhaseOrder[iStim]]; // number of ticks to wait after pmark before starting simulation 
	d2 = d1 + StimPulseWidthTicks; // number of ticks to set pin low

	//sprintf(PC_outputBuffer, "%d: d1 = %d, d2 = %d", iStim, d1, d2);
	//Serial.println(PC_outputBuffer);
	//StiminterruptCtr = 0;

	//Serial.println("attaching ISR");
	//attachInterrupt(INTR_PMARK, ISR_PMARK, FALLING); // attach the interupt to the pmark pin - turning on and off in this way prevents errors with pmarks happening during stimulation
    Stim_goflag = 1; // set flag for the TC7 Handler
    Stim_ready = 0; //no more stims till time has elapsed
    
	//Serial.println("attached");
	TC_Start(TC1, 1); // start the timer ISR for the stim trigger
  delay(1);
	Stim_ready = 1; // set flag so ISR_PMARK starts the stim going when pmark happens
	lastStimTrigger = currentMicros; //record time we last did one 

	iStim++; // increment stimulation conter

	if (iStim == NumDelay) // reset counter if all of them are done
	{
		iStim = 0;
		shuffle(Stim_PhaseOrder, NumDelay); //shuffle the phases again
		//PC_sendphaseupdate(); //send order to PC
		//Serial.println("shuffled phases");
	}

}


void ISR_PMARK() // this ISR runs when pmark detected
{
	/*this could be sped up by editing WInterupts.c, as there is a 4us delay from change detected to other ISRs running.

	This is compensated for however, by editing the PMARK to offset this delay */

	if (Stim_ready) // if software says we should have a stim
	{

		Stim_goflag = 1; // set flag for the TC7 Handler
		Stim_ready = 0; //no more stims till time has elapsed
//		detachInterrupt(INTR_PMARK); //remove this interupt as we want to ignore it during stimulation
	}
}


void ISR_PMARK_TEST() // ISR for testing PMARK in, set variable high when called
{
	PMARK_TEST_FLAG++; //increment this counter 
	//Serial.print("s"); //for debugging
}



int stim_init(long Freq) //initialise the stimulator trigger 
{
	TC_Stop(TC1, 1); // stop stim ISR just in case :)

	//reset the variables
	d1 = 0;
	d2 = 0;
	NumDelay = 0;
	StiminterruptCtr = 0;
	iStim = 0;

	StimPulseWidthTicks = StimPulseWidth / mintime; // convert the pulse width into integer number of ticks

	//Serial.print("StimPulseTicks:");
	//Serial.println(StimPulseWidthTicks);

	stim_calcdelays(Freq); //calculate the delays for this frequency - 
	shuffle(Stim_PhaseOrder, NumDelay); // randomise the order of the delays

	CS_PhaseMarker = stim_setpmark(Freq); //get the phasemarker phase 

	//sprintf(CS_outputBuffer, "SOUR:WAVE:PMARK:LEV %d", CS_PhaseMarker); //make string to send to CS
	//Serial1.println(CS_outputBuffer); // send to CS

	int goodnessflag = 0;

	//CS_getresponse("SOUR:WAVE:PMARK:LEV?", CS_timeoutlimit);
	goodnessflag = 1; //CS_checkresponse_num(CS_PhaseMarker, 1);

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.println("pmark wrong");
		Serial.print(CS_commerrmsg);
	}
	else //if things are set OK...
	{
		digitalWriteDirect(PWR_STIM, HIGH); //turn on stimulator power supply
		PC_sendphaseupdate(); //send phase stuff to PC
		//Serial.println(StimWiperValue);

		Stim_SetDigipot(StimWiperValue); // set the potentiometer voltage
	}

	return goodnessflag;

}

void stim_stop()
{
	//stop all interupts and timers
//	detachInterrupt(INTR_PMARK);
	TC_Stop(TC1, 1);

	//Stim_SetDigipot(StimOffValue); // set stim voltage low again

	//digitalWriteDirect(PWR_STIM, LOW); //turn on stimulator power supply

	//reset all the variables  
	Stim_goflag = 0;
	Stim_ready = 0;
	d1 = 0;
	d2 = 0;
	StiminterruptCtr = 0;
	//Stimflag = 0;

}



void stim_calcdelays(long Freq) //calculate the possible delays for this freq
{
	float T = 1000000 / Freq; // period in microseconds
	float phaseacc = T / 360; //microseconds per degree of phase

	if (phaseacc < mintime) // if time for 1 degree is less than the minimum take a subset
	{
		NumDelay = int((T / mintime)+0.5); //find number of possible phases

		for (int i = 0; i < NumDelay; i++) //populate vector
		{
			Stim_delays[i] = i;
			Stim_phases[i] = (i*mintime)/phaseacc;
		}
	}
	else // if phase time is greater than min time, then only do 360 phases
	{
		NumDelay = 360;

		for (int i = 0; i < NumDelay; i++)
		{
			Stim_delays[i] = i*phaseacc;
			Stim_phases[i] = i;
		}

	}

	for (int n = 0; n < NumDelay; n++) // populate phase order array
	{
		Stim_PhaseOrder[n] = n;
	}


	/*
	Serial.print("T:");
	Serial.println(T);
	Serial.print("phaseacc:");
	Serial.println(phaseacc);
	Serial.print("NumDelay:");
	Serial.println(NumDelay);

	Serial.print("delays:");
	for (int i = 0; i < NumDelay; i++)
	{
	Serial.print(delays[i]);
	Serial.print(",");
	}
	Serial.println("...");

	Serial.print("phases:");
	for (int i = 0; i < NumDelay; i++)
	{
	Serial.print(phases[i]);
	Serial.print(",");
	}
	Serial.println("...");
	*/
}

int stim_setpmark(long Freq) // sets the phase marker on the current source based on the 7 uS delay such that a delay of 0 ticks is 0 phase
{
	float T = 1000000 / Freq; // period in microseconds
	float phaseacc = T / 360; //microseconds per degree of phase
	float phasedelay = startdelay / phaseacc; // phase delay this corresponds to

	int pmarkphase = 0; //phase pmark is sent

	if (phasedelay > 1)
	{
		pmarkphase = 360 - phasedelay;
	}

	return pmarkphase;

	/*	Serial.print("phasedelay:");
	Serial.print(phasedelay);
	Serial.print("pmarkphase:");
	Serial.println(pmarkphase);*/
}


int CheckPmark()
{
	/*Check that the Pmark is working correctly - otherwise stimulation wont work

	turn on injection at a low amp and freq and see if the PMARK_TEST variable has been incremented sufficiently

	the interupt always runs once - so have to check the number of times is more than that! 100ms at 10khz should be 1000, but just more than 500

	*/

	PMARK_TEST_FLAG = 0;
	int CheckOK = 0;

	//CS_sendsettings(1, 10000,1); // send settings to current source
	//Serial.println("starting pmark check");

	//CS_start();

	//attachInterrupt(INTR_PMARK, ISR_PMARK_TEST, FALLING); // attach the interupt to the pmark pin -
    Stim_goflag = 1; // set flag for the TC7 Handler
    Stim_ready = 0; //no more stims till time has elapsed
	delay(100);

	//detachInterrupt(INTR_PMARK);
	//CS_stop();
	//Serial.println("pmark check done");


//	if (PMARK_TEST_FLAG > 50)
//	{
		CheckOK = 1;
		//Serial.println("pmark ok");
//	}
//	else
//	{
//		CheckOK = 0;
		//Serial.println("pmark bad");
//	}

	return CheckOK;
}





void Stim_SetDigipot(int val)
{
	Wire.beginTransmission(DigiPotAddress); // transmit to device #44 (0x2c)
	// device address is specified in datasheet
	Wire.write(byte(0x00));            // sends instruction byte
	Wire.write(val);             // sends potentiometer value byte
	Wire.endTransmission();     // stop transmitting
}

