// ClockWidget.qml
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Io
import "../src"
import "../"

D_WidgetContainer {
  id: root

  width: button.width + 10
  height: 25

  property var options: [
    {
      label: "Shutdown",
      icon: "",
      comm: ["systemctl", "poweroff"]
    },
    {
      label: "Restart",
      icon: "",
      comm: ["systemctl", "reboot"]
    },
    {
      label: "Log Out",
      icon: "󰍃",
      comm: ["hyprctl", "dispatch", "exit"]
    },
    {
      label: "Sleep",
      icon: "󰒲",
      comm: ["systemctl", "suspend"]
    },
    {
      label: "Hybernate",
      icon: "",
      comm: ["systemctl", "hybrid-sleep"]
    }
  ]

  MouseArea {
    anchors.fill: root
    anchors.centerIn: root
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onEntered: popUp.visible = true
    onExited: popupCloseTimer.start()

    Text {
      id: button
      anchors.centerIn: parent
      text: ""
      color: Globals.bright_orange
      font.pointSize: 8
    }

    Timer {
      id: popupCloseTimer
      interval: 250
      onTriggered: {
        if (!popUp.containsMouse)
          popUp.visible = false;
      }
    }
  }
  PopupWindow {
    id: popUp
    color: Globals.bg2
    anchor.item: root
    anchor.rect.x: root.x
    anchor.rect.y: root.y + root.height + 2
    implicitWidth: 100
    implicitHeight: col.implicitHeight
    visible: false
    property bool containsMouse: true

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onEntered: popUp.containsMouse = true
      onExited: {
        popUp.containsMouse = false;
        popUp.visible = false;
      }
      // The options
      Column {
        id: col
        anchors.fill: parent
        spacing: 2
        Repeater {
          id: optionRepeater
          anchors.centerIn: parent
          model: root.options
          Item {
            height: option.height
            width: option.width + 10
            D_PowerOption {
              id: option
              icon: modelData.icon
              comm: modelData.comm
              name: modelData.label
              closePopUp: function () {
                popUp.visible = false;
              }
            }
          }
        }
      }
    }
  }
}
