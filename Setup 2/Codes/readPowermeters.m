naverage = 8;
powerreadingdone = 0;
powercnt = 0;
avg_cnt = 0;
avg_power1 = zeros(naverage,1);
avg_power2 = zeros(naverage,1);
while powerreadingdone == 0 && powercnt < 200
    powercnt = powercnt + 1;
    pause(0.04);
    %         while true
    fprintf(pm1,'D?');
    fprintf(pm2,'D?');
    %             fprintf(pm1,'Q?');
    %             fprintf(pm2,'Q?');
    dummy_pm1 = fscanf(pm1);
    dummy_pm2 = fscanf(pm2);
    dummy_pm1 = str2double(dummy_pm1);
    dummy_pm2 = str2double(dummy_pm2);
    %         end
    if (~(isnan(dummy_pm1) || isnan(dummy_pm2)))
        if (dummy_pm2/dummy_pm1 < 7) && (dummy_pm2/dummy_pm1 > 1e-7) % Valeus are changed for now
            avg_cnt = avg_cnt + 1;
            avg_power1(avg_cnt) = dummy_pm1;
            avg_power2(avg_cnt) = dummy_pm2;
            if avg_cnt == naverage
                powerreadingdone = 1;
                power1 = mean(avg_power1);
                power2 = mean(avg_power2);
            end
        else
            pause(0.01);
        end
    end
end