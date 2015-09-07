/*
 * Switches.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

/*
stuff to switch the injection channels*/

const int PinsPerBoard = 40;


long tswprogstart = 0; //vars for programing swtiching timing
long tswprogend = 0;

long indtimerstart = 0; //vars for timing of indicator pin
long indtimerend = 0;	//

int NumBoard = 1; // number of Switching boards attached in daisy chain - starts at 1 for first call of Switch_init, then set by user
int TotalPins = PinsPerBoard * NumBoard; // total number of pins available 



void SwitchChn();
void SetSwitchesFixed();
void SetSwitchesFixed_Contact();
void SwitchChn_Contact() ;
void programswitches(int sourcechn, int sinkchn, int maxpins);
void SwitchesPwrOn();
void SwitchesPwrOff();
void shuffle(int *array, int n);
int BadElecCheck(int Chn);
int SwitchCheckPWR();
int SwitchCheckOpen(int BoardNum);


