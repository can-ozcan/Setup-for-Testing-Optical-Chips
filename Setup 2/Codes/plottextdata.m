data1 = dlmread('Calibration_Taper2Taper1_TE_2.txt');
data2 = dlmread('Calibration_Taper2Taper80_TE_2.txt');
data3 = dlmread('Calibration_Taper2Taper60_TE_2.txt');

figure
plot(data1(3:end,1), data1(3:end,2))
hold on
plot(data2(3:end,1), data2(3:end,2))
plot(data3(3:end,1), data3(3:end,2))

legend

