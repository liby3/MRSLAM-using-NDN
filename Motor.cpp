#include "Motor.h"

Motor::Motor(char *portname) {
	//char *portname = "/dev/ttyACM0";
    fd = open (portname, O_RDWR | O_NOCTTY | O_SYNC);
    if (fd < 0) {
        printf("error %d opening %s: %s", errno, portname, strerror (errno));
        return;
    }
    set_interface_attribs (fd, B9600, 0);
    set_blocking (fd, 0);
}


void Motor::turn(char command) {
	switch(command) {
		case 'A':
			turnACWLow();
			break;
		case 'B':
			turnCWLow();
			break;
		case 'C':
			turnACWMiddle();
			break;
		case 'D':
			turnCWMiddle();
			break;
        case 'E':
            turnACWHigh();
            break;
        case 'F':
            turnCWHigh();
            break;
        case 'S':
            stop();
            break;
		default:
			break;
	}
}


void Motor::turnCWLow() {
	write(fd, "B", 1);
	usleep(1000);
}


void Motor::turnCWMiddle() {
	write(fd, "D", 1);
	usleep(1000);
}


void Motor::turnCWHigh() {
	write(fd, "F", 1);
	usleep(1000);
}


void Motor::turnACWLow() {
	write(fd, "A", 1);
	usleep(1000);
}


void Motor::turnACWMiddle() {
    write(fd, "C", 1);
    usleep(1000);
}


void Motor::turnACWHigh() {
    write(fd, "E", 1);
    usleep(1000);
}


void Motor::stop() {
    write(fd, "S", 1);
    usleep(1000);
}


Motor::~Motor() {
	;
}


void Motor::set_blocking (int fd, int should_block) {
    struct termios tty;
    memset (&tty, 0, sizeof tty);
    if (tcgetattr (fd, &tty) != 0) {
            printf ("error %d from tggetattr", errno);
            return;
    }

    tty.c_cc[VMIN]  = should_block ? 1 : 0;
    tty.c_cc[VTIME] = 5;

    if (tcsetattr (fd, TCSANOW, &tty) != 0)
        printf ("error %d setting term attributes", errno);
}


int Motor::set_interface_attribs (int fd, int speed, int parity) {
    struct termios tty;
    memset (&tty, 0, sizeof tty);
    if (tcgetattr (fd, &tty) != 0) {
        printf ("error from tcgetattr", errno);
        return -1;
    }

    cfsetospeed (&tty, speed);
    cfsetispeed (&tty, speed);

    tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;
    tty.c_iflag &= ~IGNBRK;
    tty.c_lflag = 0;

    tty.c_oflag = 0;
    tty.c_cc[VMIN]  = 0;
    tty.c_cc[VTIME] = 5;

    tty.c_iflag &= ~(IXON | IXOFF | IXANY);

    tty.c_cflag |= (CLOCAL | CREAD);
    tty.c_cflag &= ~(PARENB | PARODD);
    tty.c_cflag |= parity;
    tty.c_cflag &= ~CSTOPB;
    tty.c_cflag &= ~CRTSCTS;

    if (tcsetattr (fd, TCSANOW, &tty) != 0) {
        printf ("error %d from tcsetattr", errno);
        return -1;
    }
    return 0;
}