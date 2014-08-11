import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import Qt3D 2.0

import "."

Window {    
    visible: true
    width: 400
    height: 600

    Rectangle {
        anchors.fill: parent

        View3dOrtho {
            id: viewOrtho
            width: parent.width / 2
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }

            Slider { // near plane slider for ortho projection
                id: npSliderOrtho
                minimumValue: 1
                maximumValue: 10
                value: viewOrtho.cameraNP
                orientation: Qt.Vertical
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                }

                onValueChanged: {
                    viewOrtho.cameraNP = value
                }
            }
        }

        View3dPerspective {
            id: viewPersp
            anchors {
                right: parent.right
                left: viewOrtho.right
                top: parent.top
                bottom: parent.bottom
            }

            Slider { // near plane slider for persp projection
                id: npPerspSlider
                minimumValue: 1
                maximumValue: 10
                value: viewPersp.cameraNP
                orientation: Qt.Vertical
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                }

                onValueChanged: {
                    viewPersp.cameraNP = value
                }
            }
        }
    }
}
