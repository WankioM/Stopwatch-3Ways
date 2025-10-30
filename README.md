# Stopwatch – CL, Qt, and Reflex

This project is a small experiment in building the same **Stopwatch** application three different ways:

1. **C++ (Command Line)**  
2. **Qt GUI (Qt Creator)**  
3. **Reflex UI (Modern reactive framework)**  

The idea is to compare development approaches across CLI, traditional GUI, and Reflex

---

##  Features
- Start / Stop functionality  
- Elapsed time display in seconds  
- Console version includes colored text (Windows API)  
- GUI version with start/stop buttons (Qt Widgets)  


---

## 📂 Project Structure

│
├── cpp/                              # Pure C++ console version
│   ├── main.cpp
│   ├── stopwatch.h
│   └── stopwatch.cpp
│
├── qt/                               # Qt Creator project files
│   ├── main.cpp
│   ├── mainwindow.ui
│   └── stopwatch.cpp
│
└── reflex/                           # Reflex UI version
    │
    ├── code/                         # Native C++ app bootstrap (runs the VM)
    │   ├── entry.cpp                 # Entry point → calls StartVmApp()
    │   ├── reflex_bootstrap.cpp
    │   └── reflex_bootstrap_vm.cpp
    │
    ├── project/                      # IDE / build files (Visual Studio solution, etc.)
    │
    ├── resources/                    # All Reflex VM files loaded by the runtime
    │   ├── main.c                    # Backend logic (timers, states, persistence)
    │   ├── view.c                    # UI layout & style bindings
    │   ├── styles.txt                # Global stylesheet for app look and feel
    │   └── interface.h               # Interface between VM and native layer

---
##  Demo

**Reflex Version in Action**

[![Watch the demo](https://img.youtube.com/vi/Zc_Ji0oYgIE/0.jpg)](https://youtu.be/Zc_Ji0oYgIE)


---
**QT Version in Action:**

[Click here to watch the demo →](https://www.loom.com/share/071ed3c5d3da442ea1abf2a2bda37a39)

![Stopwatch Demo](https://cdn.loom.com/sessions/thumbnails/1e0010a928ad440daba780d6727b3dbf-with-play.gif)


## 🛠️ Implementation Notes

### Reflex VM Version
- Uses Reflex's **SetOnClock()** for continuous updates (~10 fps)  
- Split-pane resizable layout  
- State persistence across live-edit reloads  
- Real-time display updates without manual refresh  


---


**Reflex Advantages**:
- Live-edit mode for instant visual feedback  
- Clean separation of logic (main.c) and UI (view.c)  
- State persistence during development  

---

## 📝 Requirements

- **C++**: C++11 or higher, Windows SDK (for console colors)  
- **Qt**: Qt 5.x or Qt 6.x, Qt Creator  
- **Reflex**: Reflex framework, Visual Studio 2022  

---


