import QtQuick 2.15

Item {
    id: spinUI
    width: 200
    height: 200

    property bool spinning: false
    property real progress: 0.0
    property color arcColor: "#FF6B35"
    property color backgroundColor: "#2C2C2C"
    property int strokeWidth: 8


    // Background circle
    Rectangle {
        id: backgroundCircle
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        radius: width / 2
        color: "transparent"
        border.color: backgroundColor
        border.width: strokeWidth
        z: 0
    }

    // Spinning arc
    Canvas {
        id: canvas
        anchors.fill: parent
        z: 1

        Component.onCompleted: {
           console.log("Canvas size:", width, "x", height)
           console.log("Spinning:", spinning)
            requestPaint()
               }

        property real rotationAngle: 0

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)

            var centerX = width / 2
            var centerY = height / 2
            var radius = (width - strokeWidth) / 2

            // Draw the progress arc or spinning arc
            ctx.beginPath()
            ctx.strokeStyle = arcColor
            ctx.lineWidth = strokeWidth
            ctx.lineCap = "round"

            if (spinning) {
                // Spinning mode - draw a partial arc that rotates
                var startAngle = rotationAngle - Math.PI / 2  // Start from top
                var endAngle = startAngle + Math.PI * 0.75  // 3/4 circle
                ctx.arc(centerX, centerY, radius, startAngle, endAngle)
            } else {
                // Progress mode - draw based on progress value
                var startAngle = -Math.PI / 2  // Start from top
                var endAngle = startAngle + (progress * 2 * Math.PI)
                ctx.arc(centerX, centerY, radius, startAngle, endAngle)
            }

            ctx.stroke()
        }

        // Continuous rotation animation
        RotationAnimation {
            id: spinAnimation
            target: canvas
            property: "rotationAngle"
            from: 0
            to: Math.PI * 2
            duration: 1500
            loops: Animation.Infinite
            running: spinning
            onRunningChanged: {
                if (running) {
                    canvas.requestPaint()
                }
            }
        }

        // Redraw when rotation changes
        onRotationAngleChanged: requestPaint()

        // Timer to repaint during animation
        Timer {
            id: paintTimer
            interval: 16  // ~60 FPS
            repeat: true
            running: spinning
            onTriggered: canvas.requestPaint()
        }
    }

    // Update canvas when progress changes
    onProgressChanged: {
        if (!spinning) {
            canvas.requestPaint()
        }
    }

    // Public functions
    function startSpin() {
        spinning = true
    }

    function stopSpin() {
        spinning = false
    }

    function setProgress(value) {
        spinning = false
        progress = Math.max(0.0, Math.min(1.0, value))
    }
}
