clc;
clear all
format long
pause on;

c = 299792458;
p = 1.0;

ld1 = 1550;  % start wavelength
ld2 = 1555;  % stop wavelength
step = 0.02;  % step wavelength

wl = [ld1:step:ld2]';
naverage = 6; % number of measurements to average

initializeLaser;
initializePowermeters;

%% Run Measurements
clc;
format long

for polarization = {'TE', 'TM'}
    tic
    setPolarization;
    
    if polarization{1} == string(['TE'])
        pol = 1;
    else
        pol = 2;
    end
    
    % initialize data capturers
    power1 = zeros(size(wl))*NaN;
    power2 = power1;
    power3 = power1;
    
    % set the laser to start wavelength
    fprintf(laser,['l=',num2str(ld1)]);
    
    loadcalibrationdata;
    
%     dumpbuffers;
    
    runWavelengthSweep;
       
    filename = ['LC_15_0_opt_S_TM_1550nm'];
    % filename = ['Calibration_Fiber2Fiber_TM_FSR'];
    % filename = ['LC_15_0_opt_S_FSR_TE'];
    % filename = ['RR_Strip_3_N_TE'];
    % filename = ['DC_Strip_0_N_TE'];
    % filename = ['Convertor_Strip2SWGS_10_N_TE'];
    % filename = ['WG_Slot_2_S_TE_FSR'];
    % filename = ['RR3um_SWGS_1_TE'];
    
    saveData;

    timeelapsed = toc
    timeelapsed = timeelapsed/60
    
    
end

set(laser,'TimeOut',1);
fprintf(laser,'l=1550');
fprintf(laser,'enable');

load handel
sound(y(1:5000), Fs)
polarization = {'TE'};
setPolarization;
