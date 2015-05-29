/*
stuff to switch the injection channels*/

long tswprogstart = 0; //vars for programing swtiching timing
long tswprogend = 0;

long indtimerstart = 0; //vars for timing of indicator pin
long indtimerend = 0;	//

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

	int ContactChnA = iContact + 1;
	int ContactChnB = ContactChnA + 1;

	if (ContactChnB > NumElec)
	{
		ContactChnB = ContactChnB - NumElec;
	}

	/* this broke it for some reason...
	Serial.print("Programming Switches:iContact ");
	Serial.print(iContact);
	Serial.print(" : ChnA: ");
	Serial.print(ContactChnA);
	Serial.print(" : ChnB: ");
	Serial.println(ContactChnB);
	*/

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
	if (iContact == NumElec + 1) // if complete protocol done then reset and increment repetiton counter
	{
		iContact = 0;
		ContactEndofSeq = 1;
	}

	SwitchesProgrammed = 0;
	/*
	Serial.println("Switching Right now");
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
	digitalWrite(RESET, HIGH);
	digitalWrite(RESET, LOW);
	digitalWrite(RESET, HIGH);
	digitalWrite(SYNC, HIGH);
	delayMicroseconds(500); // this is to ensure the pins are held at correct levels long enough *before* being changed when programming - this fixes all pins connected bug

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
