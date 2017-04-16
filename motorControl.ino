#define PUL 9
#define DIR 8
#define motorCW 0
#define motorACW 1
#define motorStop 2

int motorMode = motorCW;
int _step = 0;
int targetStep = 0;
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
    if (command == 'L') {
      motorMode = motorACW;
      //360°
      targetStep = 6400;
    }
    else if(command == 'R') {
      motorMode = motorCW;
      targetStep = 6400;
    }
    else if(command == 'S') {
      motorMode = motorStop;
      targetStep = 0;
    }
    else if (command == 'l') {
      motorMode = motorACW;
      targetStep = 1600;
    }
    else if (command == 'r') {
      motorMode = motorCW;
      targetStep = 1600;
    }
    delay(5);
  }
  if (_step == targetStep) {
    motorMode = motorStop;
    _step = 0;
  }
  if (motorMode == motorCW) {
    digitalWrite(DIR, HIGH);
    digitalWrite(PUL, HIGH);
    delayMicroseconds(100);
    digitalWrite(PUL, LOW);
    delayMicroseconds(500 - 100);
    _step++;
  }
  else if (motorMode == motorACW){
    digitalWrite(DIR, LOW);
    digitalWrite(PUL, HIGH);
    delayMicroseconds(100);
    digitalWrite(PUL, LOW);
    delayMicroseconds(1000 - 100);
    _step++;
  }
  else {
    analogWrite(PUL, 0);
  }
}
