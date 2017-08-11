/*
  Stuff for initilalising pins and indicator pins*/

void init_pins_ind()
{
  //Set all pins as outputs and set initial values

  //pins for indicator channels
  pinMode(IND_SWITCH, OUTPUT);
  pinMode(IND_STIM, OUTPUT);
  pinMode(IND_FREQ, OUTPUT);
  pinMode(IND_START, OUTPUT);
  pinMode(IND_STOP, OUTPUT);

  pinMode(IND_EX_1, OUTPUT);
  pinMode(IND_EX_2, OUTPUT);
  pinMode(IND_EX_3, OUTPUT);

  pinMode(BONUS_1, OUTPUT);
  pinMode(BONUS_2, OUTPUT);
  pinMode(BONUS_3, OUTPUT);
  pinMode(BONUS_4, OUTPUT);


  pinMode(TRIG_DISABLE_1, OUTPUT);
  pinMode(TRIG_DISABLE_2, OUTPUT);

  digitalWriteDirect(TRIG_DISABLE_1, LOW);
  digitalWriteDirect(TRIG_DISABLE_2, LOW);



  ind_low();

}



void ind_low()
{
  //reset all indicator pins
  digitalWriteDirect(IND_SWITCH, LOW);
  digitalWriteDirect(IND_STIM, LOW);
  digitalWriteDirect(IND_FREQ, LOW);
  digitalWriteDirect(IND_START, LOW);
  digitalWriteDirect(IND_STOP, LOW);
  digitalWriteDirect(IND_EX_1, LOW);
  digitalWriteDirect(IND_EX_2, LOW);
  digitalWriteDirect(IND_EX_3, LOW);
  digitalWriteDirect(BONUS_1, LOW);
  digitalWriteDirect(BONUS_2, LOW);
  digitalWriteDirect(BONUS_3, LOW);
  digitalWriteDirect(BONUS_4, LOW);
}

void ind_high()
{
  //reset all indicator pins
  digitalWriteDirect(IND_SWITCH, HIGH);
  digitalWriteDirect(IND_STIM, HIGH);
  digitalWriteDirect(IND_FREQ, HIGH);
  digitalWriteDirect(IND_START, HIGH);
  digitalWriteDirect(IND_STOP, HIGH);
  digitalWriteDirect(IND_EX_1, HIGH);
  digitalWriteDirect(IND_EX_2, HIGH);
  digitalWriteDirect(IND_EX_3, HIGH);
    digitalWriteDirect(BONUS_1, HIGH);
  digitalWriteDirect(BONUS_2, HIGH);
  digitalWriteDirect(BONUS_3, HIGH);
  digitalWriteDirect(BONUS_4, HIGH);
}


void ind_pulse(int del, int gap, int chn)
{
  digitalWriteDirect(chn, HIGH);
  delayMicroseconds(del);
  digitalWriteDirect(chn, LOW);
  delayMicroseconds(del);
  delayMicroseconds(gap);
}
