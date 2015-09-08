/*
 * Stuff for communication with the current source(CS), 
 * as well as incrementing channel and frequency 
 * during injections.                                    
 * 
 */


//! \brief setup next channel for multi frequency injection. 
void CS_next_chn() {
  //Serial.println("Changing channel, iPrt is CURRENTLY"); //debug info
  //Serial.println(iPrt);
  //increment prt counter
  iPrt++;
  // if complete protocol done then reset and increment repetiton counter
  if (iPrt == NumInj)	{
    iPrt = 0;
    iRep++;
  }
  // if we arent finished then shuffle and send new info to pc
  if (iRep != NumRep)	{
    //shuffle freq order
    shuffle(FreqOrder, NumFreq);
    //reset frequency counter
    iFreq = 0;
    //send info to PC
    PC_sendupdate();
    indpins_pulse(0, 0, 1, 0); // indicate we are changing prt now
  }
}


//! \brief set up next frequency of injection.
void CS_next_freq() 
{
  /*long tstart = 0;
    long tset = 0;
    long tdisp = 0;
    long tsw = 0;
    long ttot = 0;
   */
  // Stop current source - changing amp and freq may mean we 
  // set current too high for the new/old frequency
  CS_stop();
  // indicate that this freq inj is done
  indpins_pulse(0, 0, 0, 1); 
  //tstart = micros();
  // check if we arent finished - do nothing if we are finished 
  // (this is to prevent an eroneous short injection at the end
  if (iRep != NumRep)   {
    //Serial.println("changing frequency"); //debug info
    //! get the new frequency from the shuffled freqorder array
    curFreq = FreqOrder[iFreq]; 
    //initialise stimulator trigger if we are in stim mode

    if (StimMode)     {
      stim_init(Freq[curFreq]);
      Stimflag = 1;
    }

    /*Serial.println(curFreq);
      Serial.println(iFreq);
      sprintf(PC_outputBuffer, "Setting Amp %duA and Freq %dHz", Amp[curFreq], Freq[curFreq]);
      Serial.println(PC_outputBuffer);*/
    // set the new amp and freq in the current source, with no error checking for speed
    CS_sendsettings(Amp[curFreq], Freq[curFreq]); 
    //tset = micros();

    /*Serial.print("Channels I am about to program: ");
      Serial.print(Injection[iPrt][0]);
      Serial.print(" and ");
      Serial.println(Injection[iPrt][1]);*/
    // Switching stuff moved to *after* CS start to limit 
    // the amount of time wasted waiting for CS to actually 
    // start in delay routine below.
    StartTime_CS = micros();
    CS_start(); //start current source


    programswitches(Injection[iPrt][0], Injection[iPrt][1], TotalPins); //programm the switches
    SwitchChn(); //! open switches to CS
    //tsw = micros();
    // write the front panel of the CS
    CS_Disp_multi(Amp[iFreq], Freq[iFreq], iFreq + 1, NumFreq, iPrt + 1, NumInj, iRep + 1, NumRep);    
    //tdisp = micros();
    iFreq++; //increment the frequency counter (as all has gone well)

    // delay the start of injection to give the current source time to get ready
    StartElapsed_CS = micros() - StartTime_CS;
    if (StartElapsed_CS < (StartDelay_CS - 10))
    {
      delayMicroseconds(StartDelay_CS - StartElapsed_CS);
    }
    lastFreqSwitch = micros(); // record time we switches freq
    indpins_pulse(0, 0, 0, 1); // send new freq pulse
  }
  /*ttot = micros();
    sprintf(PC_outputBuffer, "Timing: %d set, %d disp, %d tsw, %d tot", tset - tstart, tdisp - tstart, tsw - tstart, ttot - tstart);
    Serial.println(PC_outputBuffer);
   */
}



