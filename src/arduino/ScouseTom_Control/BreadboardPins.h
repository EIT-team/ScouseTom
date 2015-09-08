/*Pin numbering for BREADBOARD version */

const int DINp = 12;  //! switch network pin definitions
const int DINn = 11;  //! switch network pin definitions
const int SCLK = 10;  //! switch network pin definitions
const int SYNC = 9;  //! switch network pin definitions
const int RESET = 8;  //! switch network pin definitions

const int IND_STIM = 24; //! indicator pins
const int IND_SWITCH = 22; //! indicator pins
const int IND_FREQ = 26; //! indicator pins
const int IND_START = 28; //! indicator pins
const int IND_STOP = 30; //! indicator pins

//! interupt pins: pin to decect pmark - 
//! MUST BE AT POSITION 0 OF A DUE PORT 25 is 0 on portD - check http://arduino.cc/en/Hacking/PinMappingSAM3X
const int INTR_PMARK = 25;

const int PWR_STIM = 52; //!Power Pins
const int PWR_SWITCH = 50; //!Power Pins
