/* The Arduino code for establishing the communication between MATLAB and Arduino 

To illustrate the main ideas, we use an example of receiving the data for controlling the stepper motor. 
The Arduino code receives the sequence:

'ABCDEFGHIJ>'
where 
A- is the direction- A  in {0,1}
BCDE- a sequence of numbers defining the number of steps (1<steps<9999)
FGHI is the speed of the motor, steps/sec (1<speed<999)
J- is the polarization - I in {1,2}, 1 for TE, 2 for TM
> - is the end marker
*/

// Pins that control the stepper motor driver 
#define stppin 50
#define dirpin 52
#define MS1pin 38
#define MS2pin 42
#define MS3pin 44
#define ENpin  40
#define slppin  48
#define rstpin  46

// Pins for controlling the fiber switch
#define rly1pin  22
#define rly2pin  24
// pin to control the wave retarder
#define rly3pin  26
// pin for future use
#define rly4pin  28

const int numChar=11;        // the number of characters we want to receive 
char receivedChar[numChar]; // the array for received data
boolean newData=false;      // the indicator for new data, when new data arrives and receivedChar is filled, newData=true;
boolean fiberSwitchComplete=false;
boolean fiberSwitchSuccessful=false;

int dir=0;                  // movement direction
int distance=0;             // the number of steps
int fiberOutputSet=0;
int speed=0;
int waittime=0;
char endMarker='>';         // the end marker character                 

void setup() 
{
  Serial.begin(9600);     // we need this for serial communication
  pinMode(rly1pin, OUTPUT);
  pinMode(rly2pin, OUTPUT);
  pinMode(rly3pin, OUTPUT);
  pinMode(rly4pin, OUTPUT);
  pinMode(MS1pin, OUTPUT);
  pinMode(MS2pin, OUTPUT);
  pinMode(MS3pin, OUTPUT);
  pinMode(ENpin, OUTPUT);
  pinMode(slppin, OUTPUT);
  pinMode(rstpin, OUTPUT);
  pinMode(stppin, OUTPUT);
  pinMode(dirpin, OUTPUT);
  digitalWrite(rly1pin, HIGH);
  digitalWrite(rly2pin, HIGH);
  digitalWrite(rly3pin, HIGH);
  digitalWrite(rly4pin, HIGH);
  digitalWrite(MS1pin, LOW);
  digitalWrite(MS2pin, LOW);
  digitalWrite(MS3pin, LOW);
  digitalWrite(ENpin, HIGH);
  digitalWrite(slppin, LOW);
  digitalWrite(rstpin, LOW);
  digitalWrite(stppin, LOW);
  digitalWrite(dirpin, LOW);
}

void loop() 
{
  if(Serial.available()>0) // If something appears on the serial port, run this
   {
      record();             // fill in the array receivedChar
      execute();            // set the variables "dir" and "distance", here you can enter your code for driving the stepper motor
      fiberSwitch();        // choose the correct output with the fiber switch
      adjustWaveplate();
      if(distance>0) {
        runMotor();
      }
      readyfornext();       // clear the serial buffer, make the data flag false
      sendBack();           // this is to confirm that the code is running properly, we send back to MATLAB (or to an Arduino Serial monitor) what was received
   }
}

void record()
{
  static int index=0;  // this is the index for filling in "receivedChar", this variable does not need to be static, it can be a global variable...
  char rChar;   // received character, that is an output of Serial.read() function

  while (Serial.available()>0 && newData==false)
  {
    rChar=Serial.read();
    delay(2);
    if (rChar!=endMarker && index<=(numChar))
    { 
      receivedChar[index]=rChar;
      index++;
    }
    else
    {
       receivedChar[index]='\0';  // terminate the string 
       index=0;                   // reset the counter
       newData=true;              // set the "newData" indicator to true, meaning that the new data has arrived, and we can proceed further
    }
  }
}

void execute()
{
  // these two arrays are needed for the "atoi" function
  char tmpDir[2];   // this one stores the direction
  char tmpSteps[5]; // this one stores the number of steps
  char tmpSpeed[5]; // number of steps per second
  char tmpFiber[2]; // polarization state of the fiber

  if (newData==true)
  {
    tmpDir[0]=receivedChar[0];
    tmpDir[1]='\0';
    dir=atoi(tmpDir); //converts string to an integer,

    for(int j=0; j<=3; j++)
    {
      tmpSteps[j]=receivedChar[j+1];
    }
    tmpSteps[4]='\0';
    distance=atoi(tmpSteps);
    
    tmpSpeed[0]=receivedChar[5];
    tmpSpeed[1]=receivedChar[6];
    tmpSpeed[2]=receivedChar[7];
    tmpSpeed[3]=receivedChar[8];
    tmpSpeed[4]='\0';
    speed=atoi(tmpSpeed);  
    
    tmpFiber[0]=receivedChar[9];
    tmpFiber[1]='\0';
    fiberOutputSet=atoi(tmpFiber);     
        
    delay(5);
  }
}

