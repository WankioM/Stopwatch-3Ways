import QtQuick 2.15

Rectangle {
    width: 600
    height: 200
    color: "#BCB4FF"
    anchors.margins: 10
    radius: 8

    signal clicked ()

    Behavior on color {
            ColorAnimation { duration: 200 }
        }

        HoverHandler {
            id: hoverHandler
        }

        MouseArea {
                anchors.fill: parent
                onClicked: parent.clicked()
            }

        Text {
            anchors.centerIn: parent
            text: "Pause/Stop"
            color: "#FFFEEC"
        }
}
