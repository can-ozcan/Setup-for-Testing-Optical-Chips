clc;
clear all
format long
pause on;

c = 299792458;
p = 1.0;

startLd = 1500;
stopLd = 1600;
resLd = 0.06;
% ldPoints = 5*round((stopLd-startLd))/resLd+1;
ldPoints = 10001;
swpTime = 8000; %in ms
sensitivity = -60; %in dBm

initializeOSA;
settingOSA;
initializePowermeters;

%% Run Measurements
close all

nMeasurements = 1;

for nmeasure = 1:nMeasurements
    for polarization = {'TE','TM'}
        for wavelengthrange = 1:4
            if wavelengthrange == 1
                startLd = 1450;
                stopLd = 1500;
                settingOSA;
            elseif wavelengthrange == 2
                startLd = 1500;
                stopLd = 1550;
                settingOSA;
            elseif wavelengthrange == 3
                startLd = 1550;
                stopLd = 1600;
                settingOSA;
            elseif wavelengthrange == 4
                startLd = 1600;
                stopLd = 1650;
                settingOSA;
            end
%             filename = append('Y140_MZI_', polarization{1}); % File name
            filename = append('Calibration_Taper2Taper2_', polarization{1}); % File name
%             filename = append('Calibration_Fiber2Fiber_', polarization{1}); % File name
%             filename = append('3dBCouplerRib51_MZI_NS_', polarization{1}); % File name
%             filename = append('3dBCouplerRib57_MZI_SS_N_', polarization{1}); % File name
            runMeasurement;
        end
    end
end

polarization = {'TE'};
setPolarization;
load handel;
sound(y(1:4000), Fs);

%%

% Scanning and detecting power


% calibrationfile = 'Calibration_Fiber2Fiber_TM_3.txt';
% % calibrationfile = 'LC_30_0_opt_S_TE_6.txt';
% calibrationdata = dlmread(calibrationfile);
% calibration = interp1(calibrationdata(:,1), smooth(calibrationdata(:,2),11), wl);
% % calibration = repmat(1, size(power1));





% filename = ['LC_15_0_opt_S_TM_1550nm'];
% filename = ['Calibration_Fiber2Fiber_TE_Y'];
% filename = ['LC_15_0_opt_S_FSR_TE'];
% filename = ['RR_SWGS_1_S_TM'];
% filename = ['DC_Strip_3_S_TM'];
% filename = ['Convertor_Strip2SWGS_10_N_TE'];
% filename = ['WG_Slot_2_S_TE_FSR'];
% filename = ['RR3um_SWGS_1_TE'];

% filename = ['YBranch_MZI_120_TE'];


% filename = ['DC_strip_0_S_FSR_TE'];




