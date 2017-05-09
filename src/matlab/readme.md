# Matlab code
---
This code handles the communication with the ScouseTom. The most important three functions are `ScouseTom_Init`, `ScouseTom_SendSettings` and `ScouseTom_Start`.

```
[Ard]=ScouseTom_Init('COM13'); %Initialise system with COM port
[Ard,ExpSetup,ok]=ScouseTom_SendSettings(Ard,ExpSetup); % send the settings to the system and check them
[Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,NoPrompt); % Start injection
```
