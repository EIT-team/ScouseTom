void establishContact() {
	while (Serial.available() <= 0) {
		Serial.print('A');   // send a capital A
		delay(300);
	}
	char inb = Serial.read();
}

int PC_getsettings()
{
	/*
	read settings from PC in standard order:

	data types dont need to be different now as Due long and ints are the same (i think)
	but kept the same for ease of copy and pasting from Uno code :)

	number of injection - int
	number of electrodes - int
	number of frequencies - int
	number of repeated protcols - int
	
	ContactTime  uS - long - user sends ms
	Stimulator trigger time - us - user sends ms
	Stimulator trigger offset - us - - user sends ms
	Stimulator pulse width - long in uS - user sends us
	Stimulator wiper setting - int 8bit value 
	Source channels[NumInj] - int
	Sink channels[NumInj] - int
	Freq[NumFreq] - long
	Amp[NumFreq] - long
	Measurementtime[NumFreq] - long - user sends ms
	check if comm fucked up after each one
	*/
	int commgoodness = 0; // flag for good communication
	int timeout = 0; // timeoutflag
	int tcurrent = 0; // current time var
	int tstart = millis(); //starting time

	int comminit = 0; // flag for starting thing

	Serial.print("<A>"); //send "im ready" byte

	while (comminit == 0 && timeout == 0)
	{
		tcurrent = millis();
		if ((tcurrent - tstart) > (PC_timeoutlimit * 5)) // check if the timeout limit has been reached 5 times more than for a sinlge number
		{
			timeout = 1;
			comminit = 0;
			commgoodness = 0;
			//Serial.println("init timed out");
		}
		else
		{
			if (Serial.available() > 0) {
				byte c = Serial.read();
				//Serial.println(c);
				if (c == 'A') // if byte is A then we all good
				{
					comminit = 1;
					commgoodness = 1;
				}
			}
		}
	}
	if (comminit) // if comm was initialised....
	{
		int finished = 0; // stupid way of doing it but have this flag crack on
		while (finished == 0) // while loop so I can break the sequence after one bad comm
		{

			/*#####################################################
			Protocol and Experiment stuff
			#######################################################*/

			//get number of injections
			NumInj = getasciinum();
			sendasciinum(NumInj);
			if (NumInj == -1)
			{
				commgoodness = 0;
				break;
			}
			//get number of electrodes
			NumElec = getasciinum();
			sendasciinum(NumElec);
			if (NumElec == -1)
			{
				commgoodness = 0;
				break;
			}

			//get number of frequencies
			NumFreq = getasciinum();
			sendasciinum(NumFreq);
			if (NumFreq == -1)
			{
				commgoodness = 0;
				break;
			}

			if (NumFreq == 1)
			{
				SingleFreqMode = 1; // set flag high for single freq mode
				iFreq = 0; //set the counter to 0 (this should never change in SingleFreqMode!
			}
			else
			{
				SingleFreqMode = 0; //we are in multimode!
				iFreq = 0;  // doesnt need to be set here though...
			}

			//get number of repeats
			NumRep = getasciinum();
			sendasciinum(NumRep);
			if (NumRep == -1)
			{
				commgoodness = 0;
				break;
			}

			//set flag to use more consise front panel info
			if (NumInj > 999 || NumFreq > 999 || NumRep > 999)
			{
				LongDispWind = 1;
			}
			


			//get contact impedance measurement time
			ContactTime = getasciinum_long();
			sendasciinum_long(ContactTime);
			if (ContactTime == -1)
			{
				commgoodness = 0;
				break;
			}

			ContactTime = ContactTime * 1000; //CONVERT INTO MICROSECONDS

			/*#####################################################
			Stimulation stuff
			#######################################################*/

			//get stimulation trigger time
			StimTriggerTime = getasciinum_long();
			sendasciinum_long(StimTriggerTime);
			if (StimTriggerTime == -1)
			{
				commgoodness = 0;
				break;
			}
			StimTriggerTime = StimTriggerTime * 1000; //for compatibility user picks milliseconds, but microseconds used for more accuracy

			//get stimulation offset time
			StimOffset = getasciinum_long();
			sendasciinum_long(StimOffset);
			if (StimOffset == -1)
			{
				commgoodness = 0;
				break;
			}

			StimOffset = StimOffset * 1000; //for compatibility user picks milliseconds, but microseconds used for more accuracy


			//get stimulation pulse width IN MICROSECONDS
			StimPulseWidth = getasciinum_long();
			sendasciinum_long(StimPulseWidth);
			if (StimPulseWidth == -1)
			{
				commgoodness = 0;
				break;
			}

			//get stimulation voltage wiper setting 
			StimWiperValue = getasciinum();
			sendasciinum(StimWiperValue);
			if (StimWiperValue == -1)
			{
				commgoodness = 0;
				break;
			}



			//Serial.println("Single things done");

			//check inputs for stim trigger time - all must be above 0 to use stim
			if (StimTriggerTime > 0 && StimOffset > 0 && StimPulseWidth > 0)
			{
				StimMode = 1; // StimMode is 1 - might need others for different stimulation types at some point
			}

			/*#####################################################
			ARRAY STUFF - PROTOCOL & FREQS & AMPS & MEASTIMES
			#######################################################*/		

			int tmp_in = 0;

			//get sources
			for (int n = 0; n < NumInj; n++)
			{
				tmp_in = getasciinum();
				sendasciinum(tmp_in);
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
				Injection[n][0] = tmp_in;
			}

			if (tmp_in == -1)
			{
				commgoodness = 0;
				break;
			}

			 //Serial.println("sourcesok");

			//get sinks
			for (int n = 0; n < NumInj; n++)
			{
				tmp_in = getasciinum();
				sendasciinum(tmp_in);
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
				Injection[n][1] = tmp_in;
			}
			if (tmp_in == -1)
			{
				commgoodness = 0;
				break;
			}

			 //Serial.println("sinksok");

			//get frequencies
			for (int n = 0; n < NumFreq; n++)
			{
				tmp_in = getasciinum();
				sendasciinum(tmp_in);
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
				Freq[n] = tmp_in;
			}
			if (tmp_in == -1)
			{
				commgoodness = 0;
				break;
			}

			//Serial.println("freqsok");

			//get amplitudes
			for (int n = 0; n < NumFreq; n++)
			{
				tmp_in = getasciinum();
				sendasciinum(tmp_in);
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
				Amp[n] = tmp_in;
			}
			if (tmp_in == -1)
			{
				commgoodness = 0;
				break;
			}

			//Serial.println("ampsok");

			//get measurement times
			for (int n = 0; n < NumFreq; n++)
			{
				tmp_in = getasciinum_long();
				sendasciinum_long(tmp_in);
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
				MeasTime[n] = tmp_in * 1000; // CONVERTED FROM MS TO US HERE
			}
			if (tmp_in == -1)
			{
				commgoodness = 0;
				break;
			}

			//Serial.println("timessok");

			//get number of bad electrodes if any 

			NumBadElec = getasciinum();
			sendasciinum(NumBadElec);
			if (NumBadElec == -1)
			{
				commgoodness = 0;
				break;
			}

			//Serial.println("numbadok");

			// if there are bad electrodes then read array
		
			if (NumBadElec > 0)
			{
				for (int n = 0; n < NumBadElec; n++)
				{
					tmp_in = getasciinum();
					sendasciinum(tmp_in);
					if (tmp_in == -1)
					{
						commgoodness = 0;
						break;
					}
					BadElecs[n] = tmp_in;
				}
				if (tmp_in == -1)
				{
					commgoodness = 0;
					break;
				}
			}

			finished = 1;
		}

		//all ok so make the freq order vector

		for (int n = 0; n < NumFreq; n++)
		{
			FreqOrder[n] = n;
		}

	}
	return commgoodness;
	
}

