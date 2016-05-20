/*Stuff for communication with the current source(CS), as well as incrementing channel and frequency during injections  */


boolean CS_CheckOn()
{
	CS_getresponse("OUTP:STAT?", CS_timeoutlimit);
	boolean ison = CS_checkresponse("1");
	return ison;
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


boolean CS_stop() //start current injection
{
	boolean goodnessflag = 1; //communication ok flag
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

	CS_getresponse("SOUR:WAVE:FREQ?", CS_timeoutlimit);
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

	CS_getresponse("SOUR:WAVE:AMPL?", CS_timeoutlimit); // check amp set ok
	goodnessflag = CS_checkresponse_num(Amp, sc_micro); // amp in uA so set scale to sc_micro

	/*
	if (goodnessflag == 0) // if bad comm then return and complain
	{
	Serial.print(CS_commerrmsg);
	}
	*/
	return goodnessflag;
}





int CS_init() // initialise current source - set sin and compliance and turn on pmark too
{
	int goodnessflag = 0; //communication ok flag

	//check comm to CS is ok by checking response to version num
	CS_getresponse("SYST:VERS?", CS_timeoutlimit);
	goodnessflag = CS_checkresponse(CS_vers);

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}

	//Serial.print("things ok");


	//now comm is ok lets make sure the current source is off

	CS_getresponse("OUTP:STAT?", CS_timeoutlimit);
	goodnessflag = CS_checkresponse("0");

	if (goodnessflag == 0)
	{
		goodnessflag = CS_stop();
	}

	//Do front panel stuffs
	Serial1.println("DISP:TEXT:STAT 1"); //turn on text front panel
	Serial1.println("DISP:WIND2:TEXT:STAT 1"); //turn on text front panel - smaller disp

	CS_Disp(MSG_Init);
	CS_Disp_Wind2(MSG_Init_2);

	// turn on phase marker as only need to do this once

	Serial1.println("SOUR:WAVE:PMARK:STAT 1");

	CS_getresponse("SOUR:WAVE:PMARK:STAT?", CS_timeoutlimit);
	goodnessflag = CS_checkresponse("1");

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}

	// Set wave type as we only need to do this once

	Serial1.println("SOUR:WAVE:FUNC SIN");
	CS_getresponse("SOUR:WAVE:FUNC?", CS_timeoutlimit);
	goodnessflag = CS_checkresponse("SIN");

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}


	//set the range stuff back to defaults as we only need FIXED during multifreq

	goodnessflag = CS_AutoRangeOn();

	if (goodnessflag == 0) // if bad comm then return and complain
	{
		//Serial.print(CS_commerrmsg);
		return goodnessflag;
	}


	// Set compliance to default value
	goodnessflag = CS_SetCompliance(Compliance);

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
	sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"Elec Pair %d of %d\"", Pair, Elecs); //make string to send to CS
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





