Follow these steps to run the measurement procedure:
1. Load the arduino code to Arduino Mega (or whichever Arduino is being used).
2. Plug in the serial bus controller (National Instruments) to the computer.
3. Run the first section of mainRun.m. This will initialize all the devices (laser and powermeters). If there is an error, one or more of the equipment might be off or the serial adresses might be wrong in the matlab script.
4. Run the second section of the code to take measurements. Measurements will run and the data will be saved to a text file. To take measurements again, keep running the second section only.
