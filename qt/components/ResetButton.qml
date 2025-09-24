import QtQuick 2.15

Rectangle {
    width: 600
    height: 200
    color: hoverHandler2.hovered ? "#323234": "#222223"
    anchors.margins: 10
    radius: 8

    signal clicked ()

    Behavior on color {
            ColorAnimation { duration: 200 }
        }

        HoverHandler {
            id: hoverHandler2
        }

        MouseArea {
                anchors.fill: parent
                onClicked: parent.clicked()
            }


        Text {
            anchors.centerIn: parent
            color: "#CAC426"
            text: "Reset"

        }
}
