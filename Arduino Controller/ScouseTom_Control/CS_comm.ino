/*Stuff for communication with the current source, as well as incrementing channel and frequency during injections  */


void CS_next_chn() // setup next channel for multi frequency injection
{
	//Serial.println("Changing channel, iPrt is CURRENTLY"); //debug info
	//Serial.println(iPrt);


	//increment prt counter
	iPrt++;
	if (iPrt == NumInj) // if complete protocol done then reset and increment repetiton counter
	{
		iPrt = 0;
		iRep++;
	}

	if (iRep !=NumRep) // if we arent finished then shuffle and send new info to pc
	{ 
		//shuffle freq order
		shuffle(FreqOrder, NumFreq);
		//		reset frequency counter
		iFreq = 0;
		//send info to PC
		PC_sendupdate();
		indpinds_pulse(0, 0, 1, 0); // indicate we are changing prt now 
	}
}

void CS_next_freq() // set up next frequency of injection
{
	/*long tstart = 0;
	long tset = 0;
	long tdisp = 0;
	long tsw = 0;
	long ttot = 0;
	*/
	CS_stop(); // stop current source - changing amp and freq may mean we set current too high for the new/old frequency
	//tstart = micros();
	if (iRep != NumRep) // check if we arent finished - do nothing if we are finished (this is to prevent an eroneous short injection at the end0
	{
		//Serial.println("changing frequency"); //debug info

		long curFreq = FreqOrder[iFreq]; // get the new frequency from the shuffled freqorder array

		if (StimMode) //initialise stimulator trigger if we are in stim mode 
		{
			stim_init(Freq[curFreq]);
			Stimflag = 1;
		}

		/*Serial.println(curFreq);
		Serial.println(iFreq);
		sprintf(PC_outputBuffer, "Setting Amp %duA and Freq %dHz", Amp[curFreq], Freq[curFreq]);
		Serial.println(PC_outputBuffer);*/

		CS_sendsettings(Amp[curFreq], Freq[curFreq]); // set the new amp and freq in the current source, with no error checking for speed
		//tset = micros();

		indpinds_pulse(0, 0, 0, 1);
	
		CS_Disp_multi(Amp[iFreq], Freq[iFreq], iFreq + 1, NumFreq, iPrt + 1, NumInj, iRep + 1, NumRep); // write the front panel of the CS
		//tdisp = micros();

		iFreq++; //increment the frequency counter (as all has gone well)

		/*Serial.print("Channels I am about to program: ");
		Serial.print(Injection[iPrt][0]);
		Serial.print(" and ");
		Serial.println(Injection[iPrt][1]);*/

		programswitches(Injection[iPrt][0], Injection[iPrt][1]); //programm the switches
		SwitchChn(); // open switches to CS 
		//tsw = micros();

		CS_start(); //start current source
		lastFreqSwitch = micros(); // record time we switches freq
		indpinds_pulse(0, 0, 0, 1); // send new freq pulse 
	}
	/*ttot = micros();
	sprintf(PC_outputBuffer, "Timing: %d set, %d disp, %d tsw, %d tot", tset - tstart, tdisp - tstart, tsw - tstart, ttot - tstart);
	Serial.println(PC_outputBuffer);
	*/
}




int CS_start() //start current injection
{
	int goodnessflag = 1; //communication ok flag

	//Serial.println("arming");
	Serial1.println("SOUR:WAVE:ARM"); // put CS in "ARM" mode

	/* not checking at the moment as its to slow ~30ms
	CS_getresponse("SOUR:WAVE:ARM?"); //check it went ok
	goodnessflag = CS_checkresponse("1");
	if (goodnessflag == 0) // check all is legit
	{
	Serial.println(CS_commerrmsg);
	return goodnessflag;
	}
	*/
	//Serial.println("inj");
	Serial1.println("SOUR:WAVE:INIT"); //start current injection!

	/*
	   CS_getresponse("OUTP:STAT?");
	   goodnessflag = CS_checkresponse("1");

	   if (goodnessflag == 0) // check all is legit
	   {
	   Serial.println(CS_commerrmsg);
	   }
	   */

	return goodnessflag;
}


int CS_stop() //start current injection
{
	int goodnessflag = 1; //communication ok flag
	Serial1.println("SOUR:WAVE:ABOR"); //stop current injection!

	//CS_getresponse("OUTP:STAT?");
	// goodnessflag = CS_checkresponse("0");

	if (goodnessflag == 0) // check all is legit
	{
		Serial.print(CS_commerrmsg);
	}
	return goodnessflag;
}

