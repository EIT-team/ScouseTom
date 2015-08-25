/**
* Start current injection
*/
int CS_start() 
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

/**
* Stop current injection
*/
int CS_stop() 
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

/**
* Send amplitude and frequency to the current source NO CHECKING as too slow
* all potential settings are checked during initialisation to make sure no errors
*/
void CS_sendsettings(long Amp, long Freq)
{
	sprintf(CS_outputBuffer, "SOUR:WAVE:FREQ %d", Freq); //make string to send to CS
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	sprintf(CS_outputBuffer, "SOUR:WAVE:AMPL %dE-6", Amp); //make amp setting string in microamps so have to use E-6
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

}


/**
* Initialise current source - set sin and compliance and turn on pmark too
*/
int CS_init() 
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

	//CS_Disp("Lets do some EIT");
	//CS_Disp_Wind2("Brink of immortality");

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

