import QtQuick
import QtQuick.Window
import StopWatch

Window {
    visible: true
    width: 640
    height: 480
    title: "Stopwatch"

    property bool isRunning: false
    property bool isPaused: false
    property int elapsedTime: 0


    Timer {
            id: stopwatchTimer
            interval: 10  // Update every 10ms
            running: isRunning && !isPaused
            repeat: true
            onTriggered: elapsedTime += 10
        }

    Rectangle {
        anchors.fill: parent
        color: "#FFFEE6"

        Text {
               anchors.top: parent.top
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.margins: 50
               text: formatTime(elapsedTime)
               font.pointSize: 24
           }

        Row {

            anchors.centerIn: parent

            PauseButton {
                visible: isRunning
                width: 300
                height: 100

                onClicked: {
                                isRunning = false
                                isPaused = true
                            }
            }

            StopButton {
                visible: isRunning
                width: 300
                height: 100

                onClicked: {
                                isRunning = false
                                isPaused = false
                            }
                }

            ResetButton {
                    width: 300
                    height: 100

                    onClicked: {
                        isRunning = false
                        isPaused = false
                        elapsedTime = 0

                    }

                }
        }

        StartButton {
            visible: !isRunning
            anchors.bottom: parent.bottom
            width: 600
            height: 100

            onClicked: {
                            isRunning = true
                            isPaused = false
                        }
        }

    }

    function formatTime(ms) {
           var minutes = Math.floor(ms / 60000)
           var seconds = Math.floor((ms % 60000) / 1000)
           var centiseconds = Math.floor((ms % 1000) / 10)

           return (minutes < 10 ? "0" : "") + minutes + ":" +
                  (seconds < 10 ? "0" : "") + seconds + "." +
                  (centiseconds < 10 ? "0" : "") + centiseconds
       }
}
