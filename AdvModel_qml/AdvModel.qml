// AdvModel.qml
// Created by troyane@github

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

ApplicationWindow {
    id: appWindow

    // Explicitly set window size (just for testing on desktop)
    width: 200
    height: 400

    function getRandomArbitary(min, max) {
        return Math.floor(Math.random() * (max - min) + min)
    }

    // Item what represents "main application rectandle"
    // it will contain all child items
    Item {
        id: root
        anchors.fill: parent

        AdvancedListModel {
            id: advModel
            Component.onCompleted: {
                // Filling array with random numbers
                for (var i = 0; i < 24; ++i) {
                    append({name: getRandomArbitary(1, 100)});
                }

                // Uncomment next lines to sort model
                // sortColumnName="name"
                // quick_sort()

                // Uncomment next lines to sort model
                // reverse()
            }
        }

        ListView {
            anchors.fill: parent
            model: advModel
            delegate: Text {
                text: "Item: <b>" + name + "</b>"
            }
        }
    }
}
