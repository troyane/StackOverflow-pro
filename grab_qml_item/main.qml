// main.qml
//
// Created by troyane@github

import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 200
    height: 300

    Rectangle {
        id: rect
        objectName: "rect"
        width: 200
        height: 300
        color: "red"
        Text {
            anchors.centerIn: parent
            text: "I'm here. Grab me!"
        }
    }

    // -------------------------------------------------------------------------
    // FIRST APPROACH: use grabToImage function. In this example we invoke this
    // function from main.cpp:24
    // Also this function can be called inside QML.
    // -------------------------------------------------------------------------

    // what -- name of item needed to be grabbed
    // where -- string
    function render(what, where) {
        // Find existent item with given name `what`
        var i = 0
        var found = false
        for (i = 0; i < window.contentItem.children.length; i++) {
            if (window.contentItem.children[i].objectName === what) {
                // We found respective item
                found = true
                break
            }
        }
        if (found) {
            console.log("We found item " + what + ". Grabbing it to " + where)
            var item = window.contentItem.children[i]
            // Grab image and save it (via callback f-ion)
            item.grabToImage( function(result) { result.saveToFile(where) })
        } else {
            console.warn("No item called " + what)
        }
    }

    // -------------------------------------------------------------------------
    // SECOND APPROACH: use ShaderEffectSource with respective sourceItem. Now
    // shaderSrc contains your grabbed item.
    // -------------------------------------------------------------------------
    ShaderEffectSource {
        id: shaderSrc
        objectName: "renderRect"
        width: rect.width
        height: rect.height
        sourceItem: rect
        visible: false
    }
}
