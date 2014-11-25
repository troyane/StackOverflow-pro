import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom QObject*-based list model for QML")

    ListView {
        anchors.fill: parent
        model: Lists.data
        delegate: Rectangle {
            id: delegateRect
            border {
                color: "black"
                width: 2
            }
            radius: 20
            color: "lightgrey"
            height: 100
            width: parent.width
            Row {
                id: curRow
                spacing: 20
                anchors.fill: parent
                Text {
                    id: lblName
                    text: model.modelData.name
                    anchors.verticalCenter: curRow.verticalCenter
                }
                Text {
                    id: lblValue
                    text: "Value: " + model.modelData.value
                    anchors.verticalCenter: curRow.verticalCenter
                    font.bold: true
                }
            }
        }
    }
}
