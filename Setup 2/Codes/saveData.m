currentTime = datestr(now, 'mm-dd-HH:MM:SS');
timeout = str2double(regexp(currentTime,'[\d]+','match'));

transmission = power2./power1./1;
% writeData = [wl, transmission, power1, power2, calibration];
writeData = [timeout(1:5), ;...
             0, transmission, power1, power2, 0];
writeData = [writeData; wavelength*1e9, ymean, ymean-ycalibration, ysd, ysd*0];


writingdone = 0;
wrtcnt = 0;
while ~writingdone
    wrtcnt = wrtcnt + 1;
    filenametxt = append(filename, '_', num2str(wrtcnt),'.txt');
    if ~isfile(filenametxt)
        dlmwrite(filenametxt, writeData, 'delimiter', '\t', 'precision', 8);
        writingdone = 1;
    end
end
