/* Code to check RS232 Communication is OK 

Connect to current source and check front panel

CS should be set to baud 57600 and NL and CR (option on the far right)

front panel code just changes text

*/




void setup() {
  // put your setup code here, to run once:

Serial.begin(115200);
Serial1.begin(57600);

Serial.println("ScouseTom, checking CS Comm");
Serial1.println("DISP:TEXT:STAT 1");

}

void loop() {
  // put your main code here, to run repeatedly:

Serial1.println("DISP:TEXT \"CS_Comm Test\"");
Serial.println("Front Panel Test");
delay(2000);
Serial1.println("DISP:TEXT \"CS_Comm OK\"");
Serial.println("Hello there");
delay(2000);
}
