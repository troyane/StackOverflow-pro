import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello Flickable as delegate")

    ListModel {
        id: sourceModel
        ListElement {
            articleName: "Behind the Headlines (1956 film)"
            articleContent: "Behind the Headlines is a 1956 British crime film directed by Charles Saunders and \
Paul Carpenter, Adrienne Corri, Hazel Court and Alfie Bass. The plot revolves around a male and female journalist \
joining forces to hunt down a murderer. The film was based on the novel Behind the Headlines by Robert Chapman."
        }
        ListElement {
            articleName: "Delaware Valley Mantarays"
            articleContent: "The Delaware Valley Mantarays were a semi-professional rugby league football team based \
in the Delaware Valley area of the U.S. state of Pennsylvania. The team played for seven seasons in the American \
National Rugby League (AMNRL), the United States' major competition, from 2000–2006. At the conclusion of the 2006 \
season they merged with another AMNRL team in the Philadelphia area, the Philadelphia Fight."
        }
    }

    ListView {
        id: myListViewArticle
        anchors.fill: parent
        focus: true
        highlightRangeMode: ListView.StrictlyEnforceRange
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        model: sourceModel
        delegate: Component {
            id: articleDelegate
            Rectangle {
                id: item
                border.width: 2
                width: 480; height: 800

                Flickable {
                    id: mainScrollView
                    contentHeight: 1500
                    contentWidth: parent.width
                    anchors {
                        fill: parent
                    }
                    clip: true

                    Column {
                        spacing: 5
                        anchors {
                            fill: parent
                            margins: 10
                        }

                        Text {
                            id: idArticleTitle
                            text: model.articleName
                            width: parent.width
                            style: Text.Raised;
                            font.pixelSize: 25
                            font.bold: true; color: "black"
                            wrapMode: Text.Wrap
                        }
                        Text {
                            id: idArticleContent
                            text: model.articleContent
                            width: parent.width
                            font.pixelSize: 22
                            font.bold: false; color: "black"
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
    }
}
