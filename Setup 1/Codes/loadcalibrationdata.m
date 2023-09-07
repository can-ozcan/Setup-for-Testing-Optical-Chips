try
    if pol == 1
        calibrationdata = dlmread('Calibration_Taper2Taper_TE_1.txt');
    elseif pol == 2
        calibrationdata = dlmread('Calibration_Taper2Taper_TM_1.txt');
    end
    
    calibration = interp1(calibrationdata(:,1), smooth(calibrationdata(:,2),11), wl);

catch
    calibration = wl./wl;
end

