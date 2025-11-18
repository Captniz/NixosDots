// ClockWidget.qml
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import "../src"
import "../"

D_WidgetContainer {
  id: root
  width: child.width
  height: 25
  Row {
    id: child
    leftPadding: 5
    rightPadding: 5
    anchors.verticalCenter: root.verticalCenter
    height: parent.height
    spacing: 10

    Text {
      anchors.verticalCenter: parent.verticalCenter
      color: Globals.fg0
      text: ""
      font.bold: true
    }

    Repeater {
      model: Hyprland.workspaces
      anchors.verticalCenter: parent.verticalCenter
      Item {
        anchors.verticalCenter: parent.verticalCenter
        height: wsWidget.height
        width: wsWidget.width + 10
        D_Workspace {
          id: wsWidget
          ws: modelData
        }
        Text {
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
          color: Globals.fg0
          text: ""
          font.bold: true
        }
      }
    }
  }
}