int CS_sendsettings_check(long Amp, long Freq) 
// send amplitude and frequency to the current source WITH CHECK 
{
	int goodnessflag = 0; //communication ok flag

	sprintf(CS_outputBuffer, "SOUR:WAVE:FREQ %d", Freq); //make string to send to CS
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	CS_getresponse("SOUR:WAVE:FREQ?");
	goodnessflag = CS_checkresponse_num(Freq, 1);

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.println("amp wrong");
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}

	sprintf(CS_outputBuffer, "SOUR:WAVE:AMPL %dE-6", Amp); //make amp setting string in microamps so have to use E-6
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	CS_getresponse("SOUR:WAVE:AMPL?"); // check amp set ok
	goodnessflag = CS_checkresponse_num(Amp, sc_micro); // amp in uA so set scale to sc_micro

	/*
	if (goodnessflag == 0) // if bad comm then return and complain
	{
		Serial.print(CS_commerrmsg);
	}
	*/
	return goodnessflag;
}




void CS_sendsettings(long Amp, long Freq) 
// send amplitude and frequency to the current source NO CHECKING as too slow 
//- all potential settings are checked during initialisation to make sure no errors
{
	sprintf(CS_outputBuffer, "SOUR:WAVE:FREQ %d", Freq); //make string to send to CS
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	sprintf(CS_outputBuffer, "SOUR:WAVE:AMPL %dE-6", Amp); //make amp setting string in microamps so have to use E-6
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

}


int CS_init() // initialise current source - set sin and compliance and turn on pmark too
{
	int goodnessflag = 0; //communication ok flag

	//check comm to CS is ok by checking response to version num
	CS_getresponse("SYST:VERS?");
	goodnessflag = CS_checkresponse(CS_vers);

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}

	//Serial.print("things ok");


	//now comm is ok lets make sure the current source is off

	CS_getresponse("OUTP:STAT?");
	goodnessflag = CS_checkresponse("0");

	if (goodnessflag == 0)
	{
		goodnessflag = CS_stop();
	}

	//Do front panel stuffs
	Serial1.println("DISP:TEXT:STAT 1"); //turn on text front panel
	Serial1.println("DISP:WIND2:TEXT:STAT 1"); //turn on text front panel - smaller disp

	CS_Disp("Lets do some EIT");
	CS_Disp_Wind2("Brink of immortality");

	// turn on phase marker as only need to do this once

	Serial1.println("SOUR:WAVE:PMARK:STAT 1");

	CS_getresponse("SOUR:WAVE:PMARK:STAT?");
	goodnessflag = CS_checkresponse("1");

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}

	// Set wave type as we only need to do this once

	Serial1.println("SOUR:WAVE:FUNC SIN");
	CS_getresponse("SOUR:WAVE:FUNC?");
	goodnessflag = CS_checkresponse("SIN");

	// Set compliance as we only need this one time

	Serial1.println("SOUR:CURR:COMP 1.9");


	/*
	if (goodnessflag == 0) // if bad comm then return and complain
	{
		Serial.print(CS_commerrmsg);
	}
	*/
	return goodnessflag;
}


void CS_Disp_single(long Amp, long Freq, int Rep, int Repeats) //display text for singlefreqmode 
{
	sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"%duA:%dHz:Rep %d of %d\"", Amp, Freq, Rep, Repeats); //make string to send to CS
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); // debug to PC
}

void CS_Disp_Contact(int Pair, int Elecs) //display text for singlefreqmode 
{
	sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"Elec Pair %d of %d\"", Pair,Elecs); //make string to send to CS
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); // debug to PC
}




void CS_Disp_multi(long Amp, long Freq, int Fnum, int Ftot, int Pnum, int Ptot, int Rep, int Repeats)
{
	//sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"%duA:%dHz:Fr %d/%d:Pr %d/%d:Rp %d/%d\"", Amp, Freq, Fnum,Ftot,Pnum,Ptot, Rep, Repeats); //make string to send to CS
	
	if (LongDispWind) // if any of them are bigger than 3 characters long then shorten
	{
		sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"F %d/%d:P %d/%d:R %d/%d\"", Amp, Freq, Fnum, Ftot, Pnum, Ptot, Rep, Repeats); //make string to send to CS
	}
	else
	{
		sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"Fq %d/%d:Pt %d/%d:Rp %d/%d\"", Fnum, Ftot, Pnum, Ptot, Rep, Repeats); //make string to send to CS
	}

	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); // debug to PC
}





