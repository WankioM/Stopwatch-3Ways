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
            interval: 100
            running: isRunning && !isPaused
            repeat: true
            onTriggered: elapsedTime += 100
        }

    Rectangle {
        anchors.fill: parent
        color: "#FFFEE6"

        FontLoader {
               id: digitalFont
               source: "file:///C:/Users/VICTUS/Downloads/digital-7/digital-7 (mono).ttf"
           }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -50
            border.color: "#FAF8DF"
            border.width: 2
            radius: 10
            color: "transparent"
            width: timeText.width + 40
            height: timeText.height + 40

            Text {
                id: timeText
                anchors.centerIn: parent
                text: formatTime(elapsedTime)
                font.family: digitalFont.name
                font.pointSize: 36
            }
        }


        Rectangle {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 20
              anchors.bottomMargin: 20
              anchors.topMargin: -10


            border.color: "#FAF8DF"
            border.width: 2
            radius: 10
            color: "transparent"
            height: 120

        Row {

            anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                anchors.bottomMargin: 10
                anchors.topMargin: 20
                spacing: 16

            StartButton {
                visible: !isRunning
                 width: elapsedTime > 0 ? (parent.width - parent.spacing) / 2 : parent.width
                height: 100

                onClicked: {
                                isRunning = true
                                isPaused = false
                            }
            }

            PauseButton {
                visible: isRunning
                width: elapsedTime > 0 ? (parent.width - parent.spacing) / 2 : parent.width
                height: 100

                onClicked: {
                                isRunning = false
                                isPaused = true
                            }
            }


            ResetButton {
                visible: elapsedTime > 0
                  width:  (parent.width - parent.spacing) / 2
                height: 100

                onClicked: {
                    isRunning = false
                    isPaused = false
                    elapsedTime = 0

                }

            }
        }


        }




    }


    function formatTime(ms) {
        var minutes = Math.floor(ms / 60000)
        var seconds = Math.floor((ms % 60000) / 1000)
        var milliseconds = Math.floor((ms % 1000) / 10)

        if (minutes > 0) {
            return (minutes < 10 ? "0" : "") + minutes + ":" +
                   (seconds < 10 ? "0" : "") + seconds + "." +
                   (milliseconds < 10 ? "0" : "") + milliseconds
        } else {
            return (seconds < 10 ? "0" : "") + seconds + "." +
                   (milliseconds < 10 ? "0" : "") + milliseconds
        }
    }
}
