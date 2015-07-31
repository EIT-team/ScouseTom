

void SwitchChn() //switch channels - switches are programmed by SetSwitchesFixed and not changed until SYNC brought HIGH
{
	if (StimMode)
	{
		stim_stop();
	}

	lastInjSwitch = micros();
	digitalWriteDirect(SYNC, HIGH);

	if (SingleFreqMode)
	{
		indpins_pulse(0, 0, 1, 0); // only pulse if single freq mode as prt is repeated for multi
		// increment protocol line 
		iPrt++;
		if (iPrt == NumInj) // if complete protocol done then reset and increment repetiton counter
		{
			iPrt = 0;
			iRep++;
		}
	}

	lastStimTrigger = lastInjSwitch;
	SwitchesProgrammed = 0;

	/*Serial.println("Switching Right now");
	Serial.print("IPRT is now: ");
	Serial.println(iPrt);*/
}


void SetSwitchesFixed()
{
	/*Serial.print("Programming Switches:iPrt ");
	Serial.println(iPrt);*/
	//start programming timer
	tswprogstart = micros();
	//set up switches
	programswitches(Injection[iPrt][0], Injection[iPrt][1]);

	SwitchesProgrammed = 1; //set flag to indicate the switches have been programmed
	tswprogend = micros();
	//ensure the switching always takes same time SwitchTime
	//delayMicroseconds(SwitchTimeFix - (tswprogend - tswprogstart));
}


void SetSwitchesFixed_Contact() //specifically for contact check
{

	//start programming timer
	tswprogstart = micros();


	int ChnOK = 0; //flag for whether good channels have been found 
	int ContactChnA = 0; // neighbouring channels for contact check
	int ContactChnB = 0;

	// check if channels are OK to use
	while (ChnOK == 0)
	{

		ContactChnA = iContact + 1; // neighbouring channels for contact check
		if (ContactChnA > NumElec) // if greater than number of electrodes then go back to start
		{
			ContactChnA = ContactChnA - NumElec;
		}

		ContactChnB = ContactChnA + 1;

		if (ContactChnB > NumElec) // if greater than number of electrodes then go back to start
		{
			ContactChnB = ContactChnB - NumElec;
		}

		int ChnAok = BadElecCheck(ContactChnA); //check channel A is ok to use
		int ChnBok = BadElecCheck(ContactChnB); //check channel B is ok to use

		if (ChnAok && ChnBok) // if both OK then ok to use!
		{
			ChnOK == 1;
			break;
		}
		else // otherwise increment the protcol line
		{
			ChnOK == 0;
			iContact++; 
			if (iContact == NumElec) // if complete protocol done then reset and increment repetiton counter
			{
				ContactEndofSeq = 1;
				break;
			}

		}
	}

	/*Serial.print("Programming Switches:iContact ");
	Serial.print(iContact);
	Serial.print(" : ChnA: ");
	Serial.print(ContactChnA);
	Serial.print(" : ChnB: ");
	Serial.println(ContactChnB);*/
	

	//set up switches
	programswitches(ContactChnA, ContactChnB);

	SwitchesProgrammed = 1; //set flag to indicate the switches have been programmed
	tswprogend = micros();
	//ensure the switching always takes same time SwitchTime
	//delayMicroseconds(SwitchTimeFix - (tswprogend - tswprogstart));
}


void SwitchChn_Contact() //switch channels - switches are programmed by SetSwitchesFixed and not changed until SYNC brought HIGH
{
	lastInjSwitch = micros();
	digitalWrite(SYNC, HIGH);


	indpins_pulse(0, 0, 1, 0); // only pulse if single freq mode as prt is repeated for multi
	// increment protocol line 
	iContact++;
	if (iContact == NumElec) // if complete protocol done then reset and increment repetiton counter
	{
		iContact = 0;
		ContactEndofSeq = 1;
	}

	SwitchesProgrammed = 0;
	
	/*Serial.println("Switching Right now");
	Serial.print("iContact is now: ");
	Serial.println(iContact);*/
}



//function to program switches
void programswitches(int sourcechn, int sinkchn)
{
	//current on due this takes 220 us - could be sped up significantly but digitalwritedirect was too fast for optocouplers/switches
	//Set SYNC low to enable programming of switches
	digitalWrite(SYNC, LOW);
	//Iterate 40 times, once for each switch. Turn on switches based on values in Injection[][]
	//1st command sent is for switch 40, last is for switch 1.
	//Switches correspond directly to pins on DSUB - switch 1 goes to pin 1 etc.
	for (int j = 40; j > 0; j--) {
		digitalWriteDirect(DINp, LOW);
		digitalWriteDirect(DINn, LOW);
		if (sourcechn == j)  digitalWrite(DINp, HIGH);
		if (sinkchn == j)  digitalWrite(DINn, HIGH);
		//Generate clock pulse to clock in switch values to DIN pins.
		digitalWrite(SCLK, HIGH);
		digitalWrite(SCLK, LOW);
		//Set low again
		digitalWriteDirect(DINp, LOW);
		digitalWriteDirect(DINn, LOW);
	}
}

void SwitchesPwrOn()
{
	digitalWrite(PWR_SWITCH, HIGH); //turn on power
	digitalWrite(RESET, LOW);
	digitalWrite(SYNC, HIGH);
	digitalWrite(SYNC, LOW);
	digitalWrite(SYNC, HIGH);
	programswitches(0, 0); //program dem switches
	digitalWriteDirect(SYNC, HIGH); // switch dat!
}

void SwitchesPwrOff()
{
	digitalWrite(RESET, LOW); // reset is probably quicker than just turning power off 
	//digitalWriteDirect(RESET, HIGH); // 
	digitalWriteDirect(PWR_SWITCH, LOW); //turn off power
	reset_pins(); // set all pins to starting state
}



void shuffle(int *array, int n) {
	//this is the knuth-fisher-yates shuffle dontcha know
	if (n > 1)
	{
		for (int i = n - 1; i > 0; i--)  {
			int j = random(i);
			int t = array[j];
			array[j] = array[i];
			array[i] = t;
		}
	}
}

int BadElecCheck(int Chn)
// this checks if the given channel is included in the array of bad electrodes
{
	int chnok = 1;

	//return ok by default if no bad channels
	if (NumBadElec == 0)
	{
		chnok = 1;
		return chnok;
	}

	for (int i = 0; i < NumBadElec; i++)
	{
		if (Chn == BadElecs[i])
		{
			chnok = 0;
			break;
		}
	}
	return chnok;

}