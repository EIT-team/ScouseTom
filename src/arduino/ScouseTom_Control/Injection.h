/* Default settings for Current Injection etc.

*/



const int maxInjections = 200;// number of injections in protocol - max 200 to avoid dynamic memory allocation
const int maxFreqs = 40; // max number of frequencies
const int maxBadElecs = 20; // max number of bad electrodes 

const long ContactAmp = 141; //Ampltude used during contact check
const long ContactFreq = 1000; //Frequency of contact check
const long StartDelay_CS = 53 * 1000; //number of microseconds taken for CS to actually start injecting after being told to - this need verification
