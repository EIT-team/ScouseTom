/*
 * PC_comm.h

 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */


//variables used in getasciinum
const char startOfNumberDelimiter = '<';
const char endOfNumberDelimiter = '>';

const char RepNumIndicator = 'R'; // rep numbers sent to PC in format R#
const char PrtNumIndicator = 'P'; //prt number sent to PC in format P#
const char PhaseOrderIndicator = 'D'; //phase delay in degrees in format D1,2,3,4,5...
const char FreqOrderIndicator = 'O'; // freqorder sent like O1,2,3,4,5etc.

const char OrderDelimiter = ','; //freq/phase order sent comma delimited

void establishContact();
int PC_getsettings();
int checkinputs();
int getasciinum();
long getasciinum_long();
void sendasciinum(int num);
void sendasciinum_long(long num);
void PC_sendupdate();
void PC_sendphaseupdate();
