  
  
  void init_pins()
  {
     //Set all pins as outputs and set initial values
    pinMode ( VSS, OUTPUT );     
    pinMode ( GND, OUTPUT );     
    pinMode ( VDD, OUTPUT ); 
    
    digitalWrite ( VSS, LOW );
    digitalWrite ( GND, LOW );  
    digitalWrite ( VDD, HIGH );
  
    pinMode ( DINp, OUTPUT );    
    pinMode ( DINn, OUTPUT );    
    
    digitalWrite ( DINp, LOW );
    digitalWrite ( DINn, LOW );
  
    pinMode ( SCLK, OUTPUT );    
    pinMode ( SYNC, OUTPUT );    
    pinMode ( RESET, OUTPUT ); 
    
    digitalWrite ( SCLK, LOW );
    digitalWrite ( SYNC, HIGH );  
    digitalWrite ( RESET, HIGH );
    
    pinMode(IND,OUTPUT);
    digitalWrite(IND,LOW);
    
    pinMode(STIM,OUTPUT);
    digitalWrite(STIM,LOW);
    
    pinMode(LED,OUTPUT);
  digitalWrite(LED,LOW);    
  }
  
  void pulse_indicator(int repeats)
  {
    for (int i=0; i<repeats;i++)
    {
      digitalWrite(IND,HIGH);
      delayMicroseconds(500);
      digitalWrite(IND,LOW);
      delayMicroseconds(500);
    }
  }
  

