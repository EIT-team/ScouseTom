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
	Serial.println("Turn muxes off by entering: 99,99");


	DDRB = DDRB | B00111111; //set pins to outputs - ard pins 8-13 - dont sure if we want to mess with B6 and 7 so leave those
	DDRD = DDRD | B11111100; //set pins to outputs without fucking up serial 0-7




}

void loop() {

	while (Serial.available() > 0)
	{
		// parse two integers. this is lazy and doesnt handle getting not the expected thing well
		int Mux1Val = Serial.parseInt();
		int Mux2Val = Serial.parseInt();
		if (Serial.read() == '\r') {


			if ((Mux1Val == 99) & (Mux2Val == 99))
			{
				MuxOff();
				Serial.println("Turning Muxes Off");
			}
			else
			{

				Serial.print("I am going to set Mux 1: ");
				Serial.print(Mux1Val);
				Serial.print(" and Mux 2 to: ");
				Serial.println(Mux2Val);
				MuxOn();
				bool badrange = writeMux1(Mux1Val) | writeMux2(Mux2Val);

				if (badrange)
				{
					Serial.println("OUT OF RANGE");
					void initports();
				}
			}

		}

	}

}


void initmux1()
{
	//comes from https ://www.arduino.cc/en/Reference/BitwiseAnd


	PORTB = PORTB & B11110000; // init PORTB 8-13 - keep values of 12 onwards
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


void MuxOn()
{
	//digitalWrite(12, 1);
	//digitalWrite(13, 1);

	PORTB = PORTB | B00110000;

}


void MuxOff()
{
	//digitalWrite(12, 0);
	//digitalWrite(13, 0);

	PORTB = PORTB & B11001111;
}





bool writeMux1(int chn)
{
	bool outofrange = 0;

	if ((chn > 16) | (chn < 1))
	{
		outofrange = 1;
		return outofrange;
	}

	initmux1();

	PORTB = PORTB | byte(chn - 1);
	return outofrange;

}


bool writeMux2(int chn)
{
	bool outofrange = 0;
	//check its in range
	if ((chn > 16) | (chn < 1))
	{
		outofrange = 1;
		return outofrange;
	}
	//reset pins
	initmux2();
	//set port based on binary value - subtract 1 as 0000 is 1 based on truth table of ADG426
	PORTD = PORTD | (byte(chn - 1) << 2);
	return outofrange;

}
