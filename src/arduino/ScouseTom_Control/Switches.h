/*
 * Switches.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

/*
stuff to switch the injection channels*/

long tswprogstart = 0; //vars for programing swtiching timing
long tswprogend = 0;

long indtimerstart = 0; //vars for timing of indicator pin
long indtimerend = 0;	//

void SwitchChn();
void SetSwitchesFixed();
void SetSwitchesFixed_Contact();
void SwitchChn_Contact() ;
void programswitches(int sourcechn, int sinkchn);
void SwitchesPwrOn();
void SwitchesPwrOff();
void shuffle(int *array, int n);
