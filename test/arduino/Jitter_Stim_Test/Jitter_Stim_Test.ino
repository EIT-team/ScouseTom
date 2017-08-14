
const int strt = 7;
const int ind = 47;
const int intrpin = 25; // pin to detect change in state

void InterIn()
{
	digitalWriteDirect(ind, 1);
	digitalWriteDirect(ind, 0);
}

void setup() {
	Serial.begin(115200);

	pinMode(strt, OUTPUT);
	digitalWrite(strt, 0);
	pinMode(ind, OUTPUT);
	digitalWrite(ind,0);
	pinMode(intrpin, INPUT);

	attachInterrupt(intrpin, InterIn, FALLING);

}

void loop() {

  int x = micros();

    char c = '#'; //placeholder value 

  //read serial byte if one is available
  if (Serial.available() > 0)
  {

    c = Serial.read();
    Serial.print(c);
  }
  
  delayMicroseconds(1);
  
}

//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
	if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
	else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}

