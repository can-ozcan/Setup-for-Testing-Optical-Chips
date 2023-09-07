
tic; % start timer
wl = linspace(startLd, stopLd, ldPoints);
% dumpbuffers;
clc;
setPolarization; % adjusts the motorized polarizer, fiber switch, electronically controlled waveplate
readPowermeters; % reads the power at the input and output powermeters
readOSA; % take a measurement with the OSA (takes about ~10 seconds)
plotMeasurementResults; % plot the OSA spectrum
% filename = append('Y140_MZI_', polarization{1}); % File name
% filename = append('Calibration_Taper2Taper1_', polarization{1}); % File name
% filename = append('Calibration_Fiber2Fiber_', polarization{1}); % File name

% filename = append('3dBCouplerRib57_MZI_NN_N_', polarization{1}); % File name


saveData; % write data to a text file

% make a sound when measurements are done
% load handel;
% sound(y(1:1000), Fs);

timeelapsed = toc; % stop timer
timeelapsed = timeelapsed/60 % duration of the measurement in seconds

