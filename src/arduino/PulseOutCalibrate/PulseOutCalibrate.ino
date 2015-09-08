/*

   Calibrates the output of the stimulation circuit for digipot settings

   as wiper is is "rheostat" mode - Wiper connected to ground and Pos A to load - the resistance is minimal at position 256 and maximal at 0

   corresponding Labview VI is called Stim_cal

   Stim Pin is connected to PFI0 on USB DAQ  as trigger for analogue record
   AISN is connected to 5V on arduino to allow for wider range of voltages to be recorded
   AI0 and AI1 are RSEN mode (relative to AISN) 
   AI0 connected to Stimulator Output from the MosFET which is sent to stimulator
   AI1 connected to Vstim ref - the voltage output from the lm317
   AI2 connected to the 5V pin used for AISN for subsequent recalculation

   Arudino sends pot setting over serial before doing one pulse, the labview VI reads the incoming serial and then runs the tigger activated analog read
   The labview VI is slow as it is inefficiently coded, thus the long delays between sending serial command and setting pulse high. 

   Pulses are output for each setting ebtween minval and max val, repeated reps number of times

   Serial output -1 when finished, which should stop the VI running too 


 */
#include <Wire.h>

int currentval = 0;
//! time of pulse high - 200 ms sampled in LV - a bit higher to ensure only HIGH value recorded
int hightime = 220;
//! time pulse low 
int lowtime = 100;
//! this is the pin used for stimulation IND_STIM
int stimpin = 24; 
//! power on pin
int PWR_STIM = 52; 
//! delay between each setting of the digipot
int pulsedelay = 500;
//! delay between sending potentiometer value and setting pin high
//! - this is to give time for labview to get its shit together. VI is inefficient as cant do proper retriggering
int serialdelay = 500; 

//! minimum pot value
int MinVal = 210; 
//! maximum pot value (must be below 256)
int MaxVal = 250; 
int reps = 10;


void setup()
{
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200);
  //Serial.println("hey there!");
  pinMode(PWR_STIM, OUTPUT);
  digitalWrite(PWR_STIM, HIGH);    // turn the LED off by making the voltage LOW
  pinMode(stimpin, OUTPUT);
  digitalWrite(stimpin, LOW);    // turn the LED off by making the voltage LOW
  // wait for PC to be ready 
  establishContact();
  for (int iRep = 0; iRep < reps; iRep++)
  {
    // cycle through all values of resisitance
    for (int iPot = MinVal; iPot <= MaxVal; iPot++)
    {
      Serial.println(iPot);
      DigipotSetR(iPot); // set potentiometer
      delay(serialdelay);
      pulsestim(1); // pulse pin
      delay(pulsedelay); // wait a bit 
    }
  }
  digitalWrite(stimpin, LOW);
  DigipotSetR(MinVal); // reset as I think 256 causes some weirdness
  Serial.println("-1");
  digitalWrite(PWR_STIM, LOW);
}

//! what is this? -Sinan
void loop()
{

}


//! \brief sets wiper on digipot
//! \details 1) transmit to device #44 (0x2c); 2) device address is specified in datasheet
//! 3) send instruction byte and potentiometer value byte; 4) stop transmitting. 
void DigipotSetR(int val)
{
  Wire.beginTransmission(44); 
  Wire.write(byte(0x00));            // sends instruction byte
  Wire.write(val);             // sends potentiometer value byte
  Wire.endTransmission();     // stop transmitting
}


//! \brief just sets pin high and low in badly coded fashion
void pulsestim(int rep)
{
  for (int i = 0; i < rep; i++)
  {
    digitalWrite(stimpin, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(hightime);              // wait for a second
    digitalWrite(stimpin, LOW);    // turn the LED off by making the voltage LOW
    delay(lowtime);              // wait for a second
  }
}


void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
  char inb = Serial.read();
}
