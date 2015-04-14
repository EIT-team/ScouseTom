/*
Stuff for initilalising pins and indicator pins*/

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

	//interupt channels
	pinMode(INTR_PMARK, INPUT);

	//power pins
	pinMode(PWR_STIM, OUTPUT);
	pinMode(PWR_SWITCH, OUTPUT);


	pinMode(LED, OUTPUT);
	//pinMode(fakepmarkpin, OUTPUT);

	//set default values
	reset_pins();

}

void reset_pins()
{
	//set all pins to default value - this is called by init but also when stopping injection

	digitalWrite(DINp, LOW);
	digitalWrite(DINn, LOW);
	digitalWrite(SCLK, LOW);
	digitalWrite(SYNC, HIGH);
	digitalWrite(RESET, HIGH);

	digitalWrite(IND_SWITCH, LOW);
	digitalWrite(IND_STIM, LOW);
	digitalWrite(IND_FREQ, LOW);
	digitalWrite(IND_START, LOW);
	digitalWrite(IND_STOP, LOW);

	digitalWrite(PWR_STIM, LOW);
	digitalWrite(PWR_SWITCH, LOW);



	digitalWrite(LED, LOW);
	//digitalWrite(fakepmarkpin, LOW);
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

void indpinds_pulse(int StartChn, int StopChn, int SwitchChn, int FreqChn) // this adds pulses to the buffer on each indicator channel 
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

