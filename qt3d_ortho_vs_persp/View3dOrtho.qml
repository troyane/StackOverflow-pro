// View3dOrtho.qml

import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Viewport {
    property alias cameraNP: cam.nearPlane

    fillColor: "darkblue"

    camera: Camera {
        id: cam
        projectionType: Camera.Orthographic
        eye: Qt.vector3d(2, 2, 2)
        center: Qt.vector3d(0, 0, 0)
    }

    Cube { }

    Text {
        anchors {
            left: parent.left
            right: parent.right
        }
        y: parent.height / 10
        horizontalAlignment: Text.AlignHCenter
        text: "Orthographic\nProjection" + "\nnearPlane: " + cameraNP.toFixed(2)
        font.bold: true
        style: Text.Outline;
        styleColor: "white"
    }
}
