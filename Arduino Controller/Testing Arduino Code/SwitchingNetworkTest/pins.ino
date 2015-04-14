  
  
  void init_pins()
  {
     //Set all pins as outputs and set initial values
  
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
    
    

  }
  

