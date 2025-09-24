cmake_minimum_required(VERSION 3.16)
project(StopWatch VERSION 1.0.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup()

qt_add_executable(appStopWatch
    src/main.cpp
)

qt_add_qml_module(appStopWatch
    URI StopWatch
    VERSION 1.0
    QML_FILES
        Main.qml
        components/StartButton.qml
        components/PauseButton.qml
        components/ResetButton.qml
        components/StopButton.qml
        components/SpinUI.qml
)

target_link_libraries(appStopWatch PRIVATE
    Qt6::Core
    Qt6::Quick
)