void CS_Disp(String Textstr) 
{
	/*
	Display text on front panel of the current source.
	Truncates if longer than 20
	This uses the arduino String format which I dont think is necessary 
	*/
	
	String Part1 = "DISP:TEXT \"";
	String Part2 = "\"";

	//if string is bigger than 20 characters then truncate

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

boolean CS_getresponse(String Str_send, int timeoutlimit)
{
	//send a query to current source and store response in the CS_inputBuffer

	Serial1.println(Str_send); //send query to CS

	boolean timeout = 0; //flag for whether we have timed out
	boolean readok = 1; //was message read ok?

	int tstart = millis();
	int tcurrent = 0;

	while (CS_inputFinished == 0 && timeout == 0)
	{
		tcurrent = millis();
		if (tcurrent - tstart > timeoutlimit) // check if the timeout limit has been reached
		{
			timeout = 1;
			readok = 0;
		}
		else
		{
			CS_getmsg(); // otherwise get a new char
		}
	}


	if (timeout) // moan if it had timed out
	{
		//Serial.println("timeoutcstalk");
		sprintf(CS_outputBuffer, "<%s,%d>", CS_commtimeoutmsg, timeoutlimit);
		Serial.print(CS_outputBuffer);
	}
	else
	{
		/*Serial.print("CS Response: "); // print output
		Serial.println(CS_inputBuffer);
		Serial.print("this took: ");
		Serial.println(tcurrent - tstart);*/
	}

	CS_inputFinished = 0; // reset input finished flag
	return readok;

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
	double decimal = atof(decstr);
	double power = atof(Epos + 1);
	/*
	  Serial.print("dec float:");
	  Serial.println(decimal,4);

	  Serial.print("pow float:");
	  Serial.println(power,4);
  */
	double datainf = scale * decimal * pow(10, power);
   /* 
    Serial.print("Converted to FP...");
    Serial.println(datainf,4);
*/
	long datain = round(datainf);

	/*
	  Serial.print("Converted to a int...");
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



int CS_AutoRangeOn()
{
	//sets the default range WAVE finding to be ON! This is what we want it to be for single freq AND for general use of the CS

	int RangeGoodness = 0;

	//first set the CURR:RANG value to default - this is so we can set the change manually - even if it is overwritten by SOUR:WAVE:RANG BEST


	sprintf(CS_outputBuffer, "SOUR:CURR:RANG:AUTO 0"); //
	Serial1.println(CS_outputBuffer); // send to CS

	CS_getresponse("SOUR:CURR:RANG:AUTO?", CS_timeoutlimit); // check compliance is set ok set ok
	RangeGoodness = CS_checkresponse("0");

	if (!RangeGoodness)
	{
		Serial.print(CS_rangeseterr);
		return RangeGoodness;
	}

	sprintf(CS_outputBuffer, "SOUR:WAVE:RANG BEST"); //
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	CS_getresponse("SOUR:WAVE:RANG?", CS_timeoutlimit); // check compliance is set ok set ok
	RangeGoodness = CS_checkresponse("BEST");

	if (!RangeGoodness)
	{
		Serial.print(CS_rangeseterr);

	}
	return RangeGoodness;

}


boolean CS_AutoRangeOff()
{
	//sets the default range finding to be OFF!!!! This is what we want it to be for multifreq

	boolean RangeGoodness = 0;

	sprintf(CS_outputBuffer, "SOUR:CURR:RANG:AUTO 0"); //
	Serial1.println(CS_outputBuffer); // send to CS

	CS_getresponse("SOUR:CURR:RANG:AUTO?", CS_timeoutlimit); // check compliance is set ok set ok
	RangeGoodness = CS_checkresponse("0");

	if (!RangeGoodness)
	{
		Serial.print(CS_rangeseterr);
		return RangeGoodness;
	}

	sprintf(CS_outputBuffer, "SOUR:WAVE:RANG FIX"); //
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	CS_getresponse("SOUR:WAVE:RANG?", CS_timeoutlimit); // check compliance is set ok set ok
	RangeGoodness = CS_checkresponse("FIX");

	if (!RangeGoodness)
	{
		Serial.print(CS_rangeseterr);

	}
	return RangeGoodness;

}


void CS_serialFlush()
/*
Function to flush serial input coming from current source - leftover stuff in the buffer is likely the cause of some errors with unexpected things being in the buffer
*/
{

	int timeoutmillis = 300; //dont run forever! Probably unnecessary but I get scared about while loops without a timeout!

	boolean timeout = 0;

	int tstart = millis();
	int tcurrent = 0;

	while (Serial1.available() > 0 && timeout == 0)
	{
		tcurrent = millis();
		if (tcurrent - tstart > timeoutmillis) // check if the timeout limit has been reached
		{
			timeout = 1;

		}
		else
		{
			char junk = Serial1.read();
		}
	}


}

boolean CS_SetCompliance(int ComplianceValue)
{
	/*
	Set the compliance of the current source to a given mV value, and check it was set ok

	Compliance in 10mV increments so round up to nearest 10

	*/

	int CompToSet = ComplianceValue / 10;
	if (ComplianceValue % 10)
	{
		CompToSet++;
	}

	CompToSet *= 10;


	boolean SetOk = 0;

	sprintf(CS_outputBuffer, "SOUR:CURR:COMP %dE-3", CompToSet); //set in mV so have to use E-3
	Serial1.println(CS_outputBuffer); // send to CS
									  //Serial.println(CS_outputBuffer); //to pc for debug

	SetOk = CS_getresponse("SOUR:CURR:COMP?", CS_timeoutlimit); // check compliance is set ok
	if (SetOk) //if no error on CS comm
	{
		SetOk = CS_checkresponse_num(CompToSet, sc_milli); // Compliance in mV so set scale to sc_milli
	}
	return SetOk;
}