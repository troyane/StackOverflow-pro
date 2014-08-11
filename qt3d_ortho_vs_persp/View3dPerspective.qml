// View3dPerspective.qml

import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Viewport {
    id: view3dPerspective

    property alias cameraNP: cam.nearPlane

    fillColor: "darkcyan"

    camera: Camera {
        id: cam
        projectionType: Camera.Perspective
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
        text: "Perspective\nProjection" + "\nnearPlane: " + cameraNP.toFixed(2)
        font.bold: true
        style: Text.Outline;
        styleColor: "white"
    }
}
