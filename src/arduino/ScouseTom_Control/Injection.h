/* Default settings for Current Injection etc.

*/


//! number of injections in protocol - max 200 to avoid dynamic memory allocation
const int maxInjections = 256;
//! max number of frequencies
const int maxFreqs = 40;
//! max number of bad electrodes 
const int maxBadElecs = 20; 
//! Ampltude used during contact check
const long ContactAmp = 141; 
//! Frequency of contact check
const long ContactFreq = 1000; 
//! number of microseconds taken for CS to actually start injecting after being told to - this need verification
const long StartDelay_CS = 53 * 1000; 