void CS_Disp(String Textstr) // display text on front panel
{
	String Part1 = "DISP:TEXT \"";
	String Part2 = "\"";
	if (Textstr.length() > 20)
	{
		Textstr = Textstr.substring(0, 19);
	}

	Serial1.println(Part1 + Textstr + Part2);
}

void CS_Disp_Wind2(String Textstr) // display text on front panel - smaller lower window
{
	String Part1 = "DISP:WIND2:TEXT \"";
	String Part2 = "\"";

	if (Textstr.length() > 30)
	{
		Textstr = Textstr.substring(0, 29); //this isnt correct
	}

	Serial1.println(Part1 + Textstr + Part2);
}


void CS_getmsg() {
	//get one message from current source - up until a line feed a char at a time \n. store chars in CS_inputBuffer with null terminator
	static byte ndx = 0;

	char rc;
	if (Serial1.available() > 0) { //read serial char if available
		rc = Serial1.read();
		switch (rc)
		{
		case '\r': //ignore the carriage returns
		{
			break;
		}
		case '\n': //return the result at line feed
		{
			CS_inputBuffer[ndx] = '\0'; // terminate the string
			ndx = 0; //put pointer back at start
			CS_inputFinished = 1; //announce that its finished
			break;
		}
		default: // if not special case, then add it into the buffer
		{
			CS_inputBuffer[ndx] = rc;
			ndx++;
			if (ndx >= CS_buffSize) { // if for some reason the buffer is exceeded then stick it at the last one to prevent overflow
				ndx = CS_buffSize - 1;
			}
			break;
		}
		}
	}
}


void CS_getresponse(String Str_send)
{
	//send a query to current source and store response in the CS_inputBuffer

	Serial1.println(Str_send); //send query to CS

	int timeout = 0; //
	int tstart = millis();
	int tcurrent = 0;

	while (CS_inputFinished == 0 && timeout == 0)
	{
		tcurrent = millis();
		if (tcurrent - tstart > CS_timeoutlimit) // check if the timeout limit has been reached
		{
			timeout = 1;
		}
		else
		{
			CS_getmsg(); // otherwise get a new char
		}
	}

	/*
	if (timeout) // moan if it had timed out
	{
		Serial.print(CS_commerrmsg);
	}
	else
	{
		Serial.print("CS Response: "); // print output
		Serial.println(CS_inputBuffer);
	}
	*/
	CS_inputFinished = 0; // reset input finished flag

}


int CS_checkresponse(String Str_exp) {

	//compare intput string and string in input buffer
	int respflag = 0;
	/*
		Serial.print("This just in ... ");
		Serial.println(CS_inputBuffer);
		Serial.print("expected ");
		Serial.println(Str_exp);
		*/
	if (Str_exp == CS_inputBuffer)
	{
		// Serial.println("they match");
		respflag = 1;
	}
	else
	{
		// Serial.println("they dont match");
		respflag = 0;
	}
	return respflag;
}

int CS_checkresponse_num(long exp_num, long scale) {

	//compare intput number to string in input buffer - convert to numer from eng string in 1.000E+4 format
	// inputs are expected number and "scale" as amplitude in microamps
	int respflag = 0;
	/*
	   Serial.print("This just in ... ");
	   Serial.println(CS_inputBuffer);
	   */
	char* Epos = strchr(CS_inputBuffer, 'E');
	char* decstr = strtok(CS_inputBuffer, "E");
	/*
	  Serial.print("bit before E: ");
	  Serial.println(decstr);
	  Serial.print("bit after E: ");
	  Serial.println(Epos + 1);
	  */
	float decimal = atof(decstr);
	float power = atof(Epos + 1);

	/*
	  Serial.print("dec float:");
	  Serial.println(decimal);

	  Serial.print("pow float:");
	  Serial.println(power);
	  */
	float datainf = scale * decimal * pow(10, power);

	long datain = long(datainf);

	/*
	  Serial.print("Converted to a number...");
	  Serial.println(datain);
	  Serial.print("expected ");
	  Serial.println(exp_num);
	  */

	if (exp_num == datain)
	{
		// Serial.println("they match");
		respflag = 1;
	}
	else
	{
		//Serial.println("they dont match");
		respflag = 0;
	}
	return respflag;
}