//! \brief Start current injection
//! \details setting goonessflag = 1
int CS_start() {
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


//! \brief Stop current injection. 
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


//! \brief send amplitude and frequency to the current source WITH CHECK
//! \param[in] Amp amplitude
//! \param[in] Freq frequency 
//! \param[out] return communication flag: 1-Successful, 0-Failed.
int CS_sendsettings_check(long Amp, long Freq)
{
  int goodnessflag = 0;
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


//! \brief send amplitude and frequency to CS
//! \details send amplitude and frequency to the current source NO 
//! CHECKING as too slow.  All potential settings are checked 
//! during initialisation to make sure no errors.
//! \param[in] Amp Amplitude
//! \param[in] Freq Frequency
void CS_sendsettings(long Amp, long Freq)
{
  sprintf(CS_outputBuffer, "SOUR:WAVE:FREQ %d", Freq); //make string to send to CS
  Serial1.println(CS_outputBuffer); // send to CS
  //Serial.println(CS_outputBuffer); //to pc for debug

  sprintf(CS_outputBuffer, "SOUR:WAVE:AMPL %dE-6", Amp); //make amp setting string in microamps so have to use E-6
  Serial1.println(CS_outputBuffer); // send to CS
  //Serial.println(CS_outputBuffer); //to pc for debug

}

//! \brief initialise current source - set sin and compliance and 
//! turn on pmark too.
//! \param[out] return int goodnessflag: 0 Successful; 
int CS_init(){
  int goodnessflag = 0; //communication ok flag

  //!check comm to CS is ok by checking response to version num
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
  Serial1.println("DISP:TEXT:STAT 1"); // turn on text front panel
  Serial1.println("DISP:WIND2:TEXT:STAT 1"); // turn on text front panel - smaller disp
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
  goodnessflag = CS_SetCompliance(Compliance);
  return goodnessflag;
}


//! \brief display text for singlefreqmode
void CS_Disp_single(long Amp, long Freq, int Rep, int Repeats) 
{
  sprintf(CS_outputBuffer, "DISP:WIND2:TEXT \"%duA:%dHz:Rep %d of %d\"", Amp, Freq, Rep, Repeats); //make string to send to CS
  Serial1.println(CS_outputBuffer); // send to CS
  //Serial.println(CS_outputBuffer); // debug to PC
}


//! \brief display text for singlefreqmode
void CS_Disp_Contact(int Pair, int Elecs) 
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


//! \brief display text on front panel.
void CS_Disp(String Textstr) 
{
  String Part1 = "DISP:TEXT \"";
  String Part2 = "\"";
  if (Textstr.length() > 20)
  {
    Textstr = Textstr.substring(0, 19);
  }

  Serial1.println(Part1 + Textstr + Part2);
}

//! \brief display text on front panel - smaller lower window
void CS_Disp_Wind2(String Textstr){
  String Part1 = "DISP:WIND2:TEXT \"";
  String Part2 = "\"";
  if (Textstr.length() > 30)
  {
    Textstr = Textstr.substring(0, 29); //this isnt correct
  }
  Serial1.println(Part1 + Textstr + Part2);
}


//! \brief get one message from current source - 
//! \details up until a line feed a char at a 
//! time \n. store chars in CS_inputBuffer with null terminator
void CS_getmsg() {
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


//! \brief send a query to current source and store response in the CS_inputBuffer
void CS_getresponse(String Str_send)
{

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


//! \brief compare intput string and string in input buffer
int CS_checkresponse(String Str_exp) {
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


//! \details compare intput number to string in input buffer - 
//!   convert to numer from eng string in 1.000E+4 format
//! \param[in] exp_num expected number 
//! \param[in] scale amplitude in microamps
int CS_checkresponse_num(long exp_num, long scale) {

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


//! \brief Check the compliance status.
//! \details Current Source Sends 16 bit register of status - we 
//! only want the 4th LSB which relates to compliance. 
//! \param[out] return 0 for OK, 1 for bad which is what we want.
boolean CS_CheckCompliance()
{
  //read event register
  CS_getresponse("STAT:MEAS:COND?");
  // forth bit is complicance status 
  //Serial.print("CS response is : ");
  //Serial.println(CS_inputBuffer);
  int MeasRegister = atoi(CS_inputBuffer);
  //Serial.print("As an integer that is: ");
  //Serial.println(MeasRegister);
  boolean ComplianceFlag = bitRead(MeasRegister, 3);
  //Serial.print("Therefore ComplianceFlag is: ");
  //Serial.println(ComplianceFlag);
  return ComplianceFlag;
}


//! \brief Set the compliance of the current source to a given 
//! mV value, and check it was set ok.
//! \param[out] return 0-OK, 1-failed
int CS_SetCompliance(int Compliance)
{
  int SetOk = 0;
  sprintf(CS_outputBuffer, "SOUR:CURR:COMP %dE-3", Compliance); //set in mV so have to use E-3
  Serial1.println(CS_outputBuffer); // send to CS
  //Serial.println(CS_outputBuffer); //to pc for debug
  CS_getresponse("SOUR:CURR:COMP?"); // check compliance is set ok set ok
  SetOk = CS_checkresponse_num(Compliance, sc_milli); // Compliance in mV so set scale to sc_milli
  return SetOk;
}
