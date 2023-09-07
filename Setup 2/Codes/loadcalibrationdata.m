try
    if polarization{1} == string(['TE'])
        X = sprintf('Calibration_Taper2Taper2_TE_%d.txt', wavelengthrange);
        calibrationdata = dlmread(X);
    elseif polarization{1} == string(['TM'])
        X = sprintf('Calibration_Taper2Taper2_TM_%d.txt', wavelengthrange);
        calibrationdata = dlmread(X);
    end
    
    ycalibration = interp1(calibrationdata(3:end, 1), calibrationdata(3:end, 2), wavelength/1e-9);
    
catch
    ycalibration = 0*wavelength;
end
