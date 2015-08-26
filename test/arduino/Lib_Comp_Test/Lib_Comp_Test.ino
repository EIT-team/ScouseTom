/*
Each of these libraries should be able to added by themselves and still compile...


*/

#include "PCBPins.h"
//#include "Errors.h"
//#include "Messages.h"
#include "LowLevel.h"
#include "Injection.h"
//#include "Pins.h"
//#include "CS_comm.h"
#include "Switches.h"


void setup() {
  // put your setup code here, to run once:

	/*choose one of these variables to test if they have been included ok*/

	//int inj_test = SingleFreqMode;
	//int pin_test = indpulseson;
	//int switch_test = lastInjSwitch;
	//digitalWriteDirect(1, 1);
	//int PCBPins_test = DINp;
	//CS_commokmsg;
	programswitches(1, 2);
	
}

void loop() {
  // put your main code here, to run repeatedly

}
