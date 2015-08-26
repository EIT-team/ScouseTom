/*
* Injection.h
*
* Default settings for Current Injection etc.
* 
* Created on: 29 May 2015
*      Author: James
*/

#ifndef Injection_h
#define Injection_h

#include "Arduino.h"

/*################CONSTANTS################*/

const int maxInjections = 200;// number of injections in protocol - max 200 to avoid dynamic memory allocation
const int maxFreqs = 40; // max number of frequencies
const int maxBadElecs = 20; // max number of bad electrodes 

const long ContactAmp = 141; //Ampltude used during contact check
const long ContactFreq = 1000; //Frequency of contact check
const long StartDelay_CS = 53 * 1000; //number of microseconds taken for CS to actually start injecting after being told to - this need verification


/*################VARIABLES################*/

int SingleFreqMode = 0; // flag for single frequency mode
long lastStimTrigger = 0; //time when stimulation trigger was last activated

int iFreq = 0; //current frequency
int iPrt = 0; //current protocol line
int iRep = 0; //current protocol repetition
int iStim = 0; // current stimulation number

int iContact = 0; // counter for contact check loop
int ContactEndofSeq = 0; // flag for whether contact check is finished
long ContactTime = 0; // contact impedance measurement time in us

int Injection[maxInjections][2] = { 0 }; //number of injections in protocol - max 200 to avoid dynamic memory allocation
int NumInj = 0; //number of injection pairs in protocol - set from PC comm
int NumFreq = 0; // number of frequencies (and corresponding amplitudes) to use - set from PC comm
int NumElec = 0; // number of electrodes used - this is used in contact check at the moment, but likely used for dual systems too
int NumRep = 0; // number of time whole protocol is repeated - total recording time is MeasTime*NumFreq*NumRep

long  Amp[maxFreqs] = { 0 }; //amplitude in uA - container for max 20
long  Freq[maxFreqs] = { 0 }; //freq in Hz - contaier for max 20 set in
long  MeasTime[maxFreqs] = { 0 }; //injection time in microseconds - set by user (USER SELECTS MILLISECONDS BUT SCALED IN MICROSECONDS AS DUE IS FASTER)


long BadElecs[maxBadElecs] = { 0 }; // bad electrodes
int NumBadElec = 0; // number of bad electrodes 

/*################FUCNTION DEFS################*/



#endif