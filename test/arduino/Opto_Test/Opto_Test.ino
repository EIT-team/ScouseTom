/*

Code to test optocouplers are ok - connected to PCB



Jimmy 2014/2015

*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB



// this writes the digital pin faster for due - only 2 clock cycles!
//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}



void setup() {


  Serial.begin(115200);

  Serial.println("hello there!");
  Serial.println("ScouseTom Opto Test: All opto couplers going up and down!");


  init_pins();
  SwitchesPwrOn();
  	digitalWriteDirect(DINp, LOW);
	digitalWriteDirect(DINn, LOW);
	digitalWriteDirect(SCLK, LOW);
	digitalWriteDirect(SYNC, LOW);
	digitalWriteDirect(RESET, LOW);

}

void loop() {
  // put your main code here, to run repeatedly:
  
  	digitalWriteDirect(DINp, LOW);
	digitalWriteDirect(DINn, LOW);
	digitalWriteDirect(SCLK, LOW);
	digitalWriteDirect(SYNC, LOW);
	//digitalWriteDirect(RESET, LOW);

delay(100);

  	digitalWriteDirect(DINp, HIGH);
	digitalWriteDirect(DINn, HIGH);
	digitalWriteDirect(SCLK, HIGH);
	digitalWriteDirect(SYNC, HIGH);
	//digitalWriteDirect(RESET, HIGH);
  
  delay(100);
  

  }



