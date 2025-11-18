import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property int volumeLevel
  property bool isMuted
  property string volumeColor: isMuted ? Globals.bright_black : Globals.blue

  width: child.width + val.width
  height: 25
  Process {
    id: volume
    command: ["sh", "-c", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 }'"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: volumeLevel = this.text * 100
    }
  }

  Process {
    id: mute
    command: ["sh", "-c", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep '\[MUTED\]'"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: isMuted = this.text == "" ? false : true
    }
  }

  MouseArea {
    anchors.fill: root
    anchors.centerIn: root
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      devSelect.running = true;
    }

    Process {
      id: devSelect
      command: ["sh", "/etc/nixos/User/Scripts/AudioDeviceSelect.sh"]
      running: false
    }
  }

  IpcHandler {
    target: "volume"
    enabled: true

    function update(): void {
      volume.running = true;
    }

    function updateMute(): void {
      mute.running = true;
    }
  }

  Text {
    id: val
    leftPadding: 5
    rightPadding: 5
    anchors.left: root.left
    anchors.verticalCenter: root.verticalCenter
    color: volumeColor
    font.pointSize: 9
    text: volumeLevel
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
  Text {
    id: child
    rightPadding: 5
    anchors.right: root.right
    anchors.verticalCenter: root.verticalCenter
    color: volumeColor
    font.pointSize: 10
    text: "󰕾"
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
}
