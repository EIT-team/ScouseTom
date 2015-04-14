/* Switches injection pairs - proper switching using "BlinkWithoutDelay" style waiting rather than pausing.
 
 Hopefully final version of the switching code for the new UNO based shield. Switching on pin is added to show things are working. 
 
 V5 - Added variable pulse width for stimulator
 
 
 1 - switch of injection
 2 - start of injection
 3 - start of contact check
 4 - end of injection
 5 - end of contact check
 
 Written by the capricious and whimsy-prone Jimmy
 
 */

//used in control of system
int iPrt =0; //current line of the protocol
int cPrt =0; //contact impedance counter
int state =0;

//injection info
int numinj=0; //number of injections
long MeasTime=0; //measurement time in ms
long ContactTime=0; // contact impedance measurement time in ms
long StimTriggerTime =0; //time between stimulation triggers
long StimOffset=0; // time stimulation occurs after injection pair switch

int Injection[200][2]={
  0};//lazy at the moment - assumed max protocol length of 200;
int numelec=0;

//timing values


// programming switch timers
long tstart_u =0; // micro values for switch calc timing
long tend_u =0;

//contact check timer
long tstart_m =0; //milli values for delay timing
long tend_m=0;

//injection timer
unsigned long lastInjSwitch =0;
unsigned long lastStimTrigger =0;


//======================================================///
//HERE IS THE PULSE WIDTH SETTING!!!!!!!!!!!!!


unsigned long StimPulseWidth =1000;// In MICROSECONDS, must wierd shit will happen if it is set too small. must be bigger than 500 for safety

//BYLADSKI PAPPPPAAAAAAAAAAA





//pins
int DINp = 12;
int DINn = 11; 
int SCLK = 10;  
int SYNC = 9;

int RESET = 7;
int VDD = 6;
int VSS = 5;
int GND = 4;
int IND = 2;
int STIM = 3;

int LED=13;

boolean first = LOW;
boolean programmed = LOW;
boolean endofseq = LOW;




void setup() {

  //start serial communication
  Serial.begin(9600);
  establishContact();

  //get number of injections
  numinj=getasciinum();
  sendasciinum(numinj);

  //get number of electrodes
  numelec=getasciinum();
  sendasciinum(numelec);

  //get injection time
  MeasTime=getasciinum_long();
  sendasciinum_long(MeasTime);

  //get contact impedance measurement time
  ContactTime=getasciinum_long();
  sendasciinum_long(ContactTime);

  //get stimulation trigge time
  StimTriggerTime=getasciinum_long();
  sendasciinum_long(StimTriggerTime);

  //get stimulation offset time
  StimOffset=getasciinum_long();
  sendasciinum_long(StimOffset);
  
  



  //get sources
  for (int n;  n < numinj;  n++)
  {
    int in=getasciinum();
    sendasciinum(in);
    Injection[n][0]=in;
  }

  //get sinks
  for (int n;  n < numinj;  n++)
  {
    int in=getasciinum();
    sendasciinum(in);
    Injection[n][1]=in;
  }

  init_pins();




}

void loop() {

  char c='#';

  //read serial byte if one is available
  if (Serial.available() > 0)
  {
    delay(1);
    c=Serial.read();
  }

  // if byte has been read then get new state CMD
  if (c != '#')
  {
    getstate(c);
  }

  // do stuff based on what the state is
  dostuff();



}

// function which gets the state from the command sent from PC. State is unchanged if unrecognised cmd
void getstate(char c)
{
  switch (c)
  {
  case 'X': //set to idle "do nothing" state
    state =0;
    break;
  case 'H': // Halt injection state
    state=9;
    break;
  case 'S': //start state
    state=1;
    break;
  case 'I': //inject state
    state=2;
    break;
  case 'C': //start contact impedance state
    state=3;
    break;
  case 'F': //contact impedance state
    state=4;
    break;

  default: // if not one of these commands then keep state the same
    state = state; //a bit didactic but hey
  }


}

