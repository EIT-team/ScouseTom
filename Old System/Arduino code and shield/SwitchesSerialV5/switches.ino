
//function to program switches
void programswitches(int sourcechn, int sinkchn)
{
  //Set SYNC low to enable programming of switches
  digitalWrite(SYNC, LOW);
  
  //Iterate 40 times, once for each switch. Turn on switches based on values in Injection[][]
  //1st command sent is for switch 40, last is for switch 1.
  //Switches correspond directly to pins on DSUB - switch 1 goes to pin 1 etc.
  for (int j = 40 ; j > 0 ; j--){
    
  digitalWrite(DINp, LOW);
  digitalWrite(DINn, LOW);
  
  if (sourcechn == j)  digitalWrite(DINp, HIGH);
  if (sinkchn == j)  digitalWrite(DINn, HIGH);
  
  
  //Generate clock pulse to clock in switch values to DIN pins.
  digitalWrite(SCLK, HIGH);
  digitalWrite(SCLK, LOW);
  
  //Set low again
  digitalWrite(DINp, LOW);
  digitalWrite(DINn, LOW);
  
  }     
}



