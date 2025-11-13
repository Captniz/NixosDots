// ClockWidget.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property bool wifiConnected: true
  property string wifiName: ""
  property string enabledColor: Globals.bright_blue
  property string disabledColor: Globals.bright_red

  width: info.width + 10
  height: 25

  Scope {
    Process {
      id: wifiProcess
      command: ["bash", "-c", "nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2"]

      stdout: StdioCollector {
        onStreamFinished: wifiName = this.text
      }
    }
    Process {
      id: wifiOn
      command: ["bash", "-c", "nmcli -t -f type,state connection show --active | grep wireless | cut -d: -f2"]

      stdout: StdioCollector {
        onStreamFinished: wifiConnected = (this.text == "" ? false : true)
      }
    }
    Timer {
      interval: 5000
      running: true
      repeat: true
      onTriggered: wifiProcess.running = wifiOn.running = true
    }
  }

  MouseArea {
    anchors.fill: root
    anchors.centerIn: root
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      btProcess.running = true;
    }

    Process {
      id: btProcess
      command: ["sh", "/etc/nixos/User/Scripts/WifiConnections.sh"]
      running: false
    }
  }

  Row {
    id: info
    anchors.centerIn: root
    height: parent.height
    width: icon.width + name.width

    Text {
      id: icon
      anchors.verticalCenter: parent.verticalCenter
      text: wifiConnected ? "󰖩  " : "󰖪"
      color: wifiConnected ? enabledColor : disabledColor
      font.pointSize: 9
      font.family: Globals.font_2
      font.weight: 600
    }
    Text {
      id: name
      anchors.verticalCenter: parent.verticalCenter
      text: wifiName
      color: enabledColor
      font.pointSize: 9
      font.family: Globals.font_2
      font.weight: 600
    }
  }
}
