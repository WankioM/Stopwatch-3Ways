import QtQuick 2.15

Rectangle {
    width: 600
    height: 200
    color: hoverHandler.hovered ? "#CAC426" : "#DBD643"
    anchors.margins: 10
    anchors.horizontalCenter: parent.horizontalCenter
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
            text: "Start"
            color: "#222223"
        }
}
