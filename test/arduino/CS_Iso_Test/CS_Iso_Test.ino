/*

Code to test the CS ISO

Two output pins TX (from serial1) and CS_EXTRA are pulses high and low, and the values of RX and PMARK are read


*/

#include "PCBPins.h"

//these are not set anywhere else as they are part of the Serial1 object 
const int rxchn = 19;
const int txchn = 18;

const int del = 500 * 1000; // time to delay between high and low on, microseconds


void setup() {
	// put your setup code here, to run once:

	Serial.begin(115200);
	Serial.println("ScouseTom ISO Check: TX and CS_EXTRA (???) should go high and low");
	Serial.println("Change voltage on RX and PMARK to 0 and 3.3v to test the inputs");

	pinMode(rxchn, INPUT);
	pinMode(txchn, OUTPUT);
	pinMode(INTR_PMARK, INPUT);
	pinMode(CS_EXTRA, OUTPUT);

	pinlow();


}

void loop() {
	// put your main code here, to run repeatedly:

	pinlow();
	delayMicroseconds(del);
	checkpins();
	
	pinhigh(); 
	delayMicroseconds(del);
	checkpins();

}



void pinhigh() {
	digitalWriteDirect(txchn, HIGH);
	digitalWriteDirect(CS_EXTRA, HIGH);
}

void pinlow() {
	digitalWriteDirect(txchn, LOW);
	digitalWriteDirect(CS_EXTRA, LOW);
}

void checkpins(){
	int rxval = digitalRead(rxchn);
	int pmarkval = digitalRead(INTR_PMARK);

	Serial.print("rx: ");
	Serial.print(rxval);
	Serial.print(" pmrk: ");
	Serial.println(pmarkval);



}











//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}