/*
 * CS_comm.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

//! size of char buffer to recieve from current source
const byte CS_buffSize = 40;
//! Current source version number - used to check communication with current source
String CS_vers = "1999.0";
//! timeout in milliseconds for response from current source
const int CS_timeoutlimit = 1000;
//! scale for micro
const long sc_micro = 1000000;  
//! scale for milliseconds
const long sc_milli = 1000;
//! mV compliance setting for current source in mV - default is 1.9V for biosemi
int Compliance = 1900; 



void CS_next_chn();
void CS_next_freq();
int CS_start();
int CS_stop();
int CS_sendsettings_check(long Amp, long Freq);
void CS_sendsettings(long Amp, long Freq);
int CS_init();
void CS_Disp_single(long Amp, long Freq, int Rep, int Repeats);
void CS_Disp_Contact(int Pair, int Elecs);
void CS_Disp_multi(long Amp, long Freq, int Fnum, int Ftot, int Pnum, int Ptot, int Rep, int Repeats);
void CS_Disp(String Textstr);
void CS_Disp_Wind2(String Textstr);
void CS_getmsg();
void CS_getresponse(String Str_send);
int CS_checkresponse(String Str_exp);
int CS_checkresponse_num(long exp_num, long scale);
boolean CS_CheckCompliance();
int CS_SetCompliance(int Compliance);
