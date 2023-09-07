loadcalibrationdata;

ymeanplot = ymean - ycalibration;

figure
plot(wavelength/1e-9,ymeanplot)
xlim([startLd stopLd])

% figure (3)
% plot(wavelength/1e-9,ysd)
% xlim([startLd stopLd])

% figure; plot(wavelength/1e-9,ysd);
% 1e9*(wavelength(5001) - wavelength(5000));

% fh1 = figure(3);
% x = 1:cnt;
% plot(wl(x), 10*log10(power2./power1./ calibration(x))/2 + loss(x)'*0.85/2);
   
% [wl(cnt)/10, 10*log10(power2./power1 ./ calibration(cnt))/2 + loss(cnt)'/2, 100*cnt/length(wl)]
