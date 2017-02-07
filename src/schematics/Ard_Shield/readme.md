# Arduino Shield

![Shield](https://raw.githubusercontent.com/EIT-team/ScouseTom/master/doc/figures/Components/ScouseTom_New.png)
The Arduino Shield has several functions:

- Communication with PC via USB serial. This is done through the programming port on the Arduinio Due. i.e. `Serial.print` etc. with baud rate 115200
- Communication with Keithley 6221 current source via isolated RS232 port - baud rate 57600 via Serial port `Serial1.print` etc.
- Reference triggers to EEG system. Pulses sent to digital inputs of EEG systems, isolated from Arduino pins
- Control of switch networks. Control signals sent to Switchboard (isolation on the switchboard)
- Stimulation triggers - Based on phase marker of Keithley 6221 - stimulation pulses are randomised with respect to the phase of the injected current.
- Stimulation voltage - the voltage of the pulses can be sent from 3.3 to 12 V. This is useful for controlling the electrical stimulator box  



![ScouseTom System blocks](https://raw.githubusercontent.com/EIT-team/ScouseTom/master/doc/figures/blocks.png)
