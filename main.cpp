#include "Motor.h"
using namespace std;


int main() {
	char command;
	class Motor motor;
	while((command = getchar())!= '\0') {
		motor.turn(command);
		usleep(1000);
	}
	return 0;
}