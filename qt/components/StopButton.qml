import QtQuick 2.15

Rectangle {

    height: 200
    color: hoverHandler.hovered ? "#CAC426" : "#DBD643"
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
            text: "Stop"
            color: "#222223"
        }
}
