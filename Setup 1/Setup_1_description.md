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
