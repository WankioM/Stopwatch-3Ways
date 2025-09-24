import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: "Stopwatch"

    Rectangle {
        anchors.fill: parent
        color: "red"

        Text {
            anchors.centerIn: parent
            text: "Hello World!"
            font.pointSize: 24
        }
    }
}
