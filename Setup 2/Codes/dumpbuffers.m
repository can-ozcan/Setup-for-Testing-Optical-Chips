
% dump power meters buffers
devices = instrfind();
for i1=1:length(devices)
    if sum(devices(i1).PrimaryAddress == [5,6,7,8])>0
        for i2=1:5
            fprintf(devices(i1),'D?'); pause(0.1);
            dummy = fscanf(devices(i1));
        end
    end
    
    if devices(i1).PrimaryAddress == 10
        for i2=1:5
            fprintf(devices(i1),'L?'); pause(0.1);
            dummy = fscanf(devices(i1));
        end
    end
end