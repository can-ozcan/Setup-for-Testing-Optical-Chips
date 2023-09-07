%% Initialize JDSU SWS15101 Tunable Laser
laser = gpib('ni',0,10);
laser.InputBufferSize = 5e6;
laser.OutputBufferSize = 5e6;
fopen(laser);
%clrdevice(laser);
set(laser,'TimeOut',1);

set(laser,'TimeOut',1);
fprintf(laser,'l=1550');
fprintf(laser,'p=3');
fprintf(laser,'enable');

