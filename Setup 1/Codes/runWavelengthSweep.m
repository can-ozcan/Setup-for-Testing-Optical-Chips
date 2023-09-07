fprintf(laser,'apcoff');
fprintf(laser,'i=135');
pause(0.5);

count0 = 0;
count1 = 0; % to count how many read-from-device errors occur

if pol == 1
    pm2_pol = pm3;
else
    pm2_pol = pm2;
end

cnt = 0;
errorwavelengths = [];
for wavelength =  1:length(wl)
    cnt = cnt + 1;
    % set laser wavelength
    lasercommand = sprintf('l=%4.3f',wl(cnt));
    fprintf(laser, lasercommand);
    %     fprintf(laser,'p=5');
    pause(0.05);
    %     wl(cnt)
    
    % send query command to laser until getting a number back
    dummy = NaN;
    while  isnan(dummy)
        fprintf(laser,'L?');
        %         pause(0.05);
        pause(0.02);  %%%%% Changed this
        dummy = fscanf(laser);
        dummy = str2double(dummy(3:end));
    end
    
    if abs(dummy - wl(cnt)) > 0.01
        fprintf(laser, lasercommand);
        %         pause(0.02);
        pause(0.01); %%%%% Changed this
        fprintf(laser,'L?');
        %         pause(0.07);
        pause(0.01); %%%%% Changed this
        dummy = fscanf(laser);
        dummy = str2double(dummy(3:end));
        whilecnt = 0;
        while isnan(dummy) && whilecnt<4
            whilecnt = whilecnt + 1;
            fprintf(laser, lasercommand);
            dummy = fscanf(laser);
            dummy = str2double(dummy(3:end));
            if isnan(dummy)
                pause(1.0);
                "Problem with wavelength tuning"
            end
        end
    end
    
    powerreadingdone = 0;
    powercnt = 0;
    avg_cnt = 0;
    avg_power1 = zeros(naverage,1);
    avg_power2 = zeros(naverage,1);
    while powerreadingdone == 0 && powercnt < 200
        powercnt = powercnt + 1;
        pause(0.01);
        %         while true
        fprintf(pm1,'D?');
        fprintf(pm2_pol,'D?');
        %             fprintf(pm1,'Q?');
        %             fprintf(pm2_pol,'Q?');
        dummy_pm1 = fscanf(pm1);
        dummy_pm2 = fscanf(pm2_pol);
        dummy_pm1 = str2double(dummy_pm1);
        dummy_pm2 = str2double(dummy_pm2);
        %         end
        if (~(isnan(dummy_pm1) || isnan(dummy_pm2)))
            if (dummy_pm2/dummy_pm1 < 10) && (dummy_pm2/dummy_pm1 > 1e-5) % Valeus are changed for now
                avg_cnt = avg_cnt + 1;
                avg_power1(avg_cnt) = dummy_pm1;
                avg_power2(avg_cnt) = dummy_pm2;
                if avg_cnt == naverage
                    powerreadingdone = 1;
                    power1(cnt) = mean(avg_power1);
                    power2(cnt) = mean(avg_power2);
                end
            else
                %                 pause(0.1);
                pause(0.01); %%%%% Changed this
            end
        end
        %         pause(0.02);
    end
    
    % check to record data or not
    if (isnan(power1(cnt)) || isnan(power2(cnt)))
        count1 = count1+1; % count of errors
        errorwavelengths = [errorwavelengths, wl(cnt)];
        %         pause(0.04);
    end
    %     pause(stime); % dwell time
    % update figure
    if mod(cnt,60) == 1
        fh1 = figure(3+pol);
        x = 1:cnt;
        plot(wl(x), 10*log10(power2(x)./power1(x)./ calibration(x)));
        %         plot(wl(x), (power2(x)./power1(x)./ calibration(x)) );
        %         ylim([-2.5 0])
    elseif cnt == length(power2)
        fh1 = figure(3+pol);
        x = 1:cnt;
        plot(wl(x), 10*log10(power2(x)./power1(x)./ calibration(x)));
        %         plot(wl(x), (power2(x)./power1(x)./ calibration(x)) );
        %         ylim([-2.5 0])
    end
    if mod(cnt,5) == 1
        [wl(cnt)/10, 10*log10(power2(cnt)./power1(cnt) ./ calibration(cnt)), 100*cnt/length(wl)]
    end
    
end