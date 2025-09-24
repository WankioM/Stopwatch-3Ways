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


    SpinUI {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 30
        width: 120
        height: 120
        spinning: isRunning && !isPaused
        arcColor: "#FF6B35"
    }



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

            anchors.bottom: parent.bottom
            spacing: 16
            anchors.margins: 5
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            StartButton {
                visible: !isRunning
                width: 250
                height: 100

                onClicked: {
                                isRunning = true
                                isPaused = false
                            }
            }

            PauseButton {
                visible: isRunning
                width: 250
                height: 100

                onClicked: {
                                isRunning = false
                                isPaused = true
                            }
            }


            ResetButton {
                visible: elapsedTime > 0
                width: 250
                height: 100

                onClicked: {
                    isRunning = false
                    isPaused = false
                    elapsedTime = 0

                }

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
