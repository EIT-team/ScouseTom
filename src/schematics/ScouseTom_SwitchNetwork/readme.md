# SwitchBoard

![SwitchBoard](https://raw.githubusercontent.com/EIT-team/ScouseTom/master/doc/figures/Components/SwitchBoard.png)

The switchboard connects the source and sink connections of the Keithley 6221 ( the + and - pins) to any two electrodes out of the 37 connections on the DSub.

### Powering the board
The board is powered by a Lipo battery, and a charging circuit is included.

### Daisy Chaining
The control signals to set the switches come from either the `Arduino in` Dsub9, in which case they pass through the Isolators, or the `Daisy Chain in` Dsub9. These are selected by the jumpers labelled `Daisy Chain ON/OFF`

![ScouseTom System blocks](https://raw.githubusercontent.com/EIT-team/ScouseTom/master/doc/figures/blocks.png)
