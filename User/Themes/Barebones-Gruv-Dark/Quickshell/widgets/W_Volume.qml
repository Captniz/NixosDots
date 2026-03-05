import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property PwNode audioSink: Pipewire.defaultAudioSink
  property bool startupReady: Pipewire.ready && audioSink && audioSink.ready && audioSink.audio
  property bool startupVolumeApplied: false
  property int volumeLevel: startupReady ? Math.round(audioSink.audio.volume * 100) : 0
  property bool isMuted: startupReady ? audioSink.audio.muted : false
  property string volumeColor: isMuted ? Globals.bright_black : Globals.blue

  width: child.width + val.width
  height: 25

  function applyStartupVolumeZero(): void {
    if (!startupVolumeApplied && startupReady) {
      startupVolumeApplied = true;
      zero_volume.running = true;
    }
  }

  onStartupReadyChanged: applyStartupVolumeZero()

  Component.onCompleted: applyStartupVolumeZero()

  PwObjectTracker {
    id: sinkTracker
    objects: [root.audioSink]
  }

  Process {
    id: zero_volume
    command: ["sh", "-c", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0"]
    running: false
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
    }

    function updateMute(): void {
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
