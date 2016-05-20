/*
 * Pins.h
 *
 *  Created on: 29 May 2015
 *      Author: James
 */


const int indpulsewidth = 50; //this is in number of 10uS interrupts - 50 gives just above 500uS pulse width
const int indpulsewidthtotal = indpulsewidth*2; //this is the total size of the pulse 100 is 1ms. two variables to save clock cycles in ISR

const int NumInd = 4; // number of indicator pins - CHANGING THIS WOULD MEAN CHANING THE INDPINS FUNCTIONS TOO
const int indpins[NumInd] = { IND_START, IND_STOP, IND_SWITCH, IND_FREQ }; // pin numbers for the indicators


const int TrigCheckHighTime = 20000; //us pins are high for in checking trigger
const int TrigCheckLowTime = TrigCheckHighTime * 10; //us pins are LOW in checking trigger
const int MaxTrigCheckLoops = 20; // number of times to run the trig check loop - i.e. how many times to pulse indicators before stopping

//const int fakepmarkpin = 10; //fake pmark pin for use with TC6 - debugging only

void init_pins();
void reset_pins();
void reset_ind();
void reset_pins_pwr();
void indpins_check();
void indpins_pulse(int StartChn, int StopChn, int SwitchChn, int FreqChn);
void indpins_init();
void indChnIdent();
void ind_low();
void ind_high();
void ind_pulse_with_delay(int chn, int del, int repeats);
