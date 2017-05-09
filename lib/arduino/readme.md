# Arduino Libraries
Current only the `PCBPins`. The arduino code is too full of self references at the moment to be able to split it up into other parts

# How to reference in platformio
Point to *this* directory in the config file `platformio.ini`. Like so :
```
[platformio]
src_dir = .
lib_dir = ../../../lib/arduino
```
