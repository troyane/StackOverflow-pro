import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

Window {
    id: window
    visible: true
    width: 200
    height: 400
    title: qsTr("Hello Buttons")

    Behavior on y { NumberAnimation { duration: menu.animationDuration } }

    Behavior on height { NumberAnimation { duration: menu.animationDuration } }

    Rectangle {
        id: menu

        readonly property int itemWidth: menu.width * 0.95
        readonly property int itemHeight: 30 // px
        readonly property int animationDuration: 500 // ms

        anchors {
            fill: parent
            margins: 5
        }

        Column {
            spacing: 2
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalcenter
            }

            Rectangle {
                color: "grey"
                width: menu.itemWidth
                height: menu.itemHeight
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        // Toggle visible mrPink rectangle by changing its height. Change window height respectively.
                        if (mrPink.height == 0) {
                            window.y -= menu.itemHeight
                            window.height += menu.itemHeight
                            mrPink.height = menu.itemHeight
                        } else {
                            window.y += menu.itemHeight
                            window.height -= menu.itemHeight
                            mrPink.height = 0
                        }
                    }
                }
            }

            Rectangle {
                id: mrPink
                color: "pink"
                width: menu.itemWidth * 0.9
                height: 0
                anchors.horizontalCenter: parent.horizontalCenter

                Behavior on height { NumberAnimation { duration: menu.animationDuration } }
            }

            Rectangle {
                color: "green"
                width: menu.itemWidth
                height: menu.itemHeight
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                color: "blue"
                width: menu.itemWidth
                height: menu.itemHeight
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
