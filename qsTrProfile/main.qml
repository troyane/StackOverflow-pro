import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 200
    height: 100
    title: qsTr("Profile qsTr")
    readonly property int testCount: 100000
    readonly property string optimizedString: qsTr("Optimized")

    Column {
        Text {
            id: unoptimized
            text: ""
        }
        Text {
            id: optimized
            text: ""
        }
    }

    function unoptimizedTest() {
        var str = ""
        for (var i = 0; i < testCount; ++i)
             str = qsTr("Unoptimized") + i
        unoptimized.text = str
    }

    function optimizedTest() {
        var str = ""
        for (var i = 0; i < testCount; ++i)
            str = optimizedString + i
        optimized.text = str
    }

    Component.onCompleted: {
        unoptimizedTest()
        optimizedTest()
    }
}

