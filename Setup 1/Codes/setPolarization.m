
% delete(instrfindall); % it is a good practice that we call this

% here we define the main communication parameters
arduino = serial('COM6','BaudRate',9600,'DataBits',8);    
% arduino = serialport('COM6',9600,'DataBits',8);    

% Comments: We create a serial communication object on port COM4
% in your case, the Ardunio microcontroller might not be on COM4, to
% double check, go to the Arduino editor, and on click on "Tools". Under the "Tools" menu, there
% is a "Port" menu, and there the number of the communication port should
% be displayed

% Define some other parameter, check the MATLAB help for more details 
InputBufferSize = 11;
Timeout = 15;
set(arduino , 'InputBufferSize', InputBufferSize);
set(arduino , 'Timeout', Timeout);
set(arduino , 'Terminator', 'CR');
% Now, we are ready to go:

fopen(arduino); % initiate arduino communication
pause(1.3)

currentmotorposition = dlmread('CurrentMotorPosition.txt');

motorspeed = 1000;
if currentmotorposition==0 && polarization{1} == string(['TE'])
    motordir = 0;
    motorsteps = 0;
    setpol = 1;
elseif currentmotorposition==90 && polarization{1} == string(['TM'])
    motordir = 0;
    motorsteps = 0;
    setpol = 2;
elseif currentmotorposition==0 && polarization{1} == string(['TM'])
    motordir = 0;
    motorsteps = 9000;
    setpol = 2;
elseif currentmotorposition==90 && polarization{1} == string(['TE'])
    motordir = 1;
    motorsteps = 9000;
    setpol = 1;
end

X = (sprintf('%d%04d%04d%d>', motordir,motorsteps,motorspeed,setpol))
% sendstring = num2str([motordir,motorsteps,motorspeed,setpol]);
% sendstring = sendstring(find(~isspace(sendstring)));
% sendstring = append(sendstring, '>');
% X = "1900010001>"
fprintf(arduino,X)

% 'A BCDE FGHI J>'
% where 
% A- is the direction- A  in {0,1}
% BCDE- a sequence of numbers defining the number of steps (1<steps<9999)
% FGHI is the speed of the motor, steps/sec (1<speed<999)
% J- is the polarization - I in {1,2}, 1 for TE, 2 for TM
% > - is the end marker

% if polarization{1} == string(['TM'])
%     fprintf(arduino,'0900010002>') %send the control sequence, '0'- direction, '599'- number of steps, '>'- end marker
% else
%     fprintf(arduino,'1900010001>') 
% end

% Let us see did Arduino microcontroller receive the sequence (only the number of steps)
y=fscanf(arduino,'%f')
%sss=fgets(arduino)
% Close the communication port
fclose(arduino);


if polarization{1} == string(['TE'])
    currentmotorposition=0;
elseif polarization{1} == string(['TM'])
    currentmotorposition=90;
end

dlmwrite('CurrentMotorPosition.txt', currentmotorposition);

