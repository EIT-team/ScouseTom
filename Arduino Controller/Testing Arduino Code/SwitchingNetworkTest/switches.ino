
//function to program switches
void programswitches(int sourcechn, int sinkchn)
{
	//Set SYNC low to enable programming of switches
	//Serial.println("SYNC GOES LOW");
	digitalWriteDirect(SYNC, LOW);
	//delay(1);

	//Iterate 40 times, once for each switch. Turn on switches based on values in Injection[][]
	//1st command sent is for switch 40, last is for switch 1.
	//Switches correspond directly to pins on DSUB - switch 1 goes to pin 1 etc.
	for (int j = 40; j > 0; j--)
	{

		digitalWriteDirect(DINp, LOW);
		digitalWriteDirect(DINn, LOW);

		if (sourcechn == j)
		{

			//Serial.print(j);
			//Serial.println(": SOURCE NOW");

			digitalWriteDirect(DINp, HIGH);
		}
		if (sinkchn == j)
		{
			//Serial.print(j);
			//Serial.println(": SINK NOW");
			digitalWriteDirect(DINn, HIGH);
		}


		//Generate clock pulse to clock in switch values to DIN pins.
		digitalWrite(SCLK, HIGH);
		//delayMicroseconds(5);
		digitalWrite(SCLK, LOW);
		// delayMicroseconds(5);
		//delay(1);

		//Set low again
		digitalWriteDirect(DINp, LOW);
		digitalWriteDirect(DINn, LOW);

	}

	//Serial.println("SYNC GOES HIGH");
	digitalWriteDirect(SYNC, HIGH);

}



