#include <chrono>
#include <String>

class Stopwatch {
public:
	void start();
	void stop();
	std::string elapsedSeconds() const;
private:
	std::chrono::steady_clock::time_point start_time;
	std::chrono::steady_clock::time_point end_time;
};
