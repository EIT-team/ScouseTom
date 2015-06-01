/*
 * Pins.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */


void init_pins();
void reset_pins();
void reset_ind();
void reset_pins_pwr();
void indpins_check();
void indpins_pulse(int StartChn, int StopChn, int SwitchChn, int FreqChn);
void indpins_init();
