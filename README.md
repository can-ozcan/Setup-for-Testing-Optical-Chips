# Setup-for-Testing-Optical-Chips
This repository describes my optical testing setup for optical chips with edge couplers.

The advantages of this setup are:
- Transmission measurements are not affected by power and polarization fluctuations of the laser.
- The polarization control and the data collection is automated.
- High repeataility with very low difference (~ 0.02 dB) in separate measurements.

The setup uses the following:
- 3 photodiodes and 3 powermeters OR an Optical Spectrum Analyzer (OSA)
- A tunable laser (1460-1600 nm) OR a broadband source (centered at 1550 nm, 3 dB bandwidth of 45 nm)
- Waveplate and linear polarizer for polarization control of the input beam.
- 50:50 and 90:10 polarization manintatining fiber optical power splitters
- A 2x2 fiber optical switch
- A fiber-based polarization beam splitter
- A very stable edge coupling stage (Luminos)
- An Arduino to control polarization controller and the optical switch
- Polarization maintatining fibers, fiber connectors

The diagrams for the optical measurement setups are provided, along with the scripts (Matlab and Arduino) for serial instrument control and data collection. Although this setup was built with relatively old equipment, the methodology can be applied with similar equipment with slight modifications.

I aim this repository to be a guide for future PhD/Master's students, as well as anyone who is planning to build their own setups to characterize their optical chips.

I have 2 setups to present:
- Setup 1 is to be used with a tunable laser and photodiodes. It provides excellent repeatability, and it is agnostic to laser power and polarization.
- Setup 2 is to be used with a broadband source and an optical spectrum analyzer (and optionally photodiodes). It provides rapid measurements, excellent for characterizing resonators, interferoemeters, and sensors. However, it might suffer from power and polarization fluctuations of the source.



Setup 1:
![Setup 1](https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/803dd947-ea16-48cc-b449-51848ea8cc0f)





Setup 2:
![Setup 2](https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/19cdbcd5-6b34-46af-a884-486bca2fd9e1)

