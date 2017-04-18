#define PUL 9
#define DIR 8
#define motorCW 0
#define motorACW 1
#define motorStop 2
#define LOWSPEED 1000
#define MIDDLESPEED 500
#define HIGHSPEED 100


int motorMode = motorCW;
int motorSpeed = LOWSPEED;
char command;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  // Set the port function, output or input.
  pinMode(DIR, OUTPUT);
  pinMode(PUL, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  while(Serial.available() > 0) {
    command = Serial.read();
    if (command == 'A') {
      motorMode = motorACW;
      motorSpeed = LOWSPEED;
    }
    else if(command == 'B') {
      motorMode = motorCW;
      motorSpeed = LOWSPEED;
    }
    else if(command == 'C') {
      motorMode = motorACW;
      motorSpeed = MIDDLESPEED;
    }
    else if(command == 'D') {
      motorMode = motorCW;
      motorSpeed = MIDDLESPEED;
    }
    else if(command == 'E') {
      motorMode = motorACW;
      motorSpeed = HIGHSPEED;
    }
    else if(command == 'F') {
      motorMode = motorCW;
      motorSpeed = HIGHSPEED;
    }
    else if(command == 'S') {
      motorMode = motorStop;
    }
    delay(5);
  }
  
  if (motorMode == motorCW) {
    digitalWrite(DIR, HIGH);
    digitalWrite(PUL, HIGH);
    delayMicroseconds(100);
    digitalWrite(PUL, LOW);
    delayMicroseconds(motorSpeed - 100);
  }
  else if (motorMode == motorACW){
    digitalWrite(DIR, LOW);
    digitalWrite(PUL, HIGH);
    delayMicroseconds(100);
    digitalWrite(PUL, LOW);
    delayMicroseconds(motorSpeed - 100);
  }
  else {
    digitalWrite(DIR, LOW);
    digitalWrite(PUL, LOW);
    delayMicroseconds(LOWSPEED);
  }
}
