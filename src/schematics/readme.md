# Schematics
The schematics needed to create a ScouseTom system and custom electrode boards are all here. All files were created in Eaglecad, and the gerber files are also saved. Where relevant, BOM and pick and place data are included.

- __ _Superseded __ - Old files of historical interest
- __Ard Shield__ - Shield for the Arduino Due which controls the ScouseTom System
- __Debug_Phantom__ A simple resistor phantom, used to quickly check the system is functional, as opposed to calibration
- __Dsub_Croc_Connector__ A breakout for a 37-Way Dsub connector to make it easy to solder crocdile clips to it - to connect to tanks etc.
- __Flexible_Electrode_Connector__ Connector blocks for the flexible electrodes used in epicortical studies
- __Mayo_Phantom__ Resistor Phantom matching epicortical voltages, with three switchable impedances. Used to compare hardware for EP studies
- __Parallel_CS__ Simple current source
- __ScouseTom_SwitchNetwork__ Switch network used in ScouseTom system - 37 channels, and can be daisy chained


## The ones you need to  make a ScouseTom System
The two boards you will need are __Ard Shield__ and at least one __ScouseTom_SwitchNetwork__. The [wiki page](https://github.com/EIT-team/ScouseTom/wiki/Building-ScouseTom-Boards) has some useful background for what parts require hand soldering.
