void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("hello");

  DDRB = B11111111; //set pins to outputs - ard pins 8-13
  DDRD = DDRD | B11111100; //set pins to outputs without fucking up serial 0-7

}

void loop() {
// put your main code here, to run repeatedly:

// PORTB = B00000000; // init PORTB 8-13
// PORTD = PORTD & B00000011; // init PORTD 0-7

//initports();
writeMux1(2);
writeMux2(2);
delay(10);
// initports();
writeMux1(3);
writeMux2(3);
delay(10);
// initports();
writeMux1(5);
writeMux2(5);
delay(10);
// initports();
writeMux1(9);
writeMux2(9);
delay(10);
Serial.println("loop is done");

}


void initmux1()
{
  PORTB = B00000000; // init PORTB 8-13
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

  if ( (chn > 16) | (chn < 0))
  {
    outofrange =1;
    return outofrange;
  }

  initmux1();

  PORTB = byte(chn -1);
  return outofrange;

}


bool writeMux2(int chn)
{
  bool outofrange = 0;

  if ((chn > 16) | (chn < 0))
  {
    outofrange =1;
    return outofrange;
  }

  initmux2();

  PORTD = PORTD | (byte(chn-1) << 2);
  return outofrange;

}