void dostuff()
{
  switch (state)
  {
  case 0: //idle case
    {
      //do nothing
      delay(1);
      //        Serial.println("chillin");
    }
    break;
  case 1: //start state
    {
      //two 500us pulses to indicate start
      //            Serial.println("LETS GO");
      state=2;
      digitalWrite(LED,HIGH);
      pulse_indicator(2);
      lastInjSwitch=millis();
      first=HIGH;
      programmed = LOW;
    }
    break;
  case 2: //inject state
    {

      if (programmed == LOW)

      {
        //              Serial.println("Programming Switches");
        //start programming timer
        tstart_u=micros();
        //set up switches
        programswitches(Injection[iPrt][0],Injection[iPrt][1]);

        // increment protocol line
        iPrt++;
        if (iPrt == numinj) 
        {
          iPrt = 0;
        }
        programmed = HIGH;
        tend_u=micros();
        //ensure the switching always takes 2 milliseconds (effectively rounds up the time taken to an integer millisecond)

        delayMicroseconds(2000-(tend_u-tstart_u));
      }


      boolean switchflag = LOW;

      //if this is the first call in the sequence then dont wait to switch
      if (first==HIGH)
      {
        switchflag = HIGH;
        first =  LOW;
        //              Serial.println("First Run");

      }
      else
      {
        unsigned long currentMillis=millis(); // current time in miliseconds

          // see if we need to switch the injection pairs
        if (currentMillis - lastInjSwitch > (MeasTime -3)) //3 as 2 less millis from delay above and 1 ms delay for indicator below
        {
          switchflag = HIGH;
        }
        else if (currentMillis - lastStimTrigger > (StimTriggerTime - 1))
        {

          long trigtimerend=0;
          long trigtimer=micros();
          long stimdelay=0;
          digitalWrite(STIM,HIGH);
          //                Serial.println("Stimpak on");
          trigtimerend=micros();
          
          // stop the thing fucking up if the pulsewidth is set too short 
          stimdelay=StimPulseWidth-(trigtimerend-trigtimer);
          
          if (stimdelay < 0)
          {
          stimdelay =1;
          }
          
          delayMicroseconds(stimdelay);
          digitalWrite(STIM,LOW);
          lastStimTrigger=currentMillis;
        }
      }

      //if we should switch then..well do that that
      if (switchflag == HIGH)
      {

        //Set SYNC high to update switches
        long indtimerend=0;
        long indtimer=micros();    
        digitalWrite(IND,HIGH);
        //        Serial.println("IND HIGH");
        digitalWrite(SYNC, HIGH);
        lastInjSwitch=millis();
        indtimerend=micros();
        delayMicroseconds(1000-(indtimerend-indtimer));
        digitalWrite(IND,LOW);
        programmed = LOW;

        //stim trigger happens a certain offset after switching.
        delay(StimOffset);
        long trigtimerend=0;
        long trigtimer=micros();
        digitalWrite(STIM,HIGH);
        //        Serial.println("Stimpak on");
        trigtimerend=micros();
        delayMicroseconds(StimPulseWidth-(trigtimerend-trigtimer));
        digitalWrite(STIM,LOW);
        lastStimTrigger=millis();



      }

    }
    break;
  case 9: //halt injection state
    {
      //set SYNC pin high again 
      digitalWrite(SYNC,HIGH);

      //reset switches

      digitalWrite(RESET, LOW);
      digitalWrite(RESET, HIGH);

      pulse_indicator(4);
      digitalWrite(LED,LOW);

      init_pins;
      iPrt=0;
      cPrt=0;
      state=0;
    }
    break;
  case 3: // start contact impedance state
    {
      //three 500us pulses to indicate contact impedance

      //      Serial.println("hey");
      //      Serial.println("starting contact bitches");

      digitalWrite(LED,HIGH);
      state=4;
      cPrt = 0;
      first=HIGH;
      programmed = LOW;
      endofseq =LOW;
      pulse_indicator(3);
      lastInjSwitch=millis();

    }
    break;
  case 4: // do contact impedance
    {



      //if switches arent programmed then program them...
      if (programmed == LOW)
      {
        //Serial.println("Programming Switches");
        //start programming timer
        tstart_u=micros();


        //get next electrode pair
        int a = cPrt +1;
        int b = a+1;
        if (b > numelec )
        {
          b= b - numelec;
        }

        Serial.println(a);
        Serial.println(b);



        //set up switches
        programswitches(a,b);

        // increment protocol line
        cPrt++;
        if (cPrt == numelec+1) 
        {
          cPrt = 0;
          //state=8; // go to halt state next
          endofseq=HIGH;
        }



        programmed = HIGH;
        tend_u=micros();
        //ensure the switching always takes 2 milliseconds (effectively rounds up the time taken to an integer millisecond)

        delayMicroseconds(2000-(tend_u-tstart_u));
      }


      boolean switchflag = LOW;

      //if this is the first call in the sequence then dont wait to switch
      if (first==HIGH)
      {
        switchflag = HIGH;
        first =  LOW;
        //              Serial.println("First Run");

      }
      else
      { //otherwise see if the time has come to switch

        unsigned long currentMillis=millis(); // current time in miliseconds

          // see if we need to switch the injection pairs
        if (currentMillis - lastInjSwitch > (ContactTime -3)) //3 as 2 less millis from delay above and 1 ms delay for indicator below
        {
          switchflag = HIGH;
        }

      }

      //if we should switch then..well do that that
      if (switchflag == HIGH)
      {
        //if we are to switch AND not at the end of the sequence, then switch
        if (endofseq == LOW)
        {
          //Set SYNC high to update switches
          long indtimerend=0;
          long indtimer=micros();    
          digitalWrite(IND,HIGH);
          //Serial.println("IND HIGH");
          digitalWrite(SYNC, HIGH);
          lastInjSwitch=millis();
          indtimerend=micros();
          delayMicroseconds(StimPulseWidth-(indtimerend-indtimer));
          digitalWrite(IND,LOW);
          programmed = LOW;
        }
        else
        {
          // we should switch but the end of the sequence, then go to the finish contact state
          state=8;

        }
      }

    }
    break;
  case 8: //halt contact check state
    {
      //set SYNC pin high again 
      digitalWrite(SYNC,HIGH);

      //reset switches
      digitalWrite(RESET, LOW);
      digitalWrite(RESET, HIGH);


      pulse_indicator(5);
      digitalWrite(LED,LOW);

      init_pins;
      iPrt=0;
      cPrt=0;
      state=0;
    }
    break;
  }
}









