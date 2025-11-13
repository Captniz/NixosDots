// ClockWidget.qml
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property bool isPaused: (Mpris.players.values[0].playbackState == MprisPlaybackState.Paused)
  property bool isPlaying: (Mpris.players.values[0].isPlaying || isPaused)

  height: 25
  Text {
    id: icon
    text: isPaused ? "" : ""
    antialiasing: true
    anchors.right: info.left
    anchors.verticalCenter: root.verticalCenter
    rightPadding: 20
    font.pointSize: 10
    color: Globals.fg0
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignRight
    width: 20
    height: 25
  }
  Item {
    id: info
    anchors.horizontalCenter: parent.horizontalCenter
    width: Math.max(artist.width, song.width)
    Text {
      id: artist
      y: song.y - 11
      anchors.horizontalCenter: parent.horizontalCenter
      color: Globals.fg3
      text: (isPlaying ? (Mpris.players.values[0].trackArtist || "Hold on..") : "󰎇 No Song Playing 󰎇")
      font.family: Globals.font_3
      font.pointSize: 7
      font.weight: 400
      antialiasing: true
    }
    Text {
      id: song
      y: root.height / 2 - 3.5
      anchors.horizontalCenter: parent.horizontalCenter
      color: Globals.bright_aqua
      text: (isPlaying ? (Mpris.players.values[0].trackTitle || "Coming up..") : "Start Playing Music")
      font.family: Globals.font_2
      font.italic: true
      font.pointSize: 10
      antialiasing: true
      font.weight: 600
    }
  }
  Text {
    id: iconn
    text: ""
    antialiasing: true
    anchors.right: info.right
    anchors.verticalCenter: root.verticalCenter
    leftPadding: 33
    font.pointSize: 10
    color: Globals.fg0
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft
    width: 20
    height: 25
  }
}
