import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
  width: 200
  height: 200
  visible: true

  onWidthChanged: storeImage()
  onHeightChanged: storeImage()

  Component.onCompleted: storeImage()

  property var currentGradientImage: ""
  property color currentColor: "black"

  function storeImage() {
    // This operation could be costly.
    console.log("Saving colorItem -> currentGradientImage.")
    colorItem.grabToImage( function(result) { currentGradientImage = result.url } )
  }

  Canvas {
    id: image
    anchors.fill: colorItem
    onPaint: {
      // All what we do in paint is just draw stored image if we have any.
      var ctx = getContext("2d")
      if (currentGradientImage) {
        ctx.drawImage(currentGradientImage, 0, 0)
      }
    }

    function getPixelData(x, y) {
      // Extract (x,y)-pixel color from our canvas and store as currentColor.
      var ctx = getContext("2d")
      const pixel = ctx.getImageData(x, y, 1, 1)
      const data = pixel.data
      const r = data[0]/255
      const g = data[1]/255
      const b = data[2]/255
      const a = data[3]/255
      currentColor = Qt.rgba(r, g, b, a)
    }
  }

  Item {
    id: colorItem
    anchors.fill: parent
    Rectangle {
      id: colorRectangle
      anchors.fill: parent
      gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "#ff0000" }
        GradientStop { position: 0.2; color: "#ffff00" }
        GradientStop { position: 0.4; color: "#00ff00" }
        GradientStop { position: 0.6; color: "#00ffff" }
        GradientStop { position: 0.8; color: "#0000ff" }
        GradientStop { position: 1.0; color: "#ff00ff" }
      }
    }
    Rectangle {
      id: overLayRectangle
      anchors.fill: parent
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 0.0; color: "transparent" }
        GradientStop { position: 1.0; color: "#ffffff" }
      }
    }
  }

  MouseArea {
    id: colorItemMouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.CrossCursor
    // Update currentColor on each mouse movement
    onMouseXChanged: image.getPixelData(mouseX, mouseY)
    onMouseYChanged: image.getPixelData(mouseX, mouseY)
  }

  CheckBox {
    // Checkbox for debug. Make it visible and check to see what is drawn on canvas image.
    visible: false; checked: false
    onCheckedChanged: colorItem.visible = !checked
  }

  Rectangle {
    id: colorRect
    // Draw colorRect near current cursor position
    x: colorItemMouseArea.mouseX + 2
    y: colorItemMouseArea.mouseY + 2
    width: 30
    height: width
    radius: width / 10
    color: currentColor
    border {
      width: 2
      color: "black"
    }
  }
}
