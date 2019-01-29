int indPin = 3;
int triggerPin = 4;
long currentMicros = 0;
long lastStimTrigger = 0;
long StimTriggerTime = 1000000; //(1/freq) that you want in microseconds,  i.e. when 1000000 == stimulation at 1Hz


int val = 1;

void setup() {
  // put your setup code here, to run once:
  pinMode(indPin, OUTPUT);
  pinMode(triggerPin, OUTPUT);
  digitalWrite(indPin, LOW);
}


void loop()
{
   currentMicros = micros();
  if ((currentMicros - lastStimTrigger) > StimTriggerTime)
  { 
      digitalWrite(triggerPin, HIGH);
      delayMicroseconds(500);
      digitalWrite(triggerPin, LOW);
      delayMicroseconds(10000);
      digitalWrite(indPin, HIGH);
      delayMicroseconds(5000);
      //delay(1000);
       digitalWrite(indPin, LOW);
       lastStimTrigger = currentMicros;
}
  
}

