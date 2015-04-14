/*

Code to test switch network only - connected to PCB

User enters the channel they want to connect to the sink pin (default 2) 

Useful to just check switch network is working ok with a multimeter


Jimmy 2014/2015

*/




//pins
int DINp = 12;
int DINn = 11;
int SCLK = 10;
int SYNC = 9;

int RESET = 8;


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
  Serial.print("The sink pin is : ");
  Serial.println(sinkpin);
  Serial.println("Make sure you have changed terminator to newline :)");

  init_pins();

}

void loop() {
  // put your main code here, to run repeatedly:

  while (Serial.available() > 0) {
    int c = Serial.parseInt();

    if (Serial.read() == '\n') {
      //Serial.println(c);

      if (c < chnmax)
      {

        Serial.print("Setting switches to chn: ");
        Serial.println(c);
        programswitches(c, sinkpin);


      }
      else
      {
      Serial.println("too high channel number");
      }
      
    }
  }



}
