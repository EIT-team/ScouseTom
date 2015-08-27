/*
 * CS_comm.h
 *
 *  Created on: 29 May 2015
 *      Author: raquel
 */

int CS_start();
int CS_stop();
int CS_sendsettings_check(long Amp, long Freq);

void CS_getmsg();
void CS_getresponse(String Str_send);
int CS_checkresponse(String Str_exp);
int CS_checkresponse_num(long exp_num, long scale);
