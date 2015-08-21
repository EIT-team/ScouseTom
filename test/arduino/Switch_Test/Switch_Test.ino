/*

Code to test switch network only - connected to PCB

User enters the channel they want to connect to the sink pin (default 2) and source pin (def 4)

Useful to just check switch network is working ok with a multimeter

CHANGE TERMINATOR TO NEWLINE IN SERIAL MONITOR


Jimmy 2014/2015

*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB


int sinkpin = 2; // pin that the sink is always connected to
int sourcepin = 4;

const int chnmax = 99; // maximum number of channels

const int NumBoard = 2;

const int TotalPins = 40 * NumBoard;



// this writes the digital pin faster for due - only 2 clock cycles!
//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}



void setup() {


	Serial.begin(115200);

	Serial.println("Hello There! This is a ScouseTom Switch Test");
	Serial.print("The number of boards in the daisy chain is : ");
	Serial.println(NumBoard);
	Serial.print("The source pin is : ");
	Serial.println(sourcepin);
	Serial.print("The sink pin is : ");
	Serial.println(sinkpin);
	Serial.println("Make sure you have changed terminator to newline :)");

	Serial.println("The switches will be powered on, source and sink pins opened, then turned off");
	Serial.println("This is repeated before allowing the user to select a pin");

	delay(1000);

	init_pins();

	Serial.println("Pins initialised, should ALL be closed now");
	delay(1000);


	Serial.println("on");
	SwitchesPwrOn();
	delay(100);
	programswitches(sourcepin, sinkpin, TotalPins);
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(500);
	Serial.println("off");
	SwitchesPwrOff();
	delay(500);
	Serial.println("on");
	SwitchesPwrOn();

	delay(100);
	programswitches(sourcepin, sinkpin, TotalPins);
	digitalWriteDirect(SYNC, HIGH); // switch dat!
	delay(500);
	Serial.println("off");
	SwitchesPwrOff();
	SwitchesPwrOn();
	Serial.println("waiting for input - < 100 sets source > 100 sets sink - for pins 1-99");
	Serial.println("i.e. 32 sets source to pin 32, 132 sets sink to 32");

}

void loop() {
	// put your main code here, to run repeatedly:

	while (Serial.available() > 0) {
		int c = Serial.parseInt();

		if (Serial.read() == '\n') {
			//Serial.println(c);

			if (c < chnmax)
			{
				sourcepin = c;

			}
			else
			{
				c = c - 100;
				if (c < chnmax)
				{
					sinkpin = c;
				}
				else
				{
					Serial.println("too high channel number");
				}
			}

			Serial.print("Setting switches to source chn: ");
			Serial.print(sourcepin);
			Serial.print(" sink chn: ");
			Serial.println(sinkpin);
			programswitches(sourcepin, sinkpin,TotalPins); //program dem switches
			digitalWriteDirect(SYNC, HIGH); // switch dat!


		}
	}



}
