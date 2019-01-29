int indPin = 3;
int interruptPin = 2;

int val = 1;

void setup() {
  // put your setup code here, to run once:
  pinMode(indPin, OUTPUT);
  pinMode(interruptPin, INPUT);

  attachInterrupt(digitalPinToInterrupt(interruptPin), STIM_CNG, RISING);
  digitalWrite(indPin, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:

}

void STIM_CNG()
{
  delayMicroseconds(10000);
  digitalWrite(indPin, HIGH);
  delayMicroseconds(5000);
  //delay(1000);
  digitalWrite(indPin, LOW);
  
}

