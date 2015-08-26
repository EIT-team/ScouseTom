/*
 * Switches.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

/*
stuff to switch the injection channels*/

#ifndef Switches_h
#define Switches_h

#include "Arduino.h"
#include "PCBPins.h"


/*################CONSTANTS################*/


/*################VARIABLES################*/

long tswprogstart = 0; //vars for programing swtiching timing
long tswprogend = 0;

long indtimerstart = 0; //vars for timing of indicator pin
long indtimerend = 0;	//

int SwitchesProgrammed = 0; // flag for whether the switches are programmed or not
long lastInjSwitch = 0; //time when channels were switched - SingleFreqMode

/*################FUCNTION DEFS################*/

void SwitchChn();
void SetSwitchesFixed();
void SetSwitchesFixed_Contact();
void SwitchChn_Contact() ;
void programswitches(int sourcechn, int sinkchn);
void SwitchesPwrOn();
void SwitchesPwrOff();
void shuffle(int *array, int n);
int BadElecCheck(int Chn);

#endif