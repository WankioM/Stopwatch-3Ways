#include <iostream> 
#include "stopwatch.h"
#include "windows.h"

using namespace std; 

void setColor(int color) {
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(hConsole, color);
}

int main() {

	//create a Stopwatch object

	Stopwatch stopwatch;

	//wait for user input to call start()
	char input;

	setColor(10); // Green
	cout << "Press S to Start : ";
	cin >> input;

	if (input == 'S' || input == 's') {
		stopwatch.start();
	}

	//wait again for input to call stop()
	setColor(12); // Green
	cout << "Press X to Stop: ";
	cin >> input;

	if (input == 'X' || input == 'x') {
		stopwatch.stop();
	};


	//call elapsedSeconds() and print result
	setColor(7); // Green
	std::cout << stopwatch.elapsedSeconds();
	return 0;
}