# Stimulator Calibration
This labview code measures the output from the Vstim pin, for a range of potentiometer values. From this it is possible to obtain a calibration curve, `VstimCal.mat` in the `resources` folder. The matlab software uses these values to convert the user desired voltage 3-10V to an 8bit value for the pot.

Run this code in conjunction with the arduino code `PulseOutCalibrate`. 
