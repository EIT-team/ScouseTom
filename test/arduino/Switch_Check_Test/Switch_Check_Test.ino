


const int NumBoard = 2;
const int TotalPins = 40 * NumBoard;


#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB


void setup() {
  // put your setup code here, to run once:
	Serial.begin(115200);
	Serial.println("ScouseTom Switch Checker: This will run the routines to check the switches are OK");
	Serial.print("The number of boards in the daisy chain is : ");
	Serial.println(NumBoard);
	Serial.println("First the power is checked via TEST_1 Pin");
	Serial.println("Then the test channel on the +ve and -ve sides are run");

	init_pins();

	Serial.println("Turning Switches on");
	SwitchesPwrOn();

	Serial.println("Running PWR Check");
	int PWROK = 0;

	PWROK = SwitchCheckPWR();

	if (PWROK)
	{
		Serial.println("Switches Power ok! :)");
	}
	else
	{
		Serial.println("Switches Power Not working! :(");
	}

	for (int iBoard = 1; iBoard <= NumBoard; iBoard++)
	{
		Serial.print("Checking Switching on Board ");
		Serial.print(iBoard);
		Serial.println("...");

		int SwitchOK = 0;

		SwitchOK = SwitchCheckOpen(iBoard);

		if (SwitchOK)
		{
			Serial.println("Switching OK! WOOP!!! ");
		}
		else
		{
			Serial.println("Switching no workie B=====D~~~~~~ (.Y.)");
		}
	}

}

void loop() {
  // put your main code here, to run repeatedly:

}


// this writes the digital pin faster for due - only 2 clock cycles!
//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}