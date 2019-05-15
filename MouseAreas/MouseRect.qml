import QtQuick 2.0

Rectangle {
    id: mouseRect
    property bool hovered: false
    border {
        color: "black"
        width: 2
    }
    color: mouseRect.hovered ? "green" : "red"

    Binding { target: mouseRect; property: "hovered"; value: maInner.containsMouse }

    Text {
        anchors {
            margins: 10
            top: parent.top
            left: parent.left
        }
        text: (mouseRect.hovered ? "" : "un") + "hovered"
    }

    MouseArea {
        id: maInner
        hoverEnabled: true
        anchors.fill: parent
    }
}
