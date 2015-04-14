
//variables used in getasciinum
const char startOfNumberDelimiter = '<';
const char endOfNumberDelimiter   = '>';



void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
  char inb = Serial.read();
}

// stolen from http://forum.arduino.cc/index.php?PHPSESSID=27ugtrfuc4cdju8cjs9mcdtgf4&topic=99225.msg743931#msg743931

int getasciinum(){

  int processNumber=0;
  byte c = endOfNumberDelimiter;
  boolean finished = LOW;



  while (finished == LOW)
  {
    if (Serial.available() > 0) {

      static int receivedNumber = 0;
      static boolean negative = false;

      byte c = Serial.read ();

      switch (c)
      {

      case endOfNumberDelimiter:
        {
          if (negative) 
          {
            processNumber = - receivedNumber; 
          }
          else
          {
            processNumber = receivedNumber; 
          }
          finished = HIGH;
        }

        // fall through to start a new number
      case startOfNumberDelimiter: 
        receivedNumber = 0; 
        negative = false;
        break;

      case '0' ... '9': 
        receivedNumber *= 10;
        receivedNumber += c - '0';
        break;

      case '-':
        negative = true;
        break;

      } // end of switch  
    }



  }  
  return processNumber;
}

long getasciinum_long(){

  long processNumber=0;
  byte c = endOfNumberDelimiter;
  boolean finished = LOW;



  while (finished == LOW)
  {
    if (Serial.available() > 0) {

      static long receivedNumber = 0;
      static boolean negative = false;

      byte c = Serial.read ();

      switch (c)
      {

      case endOfNumberDelimiter:
        {
          if (negative) 
          {
            processNumber = - receivedNumber; 
          }
          else
          {
            processNumber = receivedNumber; 
          }
          finished = HIGH;
        }

        // fall through to start a new number
      case startOfNumberDelimiter: 
        receivedNumber = 0; 
        negative = false;
        break;

      case '0' ... '9': 
        receivedNumber *= 10;
        receivedNumber += c - '0';
        break;

      case '-':
        negative = true;
        break;

      } // end of switch  
    }



  }  
  return processNumber;
}





void sendasciinum(int num)
{
  Serial.print(startOfNumberDelimiter);
  Serial.print(num);
  Serial.print(endOfNumberDelimiter);
}

void sendasciinum_long(long num)
{
  Serial.print(startOfNumberDelimiter);
  Serial.print(num);
  Serial.print(endOfNumberDelimiter);
}

