
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
	//turn on power to switch network and reset
	digitalWriteDirect(PWR_SWITCH, HIGH); //turn on power
	reset_pins(); // set all pins to starting state
	digitalWrite(RESET, LOW); // reset everything as some mysterious bullshit was happening
	//digitalWrite(RESET, HIGH); // slow digital write used to ensure pin stays high for a bit
	digitalWrite(SYNC, LOW); // reset everything as some mysterious bullshit was happening
	digitalWrite(SYNC, HIGH); // slow digital write used to ensure pin stays high for a bit
	digitalWrite(SYNC, LOW); // reset everything as some mysterious bullshit was happening
	digitalWrite(SYNC, HIGH); // slow digital write used to ensure pin stays high for a bit

}

void SwitchesPwrOff()
{
	digitalWrite(RESET, LOW); // reset is probably quicker than just turning power off 
	digitalWriteDirect(RESET, HIGH); // 
	digitalWriteDirect(PWR_SWITCH, LOW); //turn off power
	reset_pins(); // set all pins to starting state
}
