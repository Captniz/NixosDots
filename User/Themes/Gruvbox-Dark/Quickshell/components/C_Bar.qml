// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../widgets"
import "../"

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
    implicitHeight: 32
    implicitWidth: screen.width

    Rectangle {
      color: Globals.bg0_hard
      anchors.fill: parent
      width: parent.width
      height: parent.height

      GridLayout {
        columns: 3
        rows: 1
        anchors.fill: parent
        height: parent.height
        width: parent.width
        Row {
          id: leftBox
          Layout.fillWidth: true
          Layout.maximumWidth: parent.width / 3
          spacing: 5
          leftPadding: 10
          layoutDirection: Qt.LeftToRight
          W_Workspaces {}
        }
        W_Playback {
          Layout.fillWidth: true
        }
        Row {
          id: rightBox
          Layout.fillWidth: true
          Layout.maximumWidth: parent.width / 3
          spacing: 5
          rightPadding: 10
          layoutDirection: Qt.RightToLeft
          W_PowerMenu {}
          W_Sep {}
          W_Clock {}
          W_Sep {}
          W_Battery {}
          W_Brightness {}
          W_Volume {}
          W_Sep {}
          W_Bluetooth {}
          W_Sep {}
          W_Wifi {}
        }
      }
    }
  }
}
