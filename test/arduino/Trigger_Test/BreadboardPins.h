/*Pin numbering for BREADBOARD version */



// switch network pin definitions
const int DINp = 12;
const int DINn = 11;
const int SCLK = 10;
const int SYNC = 9;
const int RESET = 8;

// indicator pins
const int IND_STIM = 24;
const int IND_SWITCH = 22;
const int IND_FREQ = 26;
const int IND_START = 28;
const int IND_STOP = 30;

//interupt pins
const int INTR_PMARK = 25; // pin to decect pmark - MUST BE AT POSITION 0 OF A DUE PORT 25 is 0 on portD - check http://arduino.cc/en/Hacking/PinMappingSAM3X

//Power Pins
const int PWR_STIM = 52;
const int PWR_SWITCH = 50;
