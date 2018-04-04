/* Default settings for Current Injection etc.

*/



const int maxInjections = 256;// number of injections in protocol - max 256 to avoid dynamic memory allocation
const int maxFreqs = 40; // max number of frequencies
const int maxBadElecs = 20; // max number of bad electrodes 
const int NumShunt = 2; // the number of electrodes you want shunted together
const int NumPrt = 4; // the array needed to store the 8 values for protocol (4 sources, 4 sinks)

const long ContactAmp = 141; //Ampltude used during contact check
const long ContactFreq = 1000; //Frequency of contact check
const long StartDelay_CS = 53 * 1000; //number of microseconds taken for CS to actually start injecting after being told to - this need verification
const long StartDelay_MultiFreq = 22 * 1000; // delay after setting new amp and freq to wait before saying cs is ready - I picked this number out of the air
