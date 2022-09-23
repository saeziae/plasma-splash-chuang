import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root

    property int stage

    color: "#000000"
    onStageChanged: {
        if (stage == 1)
            introAnimation.running = true;

    }

    Item {
        id: content

        anchors.fill: parent
        opacity: 0

        Rectangle {
            id: imageSource

            property int sizeAnim: 120

            width: sizeAnim * 7
            height: sizeAnim * 3
            color: "transparent"
            clip: true

            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            AnimatedImage {
                id: busyIndicator

                source: "images/output.gif"
                paused: false
                width: sizeAnim * 7
                height: sizeAnim * 3
                smooth: true
                visible: true

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

            }

        }

    }

    OpacityAnimator {
        id: introAnimation

        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }

}
