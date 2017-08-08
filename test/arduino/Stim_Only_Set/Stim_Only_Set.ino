/*
Code which pulses all the trigger channels on and off in sequence to check the actichamp trigger codes
*/

#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB

int del = 100 * 1000; // time to delay between high and low in microseconds

int gap = 500 * 1000; // gap between pulses


// CHANGE HERE
int pulsegap = 998 ; // gap between pulse in milliseconds, i.e 1/freq you want

// CHANGE HERE
int pulsenum = 15; // number of pulses in train i.e duration x frequency


int pulse = pulsegap/2;

unsigned long TIME = 0;


void setup() {

	// setup PC connection
	Serial.begin(115200);
	Serial.println("ScouseTom Trigger Check: All IND pins should go high and low every 100ms");

	init_pins_ind();



}
 

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available() > 0) {
    // get incoming byte:
    char junk = Serial.read();
    Serial.println(junk);
    
    TIME = micros();
    Serial.println(TIME); 
    for (int i =0; i < pulsenum; i++)
    {
      //Serial.print("pulsenum: ");
      //Serial.println(i);
      digitalWrite(IND_STIM,HIGH);
      delay(1);
      digitalWrite(IND_STIM,LOW);
      delay(pulsegap-1);
    }
    
   
   //time = micros();
   Serial.println(micros() - TIME); 
  }

    

}






//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val){
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}


