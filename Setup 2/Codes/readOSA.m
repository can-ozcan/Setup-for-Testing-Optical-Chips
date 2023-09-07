sensitivity = max([10*log10(power2/1e-3) - 50, -80]); %in dBm
sensitivity = -80; %in dBm
fprintf(osa,['sens:pow:dc:rang:low ',num2str(sensitivity),'dbm']);
fprintf(osa,'*OPC?');
fscanf(osa);

yi = [];
for i1=1:1
    fprintf(osa,'init:imm;*OPC?'); % take a sweep
    fscanf(osa);
    fprintf(osa,'form ascii');
    fprintf(osa,'trace:data:y? tra');
    yi = [yi,fscanf(osa,['%f',','])];
    fprintf(osa,'sens:wav:star?');
    ld1 = str2double(fscanf(osa));
    fprintf(osa,'sens:wav:stop?');
    ld2 = str2double(fscanf(osa));
    fprintf(osa,'sens:swe:poin?');
    nld = str2double(fscanf(osa));
end
ymean = mean(yi,2);
ysd = std(yi,0,2);
wavelength = transpose(linspace(ld1,ld2,nld));
