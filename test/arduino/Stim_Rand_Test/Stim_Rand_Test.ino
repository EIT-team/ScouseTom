/*
Code to check stim - triangle wave out on "STIM OUT" Pin


*/

float mintime = 1.5; //this is the time taken for the stimulator ISR - current set to 1.5 uS
int NumDelay = 0; //the total number of possible delays, as calcluated from the freq and the time gap - set by stim calcdelays
int Stim_delays[360] = { 0 }; //holds all possible delays up to a maximum of 360 - these are the number of ticks to wait before starting trigger
int Stim_phases[360] = { 0 }; // phases each of the delays equate too - cast to int because who cares about .5 of a degree of phase?
int Stim_PhaseOrder[360] = { 0 }; //order of the phase delays - shuffled and sent to PC every time it gets to the end


long FreqToCheck = 6000;



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("Hello! Testing ScouseTom STIM Randomisation now");


  Serial.print("I am going to check the phases for ");
  Serial.print(FreqToCheck);
  Serial.println("Hz");

  stim_calcdelays(FreqToCheck);

  FreqToCheck = 600;

  Serial.print("I am going to check the phases for ");
  Serial.print(FreqToCheck);
  Serial.println("Hz");

  stim_calcdelays(FreqToCheck);


  FreqToCheck = 10000;

  Serial.print("I am going to check the phases for ");
  Serial.print(FreqToCheck);
  Serial.println("Hz");

  stim_calcdelays(FreqToCheck);



}

void loop() {
  // put your main code here, to run repeatedly:
  


}

void stim_calcdelays(long Freq) 
{
	//calculate the possible delays for this freq
	float T = 1000000 / Freq; // period in microseconds
	float phaseacc = T / 360; //microseconds per degree of phase

	if (phaseacc < mintime) // if time for 1 degree is less than the minimum take a subset
	{
		NumDelay = int((T / mintime) +0.5); //find number of possible phases rounding up
		

		for (int i = 0; i < NumDelay; i++) //populate vector
		{
			Stim_delays[i] = i;
			Stim_phases[i] = (i*mintime)/phaseacc;
		}
	}
	else // if phase time is greater than min time, then only do 360 phases
	{
		NumDelay = 360;

		for (int i = 0; i < NumDelay; i++)
		{
			Stim_delays[i] = i*phaseacc;
			Stim_phases[i] = i;
		}

	}

	for (int n = 0; n < NumDelay; n++) // populate phase order array
	{
		Stim_PhaseOrder[n] = n;
	}


	// /*
	Serial.print("T:");
	Serial.println(T);
	Serial.print("phaseacc:");
	Serial.println(phaseacc);
	Serial.print("NumDelay:");
	Serial.println(NumDelay);

	Serial.print("delays:");
	for (int i = 0; i < NumDelay; i++)
	{
	Serial.print(Stim_delays[i]);
	Serial.print(",");
	}
	Serial.println("...");

	Serial.print("phases:");
	for (int i = 0; i < NumDelay; i++)
	{
	Serial.print(Stim_phases[i]);
	Serial.print(",");
	}
	Serial.println("...");
// 	*/
}


void shuffle(int *array, int n) {
	//this is the knuth-fisher-yates shuffle dontcha know
	if (n > 1)
	{
		for (int i = n - 1; i > 0; i--) {
			int j = random(i);
			int t = array[j];
			array[j] = array[i];
			array[i] = t;
		}
	}
}



//taken from http://forum.arduino.cc/index.php?topic=129868.15
inline void digitalWriteDirect(int pin, int val) {
  if (val) g_APinDescription[pin].pPort->PIO_SODR = g_APinDescription[pin].ulPin;
  else    g_APinDescription[pin].pPort->PIO_CODR = g_APinDescription[pin].ulPin;
}