//check inputs are ok and check writing to CS
int checkinputs()
{
	int inputok = 1;
	int inputgoodness = 1;
	int CSwritegoodness = 1;

	int finished = 1;
	while (finished == 1) //again stupid way of doing it
	{

		if (StimMode) //is we are stimulating then check timings
		{
			if (StimOffset > MeasTime[0] || StimPulseWidth > StimTriggerTime) // stim offset must be less than measurement time and pulsewidth must be less than stimulation time 
			{
				inputok = 0;
				break;
				//Serial.println("stim bad");
			}
			
		}

		for (int i = 0; i < NumFreq; i++)
		{
			CSwritegoodness = CS_sendsettings_check(Amp[i], Freq[i]); //check each combination of amp and freq are sent ok to CS
			if (!CSwritegoodness)
			{
				inputok = 0;
				break;
			}
		}

		finished = 0;

	}
	return inputok;

}




// stolen from http://forum.arduino.cc/index.php?PHPSESSID=27ugtrfuc4cdju8cjs9mcdtgf4&topic=99225.msg743931#msg743931
int getasciinum()
{
	// read a number sent as an acii character (this allows long ints to be sent) in form <#####>
	int processNumber = 0; // the number to be output
	byte c = endOfNumberDelimiter; // init read byte
	int PC_inputFinished = 0; // is it finished flag?

	int timeout = 0; // timeoutflag
	int tcurrent = 0; // current time var
	int tstart = millis(); //starting time

	while (PC_inputFinished == 0 && timeout == 0)
	{
		tcurrent = millis();
		if ((tcurrent - tstart) > PC_timeoutlimit) // check if the timeout limit has been reached
		{
			timeout = 1;
			processNumber = -1;
		}
		else
		{
			if (Serial.available() > 0) {
				static int receivedNumber = 0;
				static boolean negative = false;
				byte c = Serial.read();
				switch (c)
				{
				case endOfNumberDelimiter:
				{
					if (negative)
					{
						processNumber = -receivedNumber;
					}
					else
					{
						processNumber = receivedNumber;
					}
					PC_inputFinished = 1;
				}
				// fall through to start a new number
				case startOfNumberDelimiter:
					receivedNumber = 0;
					negative = false;
					break;
				case '0' ... '9':
					receivedNumber *= 10;
					receivedNumber += c - '0';
					break;
				case '-':
					negative = true;
					break;
				} // end of switch
			}
		}
	}
	return processNumber;
}

