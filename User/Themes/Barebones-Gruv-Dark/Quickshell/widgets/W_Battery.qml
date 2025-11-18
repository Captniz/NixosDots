import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property bool isCharging: !UPower.onBattery
  property int level: UPower.displayDevice.percentage * 100
  property string batteryColor: isCharging ? (level < 25 ? Globals.green : Globals.green) : Globals.green

  width: child.width + val.width
  height: 25

  MouseArea {
    anchors.fill: root
    anchors.centerIn: root
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      examine.running = true;
    }

    Process {
      id: examine
      command: ["powertop"]
    }
  }

  Text {
    id: val
    leftPadding: 5
    rightPadding: 5
    anchors.left: root.left
    anchors.verticalCenter: root.verticalCenter
    color: isCharging ? Globals.bright_aqua : Globals.green
    font.pointSize: 9
    text: level
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
  Text {
    id: child
    rightPadding: 5
    anchors.right: root.right
    anchors.verticalCenter: root.verticalCenter
    color: isCharging ? Globals.bright_aqua : Globals.green
    font.pointSize: 10
    text: isCharging ? "󱐋" : "󰁼"
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
}
