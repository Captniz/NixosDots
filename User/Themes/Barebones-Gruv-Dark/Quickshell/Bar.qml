// Bar.qml
import Quickshell
import "widgets"
import "widgets/src"

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      W_Clock {
        anchors.centerIn: parent

        // no more time binding
      }
    }
  }
}