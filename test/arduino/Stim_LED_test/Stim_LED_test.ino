/* Code to check that stimulation with LED is working
*/

#include "PCBPins.h" //Pins for PCB version

int PW = 50000; // pulse width in us
//int Duration = 10*
int StimTriggerTime = 1000000; //time between pulses, in uS
int lastStimTrigger = 0;
int currentMicros = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("Hello! Testing ScouseTom LED STIM now");
  
  pinMode(IND_STIM, OUTPUT);
  digitalWriteDirect(IND_STIM, LOW);
  
  Serial.println("Setup finished");

}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.println("In loop");
  currentMicros = micros();
  
  if ((currentMicros - lastStimTrigger) > StimTriggerTime)
  {
    Serial.println("Writing Pin High");
    digitalWriteDirect(IND_STIM, HIGH);
    delayMicroseconds(PW);
    digitalWriteDirect(IND_STIM, LOW);
    Serial.println("Writing Pin Low");
    lastStimTrigger = currentMicros;
  }
  
}


//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}

