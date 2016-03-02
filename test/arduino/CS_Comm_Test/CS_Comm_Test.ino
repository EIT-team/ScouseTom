/* Code to check RS232 Communication is OK

Connect to current source and check front panel

CS should be set to baud 57600 and NL and CR (option on the far right)

front panel code just changes text

*/


#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

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

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial1.begin(57600);
  Serial.println("ScouseTom, checking CS Comm");
  
  commcheck();

  commcheck2();
  

  Serial1.println("DISP:TEXT:STAT 1");
  Serial1.println("DISP:WIND2:TEXT:STAT 1");

}

void loop() {
  // put your main code here, to run repeatedly:
  
  commcheck();
  delay(1000);
  
  commcheck2();
  delay(1000);
}



void commcheck()
{
  int goodnessflag = 0;
  Serial1.println("DISP:TEXT \"Checking Version\"");
  Serial.println("Checking CS Firmware Version as test of comms");
  CS_getresponse("SYST:VERS?");
  goodnessflag = CS_checkresponse(CS_vers);

  if (goodnessflag)
  {
    Serial.println("Comm check OK!");
    Serial1.println("DISP:WIND2:TEXT \"Comm OK!\"");
  }
  else
  {
    Serial.println("Comm check BAD!");
    Serial1.println("DISP:WIND2:TEXT \"Comm BAD!\"");
  }
}


void commcheck2()
{
  int goodnessflag = 0;
  Serial1.println("DISP:TEXT \"Checking CS ON\"");
  Serial.println("Checking CS ON as test of comms");
  CS_getresponse("OUTP:STAT?");
  goodnessflag = CS_checkresponse("0");

  if (goodnessflag)
  {
    Serial.println("Comm check OK!");
    Serial1.println("DISP:WIND2:TEXT \"Comm OK!\"");
  }
  else
  {
    Serial.println("Comm check BAD!");
    Serial1.println("DISP:WIND2:TEXT \"Comm BAD!\"");
  }
}

//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


