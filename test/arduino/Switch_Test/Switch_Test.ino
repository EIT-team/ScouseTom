/*

Code to test switch network only - connected to PCB

User enters the channel they want to connect to the sink pin (default 2) 

Useful to just check switch network is working ok with a multimeter

CHANGE TERMINATOR TO NEWLINE IN SERIAL MONITOR


Jimmy 2014/2015

*/

//#include "BreadboardPins.h" // Pins for breadboard version - used by kirill and me (testing)
#include "PCBPins.h" // Pins for PCB version - these have been altered to more logical layout for PCB


int sinkpin = 2; // pin that the sink is always connected to

int chnmax=40; // maximum number of channels


// this writes the digital pin faster for due - only 2 clock cycles!
//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}



void setup() {


  Serial.begin(115200);

  Serial.println("hello there!");
  Serial.println("ScouseTom Switch Test");
  Serial.print("The sink pin is : ");
  Serial.println(sinkpin);
  Serial.println("Make sure you have changed terminator to newline :)");

  init_pins();
  SwitchesPwrOn();

}

void loop() {
  // put your main code here, to run repeatedly:

  while (Serial.available() > 0) {
    int c = Serial.parseInt();

    if (Serial.read() == '\n') {
      //Serial.println(c);

      if (c < chnmax)
      {

        Serial.print("Setting switches to source chn: ");
        Serial.print(c);
		Serial.print(" sink chn: ");
		Serial.println(sinkpin);
        programswitches(c, sinkpin); //program dem switches
		digitalWriteDirect(SYNC, HIGH); // switch dat!


      }
      else
      {
      Serial.println("too high channel number");
      }
      
    }
  }



}
