import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import AsyncWorker 1.0

ApplicationWindow {
    id: window
    title: "Stack"
    visible: true
    width: 600
    height: 500

    // Better use States for this purpose
    property bool operationInProgress: false

    AsyncWorker {
        id: asyncWorker
        onJobDone: {
            // On job done we append result to text area and change
            // operationInProgress status to false
            resultText.text  += "\n" + result
            operationInProgress = false
        }
    }

    Page {
        id: page
        anchors {
            fill: parent
            margins: 10
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            RowLayout {
                Text { text: qsTr("Your input:") }

                TextField {
                    id: input
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    text: qsTr("QML Async works well")
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Run asynchronous")
                    enabled: !operationInProgress
                    onClicked: {
                        // On click we prepare job, populating it with entered text
                        //  and start it. Also we change operationInProgress status to false
                        //  to be able to lock UI, etc.
                        asyncWorker.prepareJob(input.text)
                        asyncWorker.startJob()
                        operationInProgress = true
                    }
                }
            }
            ProgressBar {
                id: progress
                visible: operationInProgress
                indeterminate: true
                Layout.fillWidth: true
            }

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Result will be shown here:")
            }
            ScrollView {
                id: view
                Layout.fillHeight: true
                Layout.fillWidth: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                TextArea {
                    id: resultText
                    Layout.alignment: Qt.AlignHCenter
                    text: ""
                    readOnly: false
                }
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }
}
