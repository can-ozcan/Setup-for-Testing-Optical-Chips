# Setup-for-Testing-Optical-Chips
This repository describes my optical testing setup for optical chips with edge couplers.

The advantages of this setup is:
- Transmission measurements are not affected by power and polarization fluctuations of the laser.
- The polarization control and the data collection is automated.
- High repeataility with very low difference (~ 0.02 dB) in separate measurements.

The setup uses the following:
- 3 photodiodes and 3 powermeters
- A tunable laser (1460-1600 nm)
- A broadband source (centered at 1550 nm, 3 dB bandwidth of 45 nm)
- Waveplate and linear polarizer for polarization control of the input beam.
- 50:50 and 90:10 polarization manintatining fiber optical power splitters
- A 2x2 fiber optical switch
- A fiber-based polarization beam splitter
- A very stable edge coupling stage (Luminos)
- An Arduiono to control polarization controller and the optical switch
- Polarization maintatining fibers, fiber connectors

The diagrams for the optical measurement setups are provided, along with the scripts (Matlab and Arduino) for serial instrument control and data collection. Although this setup was built with relatively old equipment, the methodology can be applied with similar equipment with slight modifications.

I aim this repository to be a guide to future PhD/Master's students, as well as anyone who is planning to build their own setups to characterize their optical chips.
