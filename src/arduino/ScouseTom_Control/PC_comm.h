/*
 * PC_comm.h

 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

//! timeout in milliseconds for response from PC
const int PC_timeoutlimit = 2000;
//! variables used in getasciinum
const char startOfNumberDelimiter = '<';
//! variables used in getasciinum
onst char endOfNumberDelimiter = '>';

//! rep numbers sent to PC in format R#
const char RepNumIndicator = 'R'; 
//! prt number sent to PC in format P#
const char PrtNumIndicator = 'P';
//! phase delay in degrees in format D1,2,3,4,5...
const char PhaseOrderIndicator = 'D';
//! freqorder sent like O1,2,3,4,5etc.
const char FreqOrderIndicator = 'O';
//! compliance status sent like C0,0,0,0,0,0,....
const char ComplianceStatusIndicator = 'C'; 
//! freq/phase order sent comma delimited
const char OrderDelimiter = ',';

void establishContact();
int PC_getsettings();
int checkinputs();
int getasciinum();
long getasciinum_long();
void sendasciinum(int num);
void sendasciinum_long(long num);
void PC_sendupdate();
void PC_sendphaseupdate();
void PC_sendcomplianceupdate();
