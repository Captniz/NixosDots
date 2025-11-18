// ClockWidget.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Io
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property bool btEnabled: Bluetooth.defaultAdapter.enabled
  property bool btScanning: Bluetooth.defaultAdapter.discovering
  property string connectedItem: ""
  property string enabledColor: Globals.bright_blue
  property string disabledColor: Globals.bright_red

  width: info.width + 10
  height: 25

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: {
      for (var i = 0; i < Bluetooth.devices.values.length; i++) {
        var device = Bluetooth.devices.values[i];
        if (device.connected) {
          connectedItem = " " + device.name;
          return;
        }
      }
      connectedItem = "";
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
      command: ["sh", "/etc/nixos/User/Scripts/BluetoothConnections.sh"]
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
      text: (btEnabled ? (btScanning ? "󰂰 Scanning.." : "") : "󰂲")
      color: btEnabled ? enabledColor : disabledColor
      font.pointSize: 11
      font.family: Globals.font_2
      font.weight: 600
    }
    Text {
      id: name
      anchors.verticalCenter: parent.verticalCenter
      text: connectedItem
      color: enabledColor
      font.pointSize: 9
      font.family: Globals.font_2
      font.weight: 600
    }
  }
}