void sendBack() 
{
  Serial.print(distance); // send back the distance, the number can be read from the Serial Monitor, or from MATLAB
  //Serial.print('INCOMING');
  //Serial.print(fiberOutputSet); // send back the fiber output set by the code
  //Serial.print(fiberSwitchSuccessful); // send back the fiber output set by the code
  //Serial.println(dir); // send back the direction, the number can be read from the Serial Monitor, or from MATLAB
  //Serial.print('done');
  Serial.write('\r');    // this is the 'CR' terminator for MATLAB, see the MATLAB code
}


void fiberSwitch() 
{  
  if (newData==true)
  {
    fiberSwitchSuccessful=false;
    fiberSwitchComplete=false;
    int fibercnt = 0;
    int maxfiberloop = 3; 
    while (fiberSwitchComplete==false && fibercnt < maxfiberloop)
    {
      fibercnt++;
      // read the input on analog pin 0:
      int sensorValue1 = analogRead(A0); // Pins 3-4-5
      int sensorValue2 = analogRead(A1); // Pins 8-9-10
      int fiberOutputState = 0;
      delay(10);
      //Serial.print(sensorValue1);
      if (sensorValue1<=900 && sensorValue2<=900)
      {
        fiberOutputState = 1;
        delay(30);
      }
      else if (sensorValue1>100 && sensorValue2>100)
      {
        fiberOutputState = 2;
        delay(30);
      }
      else
      {
        fiberOutputState = 3;
        delay(30);
      }

      if (fiberOutputState==fiberOutputSet)
      {
        fiberSwitchComplete=true;
        fiberSwitchSuccessful=true;
      }
      else if (fiberOutputState==3)
      {
        fiberSwitchComplete=false;        
      }
      else
      {
        changeFiberOutput();      
      }
      delay(15);
    }
  }
}

void changeFiberOutput()
{
  if (fiberOutputSet==1)
  {
    digitalWrite(rly1pin, HIGH);
    digitalWrite(rly2pin, LOW);
    delay(90);
    digitalWrite(rly1pin, HIGH);
    digitalWrite(rly2pin, HIGH);    
  }
  else if (fiberOutputSet==2)
  {
    digitalWrite(rly1pin, LOW);
    digitalWrite(rly2pin, HIGH);
    delay(90);
    digitalWrite(rly1pin, HIGH);
    digitalWrite(rly2pin, HIGH);
  }
}

void runMotor()
{
  int waittimeaccel=1;
  int extrawait = 0;
  digitalWrite(MS1pin, LOW);
  delay(10);
  digitalWrite(MS2pin, LOW);
  delay(10);
  digitalWrite(MS3pin, LOW);
  delay(10);
  digitalWrite(ENpin, LOW); // ENABLED when LOW
  delay(10);
  digitalWrite(slppin, HIGH); // when high, sleep is disabled
  delay(10);
  digitalWrite(rstpin, HIGH); // must be high for enable step inputs
  delay(40);

  waittime = 1000/float(speed)*1000/2;  // in microseconds
  if (dir==0)
  {
    digitalWrite(dirpin, LOW);
    delay(40);    
  }
  else if (dir==1)
  {
    digitalWrite(dirpin, HIGH);
    delay(40); 
  }

  for (int xj=0; xj<=distance; xj++)
  {
    extrawait = 0; //(1000*abs(distance-2*xj))/distance);
    waittimeaccel = waittime + extrawait;
    // waittimeaccel = waittime + 1000*float(3*pow((float((distance-2*xj)/distance)),6));
     
    digitalWrite(stppin, LOW);
    delayMicroseconds(1.0*waittimeaccel);
    //delayMicroseconds(500);
    digitalWrite(stppin, HIGH);
    delayMicroseconds(1.0*waittimeaccel);
    //delayMicroseconds(500);
  }
  
  //Serial.print(speed);
  //Serial.print("\n");
  //Serial.print(waittime);
  //Serial.print("\n");
  //Serial.print(waittimeaccel);
  
  digitalWrite(MS1pin, LOW);
  delay(2);
  digitalWrite(MS2pin, LOW);
  delay(2);
  digitalWrite(MS3pin, LOW);
  delay(2);
  digitalWrite(ENpin, HIGH);
  delay(2);
  digitalWrite(slppin, LOW);
  delay(2);
  digitalWrite(rstpin, LOW);
  delay(2);
  digitalWrite(stppin, LOW);
  delay(2);
  digitalWrite(dirpin, LOW);
  delay(2);
}

void adjustWaveplate()
{
  if (fiberOutputSet==2)
  {
    delay(20);
    digitalWrite(rly3pin, LOW);
    delay(20);
  }
  else if (fiberOutputSet==1)
  {
    delay(20);
    digitalWrite(rly3pin, HIGH);
    delay(20);
  }
}

void readyfornext()
{
  newData=false;
  while (Serial.available()>0)
  {
    Serial.read();
  } 
  
}