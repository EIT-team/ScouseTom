# Arduino Firmware
---
## Arduino Versions
Uses the `Arduino SAM` library, so ensure you have that installed under `boards manager` in the arduino IDE (if you are using that). Set the __Board__ to `Arduino Due (Programming Port)`

## Platformio - compile and upload in command line
We use the tool [Platformio](http://platformio.org/get-started) as you can use it with jenkins easier. Plus you can compile libraries easier. Make sure this is up to date with
```
platformio update
platformio upgrade
```

## ScouseTom Controller
The most important project is `ScouseTom_Control`, which is the firmware necessary to use the system for EIT recordings.

### Other Projects

- __FreqSweep__ Simple code which injects performs a frequency sweep at constant amplitude, with a reference pulse when switching
- __MultiStim__ Controller for two ADG426 switches for higher voltages
- __PulseOutCalibrate__ Code to generate calibration curve for stimulator voltage
