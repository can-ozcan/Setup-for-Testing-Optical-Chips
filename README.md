# Setup-for-Testing-Optical-Chips
This repository describes my optical setups for testing optical chips with edge couplers.

The advantages of these setups are:
- Transmission measurements are not affected by power and polarization fluctuations of the laser.
- The polarization control and the data collection is automated.
- High repeatability with very low variation (~ 0.02 dB) between separate measurements.

The setups use the following equipment:
- 3 photodiodes and 3 powermeters **OR** an Optical Spectrum Analyzer (OSA). (Photodiodes: Newport 818IR, OSA: Agilent 86142B)
- A tunable laser (1460-1600 nm) **OR** a broadband source (centered at 1550 nm, 3 dB bandwidth of 45 nm). (Broadband source: Thorlabs S5FC1005S).
- Waveplate and linear polarizer for polarization control of the input beam.
- Tapered fibers for light coupling (OzOptics TPMJ-3A-1550-8/125-0.25-7-5-26-2-AR)
- 50:50 and 90:10 polarization manintatining fiber optical power splitters (OzOptics FUSED-22-1550-9/125-90/10-3A3A3A3A-1-1 and FUSED-12-1550-8/125-50/50-3A3A3A-1-1-PM).
- A 2x2 fiber optical switch (Mouser, Product no: 538-OFMS2200ES05111).
- A fiber-based polarization beam splitter (OzOptics FOBS-12N-111-8/125-PPP-1550-PBS-60-3A3A3A-1-1).
- A very stable light coupling stage for edge couplers (Luminos).
- An Arduino to control polarization controller and the optical switch (Arduino Mega).
- Polarization maintatining fibers, fiber connectors.

The diagrams for the optical measurement setups are provided, along with the scripts (Matlab and Arduino) for serial instrument control and data collection. Although this setup was built with relatively old equipment, the methodology can be applied with similar equipment with slight modifications.

I aim this repository to be a guide for future PhD/Master's students, as well as anyone who is planning to build their own setups to characterize their optical chips.

I have 2 setups to present:
- Setup 1 is to be used with a tunable laser and photodiodes. It provides excellent repeatability, and it is agnostic to laser power and polarization.
- Setup 2 is to be used with a broadband source and an optical spectrum analyzer (and optionally photodiodes). It provides rapid measurements, excellent for characterizing resonators, interferoemeters, and sensors. However, it might suffer from power and polarization fluctuations of the source.

Examples of measurement results achieved with these setups:
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/c339c149-6b49-45e1-b221-dbd804918377" width=75% height=75%>
</p>

&nbsp;

Setup 1:
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/803dd947-ea16-48cc-b449-51848ea8cc0f" width=75% height=75%>
</p>

&nbsp;

&nbsp;

Setup 2:
<p align="center">
  <img src="https://github.com/can-ozcan/Setup-for-Testing-Optical-Chips/assets/87956141/19cdbcd5-6b34-46af-a884-486bca2fd9e1" width=75% height=75%>
</p>
