import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.Controls 2.1
import Qt.labs.qmlmodels 1.0

ApplicationWindow {
  visible: true
  width: 640
  height: 480

  TableView {
    anchors.fill: parent

    model: TableModel {
      // TableModel is designed to work with JavaScript/JSON data, where each row is a simple key-pair object
      //   without requiring the creation of a custom QAbstractTableModel subclass in C++.

      // Each TableModelColumn represents a column in a model and selects property to show
      TableModelColumn { display: "checked" }
      TableModelColumn { display: "amount" }
      TableModelColumn { display: "type" }
      TableModelColumn { display: "price" }

      // Model data row representing here one type of fruit that can be ordered
      rows: [
        // Each property is one cell/column.
        {
          checked: false,
          amount: 1,
          type: "Apple",
          price: 1.50
        },
        {
          checked: true,
          amount: 4,
          type: "Orange",
          price: 2.50
        },
        {
          checked: false,
          amount: 1,
          type: "Banana",
          price: 3.50
        },
        {
          checked: true,
          amount: 6,
          type: "Cranberry",
          price: 5.10
        },
        {
          checked: true,
          amount: 8,
          type: "Potato",
          price: 2.20
        }
      ]
    }

    delegate: DelegateChooser {
      // DelegateChooser allows a view to use different delegates for different types of items in the model.
      // Here you can do almost everything to tweak your cells.
      DelegateChoice {
        column: 0
        // For 1st column we use CheckBox component
        delegate: CheckBox {
          enabled: false
          width: 50
          checked: model.display
        }
      }
      DelegateChoice {
        column: 1
        // For 2nd column we use ProgressBar component
        delegate: ProgressBar {
          enabled: false
          width: 100
          from: 0.0
          to: 10.0
          value: model.display
        }
      }
      DelegateChoice {
        column: 2
        // For 3rd column we use TextField component
        delegate: TextField {
          implicitWidth: 140
          font.capitalization: Font.AllUppercase
          text: model.display
          readOnly: true
        }
      }
      DelegateChoice {
        column: 3
        // For 4rd column we use TextField component with text prepared by template
        delegate: TextField {
          implicitWidth: 80
          font.bold: true
          text: "$ " + model.display
          readOnly: true
        }
      }
    }
  }
}

