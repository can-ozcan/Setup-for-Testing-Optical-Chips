Setup 2 works as follows:
- The fibers are aligned with the chip manually prior to the measurement.
- Once the Matlab script starts running, the polarization controller will adjust itself to the TE or TM poisiton.
- The optical spectrum analyzer captures the spectrum at the output.
- The measurement will be repeated for the other polarization.

Setup 2 takes a few seconds for each measurement (~200 nm bandwidth with 10001 data points, very high sensitivity). 
- The fiber-based power splitter samples ~10% of the input power to monitor if the source power is fluactuating.
- The polarization beam splitter at the output side ensures the depolarized portion of the light is filtered.
- The power reading on Photodiode 2 is used while fine-tuning the fiber positions, and is not considered after the measurements.

<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/d2f86d34-889f-4701-bc7f-fd4b8cc71cfa" width=70% height=70%>
</p>

&nbsp;

The workflow for the measurement procedure is shown below. I do not present the wiring diagram for the arduino, stepper motor driver, and the rotating stage here, since wiring depends on the model of these devices.
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/fc368037-c92b-4c20-939b-0c32074cec4a" width=70% height=70%>
</p>

One should be careful while choosing the spot size for their experiments since the alignment tolerances are strongly dependent on the spot size. A smaller spot size typically allows lower coupling losses at the cost of more difficult alignment procedure:
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/5a400865-c8db-4a9a-be6b-8ae7ad1ab634" width=75% height=75%>
</p>
