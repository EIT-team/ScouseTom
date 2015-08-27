/*Stuff for communication with the current source, as well as incrementing channel and frequency during injections  */



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
	
	  Serial.print("This just in ... ");
	  Serial.println(CS_inputBuffer);
	  Serial.print("expected ");
	  Serial.println(Str_exp);
	 
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

