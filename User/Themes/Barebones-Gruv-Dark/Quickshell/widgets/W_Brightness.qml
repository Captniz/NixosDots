import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property real brightnessLevel

  width: child.width + val.width
  height: 25
  Process {
    id: brightness
    command: ["light", "-G"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: brightnessLevel = this.text
    }
  }

  IpcHandler {
    target: "brightness"
    enabled: true

    function update(): void {
      brightness.running = true;
    }
  }

  Text {
    id: val
    leftPadding: 5
    rightPadding: 5
    anchors.left: root.left
    anchors.verticalCenter: root.verticalCenter
    color: Globals.yellow
    font.pointSize: 9
    text: brightnessLevel
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
  Text {
    id: child
    rightPadding: 5
    anchors.right: root.right
    anchors.verticalCenter: root.verticalCenter
    color: Globals.yellow
    font.pointSize: 9
    text: "󰃠"
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
}
