/* Code to check compliance status 

*/


//#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

#include "CS_comm.h"

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


long Amp = 100;
long Freq = 1000;

int CompOK = 0;



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial1.begin(57600);
  Serial.println("ScouseTom, checking compliance status");
  Serial.println("Sending settings ");


  CS_sendsettings_check(Amp, Freq);

  //CompOK = CS_CheckCompliance();

  //Serial.print("Complicance before starting is : ");
  //Serial.println(CompOK);


//delay(2000);
  CS_start();

//delay(2000);

  CompOK = CS_CheckCompliance();

  //Serial.print("Complicance after starting is : ");
  //Serial.println(CompOK);

  int elapsedtotal = 0;
  int startt = 0;
  int endt = 0;


//delay(2000);
  for (int i = 0; i < 1000; i++)
  {
	  //delay(5000);
	  delay(10);

	  startt = micros();
	  CompOK = CS_CheckCompliance();
	  endt = micros();

	  elapsedtotal += (endt - startt);


	  //Serial.print("Complicance Status is now: ");
	  Serial.print(CompOK);
  }

  Serial.println("Stopping CUrrent source. Reset Ard if you wanna try again");
  CS_stop();

  Serial.print("Time in us elapsed on average was: ");
  Serial.println(elapsedtotal/1000);
  //Serial.print("Time per check :")


}

void loop() {
  // put your main code here, to run repeatedly:


}


int CS_CheckCompliance()
{
	//check the compliance status 


	//Serial1.println("*CLS");

	//read event register
	CS_getresponse("STAT:MEAS:COND?");

	// forth bit is complicance status 

	//Serial.print("CS response is : ");
	//Serial.println(CS_inputBuffer);

	int MeasRegister = atoi(CS_inputBuffer);

	//Serial.print("As an integer that is: ");
	//Serial.println(MeasRegister);

	int ComplianceFlag = bitRead(MeasRegister, 3);

	//Serial.print("Therefore ComplianceFlag is: ");
	//Serial.println(ComplianceFlag);

	return ComplianceFlag;


}








//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


