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
            text: "I'm here"
        }
    }

    function render(what, where) {
        var i;
        for (i = 0; i < window.contentItem.children.length; i++) {
            print("item "+i);
            print(window.contentItem.children[i].objectName);
            if (window.contentItem.children[i].objectName === what) {
                break;
            }
        }
        var citem = window.contentItem.children[i];
        citem.grabToImage( function(result) { result.saveToFile(where); });
    }

//    ShaderEffectSource {
//        objectName: "renderRect"
//        width: rect.width
//        height: rect.height
//        sourceItem: rect
//        visible: false
//    }

}
