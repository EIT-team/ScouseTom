/*
Code for setting ports on 16 chn Mux ADG426 x2
This is for Kirushka
Expects Arduino Uno

*/




void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("Hello Kirushka");
  Serial.println("MAKE SURE YOU HAVE CR IN ENDINGS SELECTED");

  Serial.println("Type in EXACTLY this format: 2,3 ");

  DDRB = B00111111; //set pins to outputs - ard pins 8-13
  DDRD = DDRD | B11111100; //set pins to outputs without fucking up serial 0-7




}

void loop() {

while (Serial.available() > 0)
{

  int Mux1Val = Serial.parseInt();
  int Mux2Val = Serial.parseInt();
  if (Serial.read() == '\r') {

    Serial.print("I am going to set Mux 1: ");
    Serial.print(Mux1Val);
    Serial.print(" and Mux 2 to: ");
    Serial.println(Mux2Val);
    bool badrange = writeMux1(Mux1Val) | writeMux2(Mux2Val);

	if (badrange)
	{
		Serial.println("OUT OF RANGE");
		void initports();
	}



  }





}

}


void initmux1()
{
  PORTB = PORTB & B11000000; // init PORTB 8-13
}

void initmux2()
{
  PORTD = PORTD & B00000011; // init PORTD 0-7
}

void initports()
{
  initmux1();
  initmux2();
}


bool writeMux1(int chn)
{
  bool outofrange = 0;

  if ( (chn > 16) | (chn < 1))
  {
    outofrange =1;
    return outofrange;
  }

  initmux1();

  PORTB = PORTB | byte(chn -1);
  return outofrange;

}


bool writeMux2(int chn)
{
  bool outofrange = 0;

  if ((chn > 16) | (chn < 1))
  {
    outofrange =1;
    return outofrange;
  }

  initmux2();

  PORTD = PORTD | (byte(chn-1) << 2);
  return outofrange;

}
