#include "Motor.h"
using namespace std;


int main() {
	char command;
	class Motor motor1("/dev/ttyACM0");
	class Motor motor2("/dev/ttyACM1");
	class Motor motor3("/dev/ttyACM2");
	while((command = getchar())!= '\0') {
		motor1.turn(command);
		motor2.turn(command);
		motor3.turn(command);
		usleep(1000);
	}
	return 0;
}