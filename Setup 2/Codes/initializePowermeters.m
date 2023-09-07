%% Initialize Power Meters
% Input
pm1 = gpib('ni',0,9);
pm1.InputBufferSize = 5e6;
pm1.OutputBufferSize = 5e6;
fopen(pm1);
set(pm1,'TimeOut',1);
fprintf(pm1,'C');
fprintf(pm1,'W1550');
fprintf(pm1,'U1'); % U1 for Watts, U3 for dBm
fprintf(pm1,'F2'); % 1 slow averaging, 2 Medium averaging, 3 no averaging
fprintf(pm1,'K2'); % backlight intensity, 2 is highest

% Output 1
pm2 = gpib('ni',0,8);
pm2.InputBufferSize = 5e6;
pm2.OutputBufferSize = 5e6;
fopen(pm2);
set(pm2,'TimeOut',1);
fprintf(pm2,'C');
fprintf(pm2,'W1550');
fprintf(pm2,'U1'); % U1 for Watts, U3 for dBm
fprintf(pm2,'F2'); % 1 slow averaging, 2 Medium averaging, 3 no averaging
fprintf(pm2,'K2'); % backlight intensity, 2 is highest

% % Output 2, when using the tunable laser, otherwise unnecessary
% pm3 = gpib('ni',0,6);
% pm3.InputBufferSize = 5e6;
% pm3.OutputBufferSize = 5e6;
% fopen(pm3);
% set(pm3,'TimeOut',1);
% fprintf(pm3,'C');
% fprintf(pm3,'W1550');
% fprintf(pm3,'U1'); % U1 for Watts, U3 for dBm
% fprintf(pm3,'F2'); % 1 slow averaging, 2 Medium averaging, 3 no averaging
% fprintf(pm3,'K2'); % backlight intensity, 2 is highest


set(pm1,'TimeOut',1);
set(pm2,'TimeOut',1);
% set(pm3,'TimeOut',1);

pause on;