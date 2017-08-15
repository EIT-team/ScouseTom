/*
 * Stim.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

/*
stuff for the stimulator trigger only */

float mintime = 1.5; //this is the time taken for the stimulator ISR - current set to 1.5 uS
float startdelay = 4; //min delay in microseconds from pmark to starting pulse - measured to be 7uS. can be reduced by editing Winterrupts.c but thats a bugger to change for a single sketch only
//float stimdelay = 2.4; //THIS VALUE UNUSED BUT REFERENCE ONLY - this is the propogation delay in us from IND_STIM going high and the output of the neurolog stimulator rising as measured on scope


const int DigiPotAddress = 44; // I2C address of AD5280 - default is 44 up to 48
const int StimOffValue = 1; // Wiper position when stim is off - this is set to 1 to maximuise the resistance and thus limit the current used when no

const int StimSeqLength = 2; // length of stim sequence below
int StimSeq[StimSeqLength] = { 0,180 }; // sequence of phases in degrees




void stim_nextphase();
void ISR_PMARK();
void ISR_PMARK_TEST();
int stim_init(long Freq);
void stim_stop();
void stim_calcdelays(long Freq);
int stim_setpmark(long Freq);
int CheckPmark();
void Stim_SetDigipot(int val);