long getasciinum_long() {
	// read a number sent as an acii character (this allows long ints to be sent) in form <#####>
	long processNumber = 0;
	byte c = endOfNumberDelimiter; // init read byte
	int PC_inputFinished = 0; // is it finished flag?
	int timeout = 0; // timeoutflag
	int tcurrent = 0; // current time var
	int tstart = millis(); //starting time

	while (PC_inputFinished == 0 && timeout == 0)
	{
		tcurrent = millis();
		if ((tcurrent - tstart) > PC_timeoutlimit) // check if the timeout limit has been reached
		{
			timeout = 1;
			processNumber = -1;
		}
		else
		{
			if (Serial.available() > 0) {
				static int receivedNumber = 0;
				static boolean negative = false;
				byte c = Serial.read();
				switch (c)
				{
				case endOfNumberDelimiter:
				{
					if (negative)
					{
						processNumber = -receivedNumber;
					}
					else
					{
						processNumber = receivedNumber;
					}
					PC_inputFinished = 1;
				}
				// fall through to start a new number
				case startOfNumberDelimiter:
					receivedNumber = 0;
					negative = false;
					break;
				case '0' ... '9':
					receivedNumber *= 10;
					receivedNumber += c - '0';
					break;
				case '-':
					negative = true;
					break;
				} // end of switch
			}
		}
	}
	return processNumber;
}

void sendasciinum(int num)
{
	sprintf(PC_outputBuffer, "%c%d%c", startOfNumberDelimiter, num, endOfNumberDelimiter);
	Serial.print(PC_outputBuffer);

}

void sendasciinum_long(long num)
{
	sprintf(PC_outputBuffer, "%c%d%c", startOfNumberDelimiter, num, endOfNumberDelimiter);
	Serial.print(PC_outputBuffer);
}

void	PC_sendupdate()
{
	if (SingleFreqMode) //if only single freq mode then send each new rep to PC
	{
		sprintf(PC_outputBuffer, "%c%c%d%c", startOfNumberDelimiter,RepNumIndicator, iRep+1, endOfNumberDelimiter);
		Serial.print(PC_outputBuffer);
	}
	else //if multifreq mode then send rep then prt and then freqorder - 1 indexed because matlab will read it and to stop me getting confused when debuging in the serial port
	{

		sprintf(PC_outputBuffer, "%c%c%d%c", startOfNumberDelimiter, RepNumIndicator, iRep+1, endOfNumberDelimiter);
		Serial.print(PC_outputBuffer);
		sprintf(PC_outputBuffer, "%c%c%d%c", startOfNumberDelimiter, PrtNumIndicator, iPrt+1, endOfNumberDelimiter);
		Serial.print(PC_outputBuffer);

		//lazy way of doing it 
		sprintf(PC_outputBuffer, "%c%c", startOfNumberDelimiter, FreqOrderIndicator); //do firsttwo properly
		Serial.print(PC_outputBuffer);

		//do rest with cheese!
		for (int i = 0; i < NumFreq - 1; i++)
		{
			sprintf(PC_outputBuffer, "%d%c", FreqOrder[i]+1, OrderDelimiter); // do each #, at a time...(i did this as i didnt know how to make buffer all at once
			Serial.print(PC_outputBuffer);
		}
		//do last one without comma but end thing
		sprintf(PC_outputBuffer, "%d%c", FreqOrder[NumFreq-1]+1, endOfNumberDelimiter); // send last freq order and end delim
		Serial.print(PC_outputBuffer);
	}

}

void PC_sendphaseupdate() //send the array of phases indicating what freq this corresponds to
{
	//lazy way of doing it 
	sprintf(PC_outputBuffer, "%c%c", startOfNumberDelimiter, PhaseOrderIndicator); //do firsttwo properly
	Serial.print(PC_outputBuffer);

	//do rest with cheese!
	for (int i = 0; i < NumDelay - 1; i++)
	{
		sprintf(PC_outputBuffer, "%d%c", Stim_phases[Stim_PhaseOrder[i]], OrderDelimiter); // do each #, at a time...(i did this as i didnt know how to make buffer all at once
		Serial.print(PC_outputBuffer);
	}
	//do last one without comma but end thing
	sprintf(PC_outputBuffer, "%d%c", Stim_phases[Stim_PhaseOrder[NumDelay-1]], endOfNumberDelimiter); // send last freq order and end delim
	Serial.print(PC_outputBuffer);
}
