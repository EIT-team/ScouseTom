
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
	//digitalWriteDirect(PWR_SWITCH, LOW); //turn off power
	reset_pins(); // set all pins to starting state
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
		Serial.println("Wtf!? Switch already high");
		return SwitchOK;
	}

	//program the positive side *only*
	programswitches(testchn, 0, TotalPins); //program dem switches
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(1); //ensure it has switched

	Pos_OK = digitalRead(TEST_2);

	Serial.print("pos val was: ");
	Serial.println(Pos_OK);

	//program the positive side *only*
	programswitches(0, testchn, TotalPins); //program dem switches
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(1); //ensure it has switched

	Neg_OK = digitalRead(TEST_2);

	Serial.print("neg val was: ");
	Serial.println(Neg_OK);

	//switces only ok if both pos and neg worked
	if (Pos_OK && Neg_OK)
	{
		SwitchOK = 1;
	}

	//reset switches ready for next time
	
	digitalWrite(RESET, LOW);
	digitalWrite(RESET, HIGH);

	return SwitchOK;
}

