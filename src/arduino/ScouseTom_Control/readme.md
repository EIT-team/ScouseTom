# ScouseTom Controller Software

This is the code you want!

### IDE
Arduino IDE sucks. I suggest you use a proper IDE to look at this - Visual Basic with Visual Micro is good.
### Debugging
All communication is done via serial, and uses readable ascii rather than binary values.

### Compiling
Recommend using __Platformio__ which can compile using a library directory. Upload using `platformio run -t upload` or if you have changed the platformio.ini just `platformio run`

__I hate this, I just want to use the Arduino IDE__

Then copy `PCBpins.h` from `lib` folder into this directory and upload.
