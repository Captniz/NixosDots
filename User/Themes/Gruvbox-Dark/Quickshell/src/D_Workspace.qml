// ClockWidget.qml
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import "../"

Rectangle {
  id: root

  property var ws
  property string font_family: Globals.font_2
  property real active_weight: ws.focused ? 700 : 500
  property bool active_italic: ws.focused ? true : false
  property bool active_underline: ws.focused ? true : false
  property string active_color: ws.focused ? Globals.bright_blue : Globals.fg0

  color: "transparent"
  width: num.width + info.width + 10
  height: 20
  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
  Text {
    id: num
    anchors.left: root.left
    anchors.verticalCenter: parent.verticalCenter
    text: ws.id
    font.family: font_family
    font.weight: active_weight
    font.italic: active_italic
    antialiasing: true
    color: active_color
  }
  Item {
    id: info
    anchors.right: root.right
    anchors.verticalCenter: root.verticalCenter
    width: title.width + ctr.width + 5
    height: parent.height

    Text {
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      text: ws.toplevels.values.length > 0 ? ws.toplevels.values[0].lastIpcObject.class : "Desktop"
      font.family: font_family
      font.weight: active_weight
      font.italic: active_italic
      font.capitalization: Font.Capitalize
      antialiasing: true
      font.underline: active_underline
      color: active_color
    }

    Text {
      id: ctr
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      text: ws.toplevels.values.length > 1 ? "[+" + (ws.toplevels.values.length - 1) + "]" : ""
      font.family: font_family
      font.pointSize: 6.5
      font.weight: active_weight
      antialiasing: true
      font.italic: active_italic
      font.capitalization: Font.Capitalize
      color: active_color
    }
  }

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: Hyprland.refreshToplevels()
  }
}
