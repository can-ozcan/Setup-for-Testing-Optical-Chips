% OSA settings
osa = gpib('ni',0,23);
osa.InputBufferSize = 1000000;
set(osa,'TimeOut',40);

fopen(osa);
fprintf(osa,'*RST');
fprintf(osa,'*OPC?');
fscanf(osa);
