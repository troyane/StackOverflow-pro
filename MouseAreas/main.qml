import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Overlapping mouse areas")

    MouseRect {
        anchors.fill: parent
        MouseRect {
            anchors.centerIn: parent
            width: parent.width * Math.log(2)
            height: parent.height * Math.log(2)
        }
    }
}

