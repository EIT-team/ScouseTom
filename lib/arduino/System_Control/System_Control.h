/*
* System_Control.h
*
* Variables used during system control - defaults for idle times and stuff like that
*
* Created on: 15 May 2015
*      Author: James
*/

#ifndef System_Control_h
#define System_Control_h

#include "Arduino.h"

const long idlewait = 10000; //idle time in milliseconds till change
const long SwitchTimeFix = 300; //microseconds switch programming time is fixed to (cheesy but 220 us time taken to program them - using some digitalwritedirect

#endif