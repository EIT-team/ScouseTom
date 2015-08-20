/*Pin Numbering for PCB version - changed to reduce trace length */
/*
// switch network pin definitions - old connected to optos
const int DINp = 39;
const int DINn = 41;
const int SCLK = 43;
const int SYNC = 35;
const int RESET = 37;
*/

// switch network pin definitions - new connected to AD isolator
const int DINp = 38;
const int DINn = 40;
const int SCLK = 42;
const int SYNC = 34;
const int RESET = 36;


// indicator pins
const int IND_SWITCH = 5;
const int IND_STIM = 6;
const int IND_START = 7;
const int IND_STOP = 8;
const int IND_FREQ = 9;

const int IND_EX_1 = 10;
const int IND_EX_2 = 11;
const int IND_EX_3 = 12;

//interupt pins
const int INTR_PMARK = 25; // pin to decect pmark - MUST BE AT POSITION 0 OF A DUE PORT 25 is 0 on portD - check http://arduino.cc/en/Hacking/PinMappingSAM3X

//Power Pins
const int PWR_STIM = 52;
const int PWR_SWITCH = 24;
