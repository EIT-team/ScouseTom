
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

int del = 500 * 1000; // time to delay between hgih and low


void setup() {
	// put your setup code here, to run once:
	Serial.begin(115200);
	Serial.print("ScouseTom Switch Pin Check: All Switch pins should go high and low every ");
	Serial.print(del / 1000);
	Serial.println("ms");
	Serial.println("Remember test pins are floating unless you connect them to something");
	Serial.println("If you are using daisychained boards the DIN+ and DIN- pins will not transfer across boards, as switches are not being set");
	init_pins();

}

void loop() {
	// put your main code here, to run repeatedly:

	pinslow();
	checktestpins();
	delayMicroseconds(del);
	pinshigh();
	checktestpins();
	delayMicroseconds(del);


}



//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}

void init_pins() {
	pinMode(DINp, OUTPUT);
	pinMode(DINn, OUTPUT);
	pinMode(SCLK, OUTPUT);
	pinMode(SYNC, OUTPUT);
	pinMode(RESET, OUTPUT);
	pinMode(TEST_1, INPUT);
	pinMode(TEST_2, INPUT);
}

void pinslow(){
	digitalWriteDirect(DINp, LOW);
	digitalWriteDirect(DINn, LOW);
	digitalWriteDirect(SCLK, LOW);
	digitalWriteDirect(SYNC, LOW);
	digitalWriteDirect(RESET, LOW);
}

void pinshigh(){
	digitalWriteDirect(DINp, HIGH);
	digitalWriteDirect(DINn, HIGH);
	digitalWriteDirect(SCLK, HIGH);
	digitalWriteDirect(SYNC, HIGH);
	digitalWriteDirect(RESET, HIGH);
}

void checktestpins(){
	int t1val = digitalRead(TEST_1);
	int t2val = digitalRead(TEST_2);

	Serial.print("t1: ");
	Serial.print(t1val);
	Serial.print(" t2: ");
	Serial.println(t2val);



}
