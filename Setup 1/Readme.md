Setup 1 works as follows:
- The fibers are aligned with the chip manually prior to the measurement.
- Once the Matlab script starts running, the polarization controller will adjust itself to the TE or TM poisiton.
- For each wavelength, the readings of photodiodes 1, 2, and 3 are captured.
- The measurement will be repeated for the other polarization.

Setup 1 has excellent repeatability and is agnostic to the power and polarization of the input laser. It works as follows:
- The tunable laser sweeps wavelengths within desired range and step size.
- The fiber-based power splitter samples ~10% of the input power.
- The photodiodes 2 and 3 measure the transmitted light through the chip.
- The ratio of the measured powers on photodioe 1 and the other photodioes are insensitive to laser power and polarization.
- The polarization beam splitter at the output side ensures the depolarized portion of the light is filtered.

<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/811927f6-8943-4ca9-8cee-de56ccfd630c" width=70% height=70%>
</p>

The workflow for the measurement procedure is shown below. I do not present the wiring diagram for the arduino, stepper motor driver, and the rotating stage here, since wiring depends on the model of these devices.
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/b5eb1a31-3e6c-4ee7-837a-cc51f35388ba" width=70% height=70%>
</p>

One should be careful while choosing the spot size for their experiments since the alignment tolerances are strongly dependent on the spot size. A smaller spot size typically allows lower coupling losses at the cost of more difficult alignment procedure:
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/b2f46730-0b7b-4b42-a4f0-ba0a265035df" width=75% height=75%>
</p>
