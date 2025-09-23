#include <chrono>
#include <iostream> 
#include "stopwatch.h"
#include <string>
#include <format>

using namespace std;

void Stopwatch::start() {
    start_time = std::chrono::steady_clock::now();
    
}

void Stopwatch::stop() {
    end_time = std::chrono::steady_clock::now();
}

string Stopwatch::elapsedSeconds() const {
    double time_passed = std::chrono::duration<double>(end_time - start_time).count();
    cout << time_passed << endl;
    int minutes = static_cast<int>(time_passed / 60);
    double seconds = time_passed - (minutes * 60);
    return std::format("{} minutes {:.2f} seconds", minutes, seconds);
}