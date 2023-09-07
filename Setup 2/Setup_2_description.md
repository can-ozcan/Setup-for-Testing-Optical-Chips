Setup 2 works as follows:
- The fibers are aligned with the chip manually prior to the measurement.
- Once the Matlab script starts running, the polarization controller will adjust itself to the TE or TM poisiton.
- The optical spectrum analyzer captures the spectrum at the output.
- The measurement will be repeated for the other polarization.

Setup 2 takes around a few seconds for each measurement (~200 nm bandwidth with 10000 data points, very high sensitivity). 
- The fiber-based power splitter samples ~10% of the input power.
- The ratio of the measured powers on photodioe 1 and the other photodioes are insensitive to laser power and polarization.
- The polarization beam splitter at the output side ensures the depolarized portion of the light is filtered.

![Setup 2](https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/d2f86d34-889f-4701-bc7f-fd4b8cc71cfa)

One should be careful while choosing the spot size for their experiments since the alignment tolerances are strongly dependent on the spot size. A smaller spot size typically allows lower coupling losses at the cost of more difficult alignment procedure:
![Misalignment](https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/5a400865-c8db-4a9a-be6b-8ae7ad1ab634)
