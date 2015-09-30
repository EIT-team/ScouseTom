

void SwitchChn() //switch channels - switches are programmed by SetSwitchesFixed and not changed until SYNC brought HIGH
{
	if (StimMode)
	{
		stim_stop();
	}

	lastInjSwitch = micros();
	digitalWriteDirect(SYNC, HIGH);
	SwitchesProgrammed = 0;
	lastStimTrigger = lastInjSwitch;

	if (SingleFreqMode)
	{ 
		// increment protocol line 
		iPrt++;
		indpins_pulse(0, 0, 1, 0); // only pulse if single freq mode as prt is repeated for multi

		if (iPrt == NumInj) // if complete protocol done then reset and increment repetiton counter
		{
			iPrt = 0;
			iRep++;
			indpins_pulse(0, 0, 1, 0); // Pulse for complete protocol - this is to make a double pulse to indicate complete protocol during processing 

		}
	}


	

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
	programswitches(Injection[iPrt][0], Injection[iPrt][1],TotalPins);

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
	programswitches(ContactChnA, ContactChnB, TotalPins);

	SwitchesProgrammed = 1; //set flag to indicate the switches have been programmed
	tswprogend = micros();
	//ensure the switching always takes same time SwitchTime
	//delayMicroseconds(SwitchTimeFix - (tswprogend - tswprogstart));
}


void SwitchChn_Contact() //switch channels - switches are programmed by SetSwitchesFixed and not changed until SYNC brought HIGH
{
	lastInjSwitch = micros();
	digitalWrite(SYNC, HIGH);

	
	// increment protocol line 
	iContact++;
	if (iContact == NumElec) // if complete protocol done then reset and increment repetiton counter
	{
		iContact = 0;
		ContactEndofSeq = 1;
	}

	SwitchesProgrammed = 0;
	
	indpins_pulse(0, 0, 1, 0); // only pulse if single freq mode as prt is repeated for multi
	/*Serial.println("Switching Right now");
	Serial.print("iContact is now: ");
	Serial.println(iContact);*/
}



//function to program switches
void programswitches(int sourcechn, int sinkchn, int maxpins)
{

	//current on due this takes 220 us - could be sped up significantly but digitalwritedirect was too fast for optocouplers/switches
	//Set SYNC low to enable programming of switches
	digitalWrite(SYNC, LOW);
	//Iterate 40 times, once for each switch. Turn on switches based on values in Injection[][]
	//1st command sent is for switch 40, last is for switch 1.
	//Switches correspond directly to pins on DSUB - switch 1 goes to pin 1 etc.
	for (int j = maxpins; j > 0; j--) {
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
	digitalWrite(RESET, HIGH);
	digitalWrite(SYNC, HIGH);
	digitalWrite(SYNC, LOW);
	digitalWrite(SYNC, HIGH);
	programswitches(0, 0, TotalPins); //program dem switches
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



int SwitchCheckPWR()
{
	// check power to switches is ok - TEST 1 Should be high all the time 

	const int AveNum = 50;

	int OKFlag = 1;

	int PinVal = 0;
	digitalRead(TEST_1);

	//check the pin value a bunch of times, if it is ever low then the power is not working - this is to check for floating pins
	for (int i = 0; i < AveNum; i++)
	{
		PinVal = digitalRead(TEST_1);

		if (!PinVal)
		{
			OKFlag = 0;
			break;
		}

	}
	return OKFlag;

}

int SwitchCheckOpen(int BoardNum)
{
	//check the switching on the positive and negative side for a given board
	// sets opens the 39th channel which is connected to Vdd so should go high


	int testchn = 40 * (BoardNum - 1) + 39; // channel we want to open is the 39th of the specific board


	int Pos_OK = 0; // flag for positive switching side ok
	int Neg_OK = 0; // flag for negative 

	int SwitchOK = 0; // overal OK flag

	// check pin is low as expected
	int initVal = digitalRead(TEST_2);
	
	if (initVal)
	{
		//Serial.println("Wtf!? Switch already high");
		return SwitchOK;
	}

	//program the positive side *only*
	programswitches(testchn, 0, TotalPins); //program dem switches
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(1); //ensure it has switched

	Pos_OK = digitalRead(TEST_2);

	//Serial.print("pos val was: ");
	//Serial.println(Pos_OK);

	//program the positive side *only*
	programswitches(0, testchn, TotalPins); //program dem switches
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(1); //ensure it has switched

	Neg_OK = digitalRead(TEST_2);

	//Serial.print("neg val was: ");
	//Serial.println(Neg_OK);

	//switces only ok if both pos and neg worked
	if (Pos_OK && Neg_OK)
	{
		SwitchOK = 1;
	}

	//reset switches ready for next time

	digitalWrite(RESET, LOW);
	SwitchesPwrOn();
	delay(10); //esnure switches really reset

	return SwitchOK;
}

int Switch_init()
{
	// check the switching is ok. First by checking power on test1 pin, then by checking switching on each board on test2 pin
	TotalPins = PinsPerBoard * NumBoard; // recompute the number of pins

	int SW_PWROK = 0; //flag for power ok
	int SW_SWOK = 0; //flag for current board switch ok
	int SW_SWOK_ALL = 1; //flag for ALL boards ok 

	//check switch power
	SW_PWROK = SwitchCheckPWR();

	if (SW_PWROK)
	{
		Serial.print(SW_okmsg);
	}
	else
	{
		Serial.print(SW_pwrerrmsg);
	}

	//send the number of boards we have attached, so we know how many ok messages we expect to receive
	sendasciinum(NumBoard);

	//check the switches are opening ok on each board
	for (int iBoard = 1; iBoard <= NumBoard; iBoard++)
	{
		SW_SWOK = SwitchCheckOpen(iBoard);

		if (SW_SWOK)
		{
			Serial.print(SW_okmsg);
		}
		else
		{
			Serial.print(SW_switcherrmsg);
			SW_SWOK_ALL = 0;
		}
	}

	if (SW_SWOK_ALL && SW_PWROK)
	{
		return 1;
	}
	else
	{
		return 0;
	}


}