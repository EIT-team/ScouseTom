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

	// pins for testing switch network
	pinMode(TEST_1, INPUT);
	pinMode(TEST_2, INPUT);

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
	digitalWriteDirect(IND_EX_1, LOW);
	digitalWriteDirect(IND_EX_2, LOW);
	digitalWriteDirect(IND_EX_3, HIGH);
}



void reset_pins_pwr()
{
	//reset all power pins
	digitalWrite(PWR_STIM, LOW);

}

void indChnIdent() //pulses to send at start of injections to indicate which indicator pins are which
{
	
	int del = 430;


	//pulse on the dummy channel 
	ind_pulse_with_delay(IND_EX_3, del, 10);

	//separate these from the next ID codes
	delayMicroseconds(del * 5);


	//real ID codes start

	//pulses indicator pins
	indpins_pulse(3, 5, 4, 6); //number of pulses is a bit odd as 4 was used previously on switch chn, so dont want kirill to shout at me for making him change one line of code

	ind_pulse_with_delay(IND_EX_1, del, 7);

	ind_pulse_with_delay(IND_STIM, del, 2);


}

void ind_low()
{
	//set all indicator pins low
	digitalWriteDirect(IND_SWITCH, LOW);
	digitalWriteDirect(IND_STIM, LOW);
	digitalWriteDirect(IND_FREQ, LOW);
	digitalWriteDirect(IND_START, LOW);
	digitalWriteDirect(IND_STOP, LOW);
	digitalWriteDirect(IND_EX_1, LOW);
	digitalWriteDirect(IND_EX_2, LOW);
	digitalWriteDirect(IND_EX_3, LOW);

}

void ind_high()
{
	//set all indicator pins high
	digitalWriteDirect(IND_SWITCH, HIGH);
	digitalWriteDirect(IND_STIM, HIGH);
	digitalWriteDirect(IND_FREQ, HIGH);
	digitalWriteDirect(IND_START, HIGH);
	digitalWriteDirect(IND_STOP, HIGH);
	digitalWriteDirect(IND_EX_1, HIGH);
	digitalWriteDirect(IND_EX_2, HIGH);
	digitalWriteDirect(IND_EX_3, HIGH);
}


void ind_pulse_with_delay(int chn, int del, int repeats)
{
	for (int i = 0; i < repeats; i++)
	{

		digitalWriteDirect(chn, HIGH);
		delayMicroseconds(del);
		digitalWriteDirect(chn, LOW);
		delayMicroseconds(del);

	}
}