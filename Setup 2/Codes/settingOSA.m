% startLd = 1530;
% stopLd = 1570;
% resLd = 0.06;
% ldPoints = 5*round((stopLd-startLd))/resLd+1;
% ldPoints = 10001;
% swpTime = 10000; %in ms
% sensitivity = -0; %in dBm

fprintf(osa,'syst:comm:gpib:buff on'); % Turn the GPIB input buffer on and allow parallel command execution
fprintf(osa,['sens:wav:star ',num2str(startLd),'nm']);
fprintf(osa,['sens:wav:stop ',num2str(stopLd),'nm']);
fprintf(osa,['sens:bwid:res ',num2str(resLd),'nm']);
fprintf(osa,['sens:swe:poin ',num2str(ldPoints)]);
fprintf(osa,['sens:swe:time ',num2str(swpTime),'ms']);
fprintf(osa,['sens:pow:dc:rang:low ',num2str(sensitivity),'dbm']);
fprintf(osa,'*OPC?');
fscanf(osa);