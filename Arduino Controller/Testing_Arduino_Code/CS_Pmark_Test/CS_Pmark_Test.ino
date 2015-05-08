/*

This code checks if the phase marker is detected correctly from the current source

CS and Pmark should be connected

Code copied from ScouseTom_Control 01/05/15 - turns on current source at negligible current and checks if ISR_PMAR_TEST has run a few times


*/


// Current Source Interface Stuff
const byte CS_buffSize = 40; //size of char buffer to recieve from current source
char CS_inputBuffer[CS_buffSize]; //char buffer to store output from current source
int CS_inputFinished = 0; //flag for complete response from current source
String CS_vers = "1999.0"; //Current source version number - used to check communication with current source
int LongDispWind = 0; // flag for if we have more than 3 digit length of repeats/freqs/prt so that we use the shorter text on the bottom window

char CS_settingserrmsg[] = "<!S>";
char CS_commerrmsg[] = "<!E>";
char CS_pmarkerrmsg[] = "<!P>";

char CS_commokmsg[] = "<+OK>";
char CS_finishedmsg[] = "<+Fin>";

int CS_timeoutlimit = 1000; // timeout in milliseconds for response from current source
const long sc_micro = 1000000; // scale for micro
char CS_outputBuffer[50]; // char array buffer for output strings to CS
int CS_commgoodness = 1; // flag for current communication goodness




int PMARK_TEST_FLAG = 0;
int INTR_PMARK = 25;

void ISR_PMARK_TEST() // ISR for testing PMARK in, set variable high when called
{
  PMARK_TEST_FLAG++; //increment this counter
  //Serial.print("s"); //for debugging
}





void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("ScouseTom Pmark Test...");

  Serial1.begin(57600);
  Serial1.println("DISP:TEXT \"P_Mark Test\"");

  int commok = 0;


  commok = CS_init();

  if (commok)
  {
    Serial.println("CS COMM OK");
  }
  else
  {
    Serial.println("CS COMM BAD");
  }



  int PMCHK = 0;

  Serial.print("Checking Pmark is working....");

  PMCHK = CheckPmark();

  if (PMCHK)
  {
    Serial.println("YEAH IT IS! WOO!:)");
    Serial1.println("DISP:TEXT \"P_Mark OK\"");
  }
  else
  {
    Serial.println("NAH ITS FUCKED MATE!:(");
    Serial1.println("DISP:TEXT \"P_Mark BAD\"");

  }
}

void loop() {
  // put your main code here, to run repeatedly:

}






int CheckPmark()
{
  /*Check that the Pmark is working correctly - otherwise stimulation wont work

  turn on injection at a low amp and freq and see if the PMARK_TEST variable has been incremented sufficiently

  the interupt always runs once - so have to check the number of times is more than that! 100ms at 10khz should be 1000, but just more than 500

  */

  PMARK_TEST_FLAG = 0;
  int CheckOK = 0;

  CS_sendsettings(1, 10000); // send settings to current source
  //Serial.println("starting pmark check");

  CS_start();

  attachInterrupt(INTR_PMARK, ISR_PMARK_TEST, FALLING); // attach the interupt to the pmark pin -

  delay(1000);

  detachInterrupt(INTR_PMARK);
  CS_stop();
  //Serial.println("pmark check done");


  if (PMARK_TEST_FLAG > 50)
  {
    CheckOK = 1;
    //Serial.println("pmark ok");
  }
  else
  {
    CheckOK = 0;
    //Serial.println("pmark bad");
  }

  return CheckOK;
}







