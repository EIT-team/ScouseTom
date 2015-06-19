

//Library for handling the SPI transfer
#include <SPI.h>



//Variable for the SPI Enable pin
#define FSYNCPin 5

void setup() {



  // For SPI data transfer setup
  
  pinMode(FSYNCPin, OUTPUT); //FSYNC on pin 5
  pinMode(11, OUTPUT); //SDATA on pin 11
  pinMode(13, OUTPUT); //SCLK on pin 13

  digitalWrite(5, HIGH); //Set FSYNC High. FSYNC is active low
  digitalWrite(11, LOW); //Set SDATA Low
  digitalWrite(13, LOW); //Set SCLK Low

//Arduino handles most of the underlying SPI transfer by itself
  SPI.begin();  //Enable SPI
  SPI.setBitOrder(MSBFIRST);  //Send data Most significant bit first, this is necessary for the AD9833
  SPI.setDataMode(SPI_MODE2);  //Set SPI Mode 2 (Data captured on falling edge of clock, clock inversion on)
  SPI.setClockDivider(SPI_CLOCK_DIV128);    //  Set clock divider (optional)

}

void loop() {
delay(100);
//Program the AD9833, see http://www.analog.com/media/en/technical-documentation/application-notes/AN-1070.pdf for more details

//// Code for generating the frequency registers, I haven't tested this yet
//
//double f = 1000.00;// set output frequency 
//
//unsigned long  F_MCLK = 1e5;    //AD9833 crystal oscillator clock: 25Mhz
//unsigned long freq = (long)(0x10000000 / F_MCLK * f);
//unsigned int msb = (freq >> 16);
//unsigned int lsb = (freq & 0xffff);



//Frequency is controlled by a 28 bit word, which has to be inputted in two parts

 AD9833_SendWord(0x2000); //Control register
 AD9833_SendWord(0x75C3); //Frequency Regsiter part 1 (LSB)
 AD9833_SendWord(0x40A3);  //Frequency Register part 2 (MSB)
 AD9833_SendWord(0xC000);  //Phase regsister, don't need to change this at the moment, so set to 0 phase
 AD9833_SendWord(0x2000);  //Exit reset, sets the device to run


  //Loop every 10 seconds, don't need to do this, but for testing this is better as we can see the signals coming to the board
 delay(10000);



}


//SPI Data write
//Can only send 8 bits at a time, so this splits up a 16 bit word and sends it as two parts

void AD9833_SendWord(unsigned int data) {
  
  //enable SPI on slave device
  digitalWrite(FSYNCPin, LOW);
  
  //Send 16 bit word as two 8 bit sections
  SPI.transfer((data >> 8) & 0xFF);
  SPI.transfer(data & 0xFF);
  
  //Disable SPI on slave device
  digitalWrite(FSYNCPin, HIGH);
}

