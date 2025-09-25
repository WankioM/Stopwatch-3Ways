# Stopwatch – C++, Qt, and Reflex

This project is a small experiment in building the same **Stopwatch** application three different ways:

1. **C++ Console (Command Line)**  
2. **Qt GUI (Qt Creator)**  
3. **Reflex UI (Modern reactive framework)**  

The idea is to compare development approaches across CLI, traditional GUI, and Reflex

---

## 🚀 Features
- Start / Stop functionality  
- Elapsed time display in seconds  
- Console version includes colored text (Windows API)  
- GUI version with start/stop buttons (Qt Widgets)  


---

## 📂 Project Structure

│
├── cpp/ # Pure C++ console version
│ ├── main.cpp
│ ├── stopwatch.h
│ └── stopwatch.cpp
│
├── qt/ # Qt Creator project files
│ ├── main.cpp
│ ├── mainwindow.ui
│ └── stopwatch.cpp
│
└── reflex/ # Reflex UI version
├── main.cpp
└── stopwatch_reflex.cpp


