/* Code to check compliance status of current source

Compliance status is checked every 10ms for 10S
Connect current source across a resistor and disconnect and reconnect to see compliance status changed 

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
const long sc_milli = 1000; // scale for milliseconds
char CS_outputBuffer[50]; // char array buffer for output strings to CS
int CS_commgoodness = 1; // flag for current communication goodness


long Amp = 100;
long Freq = 1000;

int CompOK = 0;

int ComplianceSet = 1900; // compliance in MV



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial1.begin(57600);
  Serial.println("ScouseTom, checking compliance status - 0 is good, 1 is bad");
  Serial.println("Connect CS across a resistor and disconnect and reconnect to see compliance status change");
 

  Serial.print("Setting Compliance to ");
  Serial.print(ComplianceSet);
  Serial.println("mV");
  

  int setok = 0;

  setok=CS_SetCompliance(ComplianceSet);

  if (setok)
  {

	  Serial.println("Compliance set ok");
  }

  else
  {
	  Serial.println("Compliance set WRONG");
  }



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

	  if (i > 1 && !(i % 20))
	  {
		  Serial.println("");
	  }

  }

  Serial.println("Stopping Current source. Reset Ard if you wanna try again");
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
	/*Check the compliance status 
	Current Source Sends 16 bit register of status - we only want the 4th LSB which relates to compliance
	This bit is 0 for OK, and 1 for bad

	*/


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

int CS_SetCompliance(int Compliance)
{

	int SetOk = 0;

	sprintf(CS_outputBuffer, "SOUR:CURR:COMP %dE-3", Compliance); //set in mV so have to use E-3
	Serial1.println(CS_outputBuffer); // send to CS
	//Serial.println(CS_outputBuffer); //to pc for debug

	CS_getresponse("SOUR:CURR:COMP?"); // check compliance is set ok set ok
	 SetOk = CS_checkresponse_num(Compliance, sc_milli); // Compliance in mV so set scale to sc_milli

}









//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


