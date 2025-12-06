// ClockWidget.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import Quickshell.Services.Mpris
import "../src"
import "../"

D_WidgetContainer {
  id: root

  property bool isPaused: (Mpris.players.values[0].playbackState == MprisPlaybackState.Paused)
  property bool isPlaying: (Mpris.players.values[0].isPlaying || isPaused)
  property string track_artist: (isPlaying ? (Mpris.players.values[0].trackArtist || "Hold on..") : "󰎇 No Song Playing 󰎇")
  property string track_title: (isPlaying ? (Mpris.players.values[0].trackTitle || "Coming up..") : "Start Playing Music")
  property real track_progress: Mpris.players.values[0].position
  property real track_length: Mpris.players.values[0].length
  //property real player_volume: Mpris.players.values[0].volume

  height: 25

  MouseArea {
    anchors.fill: root
    anchors.centerIn: parent
    hoverEnabled: true
    onEntered: {
      player.visible = true;
      Mpris.players.values[0].positionChanged();
    }
    onExited: popupCloseTimer.start()
  }

  Timer {
    id: popupCloseTimer
    interval: 350
    onTriggered: {
      if (!player.vis)
        player.visible = false;
    }
  }

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
      text: root.track_artist
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
      text: root.track_title
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

  PopupWindow {
    id: player

    property bool vis: true
    property int speed: 60        // pixels per second

    anchor.item: root
    anchor.rect.x: root.width / 2 - width / 2
    anchor.rect.y: root.y + root.height + 6

    implicitWidth: 600
    implicitHeight: 200

    visible: false

    MouseArea {
      anchors.fill: popup_container
      hoverEnabled: true
      onEntered: player.vis = true
      onExited: {
        player.vis = false;
        player.visible = false;
      }
    }

    D_WidgetContainer {
      id: popup_container
      border.color: Globals.fg4
      anchors.fill: parent
      antialiasing: true
      clip: true

      Image {
        x: 10
        y: 10
        source: Mpris.players.values[0].trackArtUrl
        width: 180
        height: 180
        fillMode: Image.PreserveAspectCrop
        opacity: 0.8
      }

      Item {
        id: song_info
        x: 205
        y: 20
        width: player.width - 225
        height: player.height - 30
        clip: true
        Text {
          id: popup_song_name
          color: Globals.fg0
          text: root.track_title
          font.family: Globals.font_2
          font.italic: true
          font.pointSize: 13
          antialiasing: true
          font.weight: 600
          onTextChanged: {
            scrollAnim.stop();
            popup_song_name.x = 0;

            if (popup_song_name.width > width)
              scrollAnim.restart();
          }
        }
        Text {
          id: popup_song_author
          y: popup_song_name.y + 30
          color: Globals.fg2
          text: root.track_artist
          font.family: Globals.font_2
          font.italic: true
          font.pointSize: 10
          antialiasing: true
          font.weight: 600
          onTextChanged: {
            scrollAnim.stop();
            popup_song_name.x = 0;

            if (popup_song_name.width > width)
              scrollAnim.restart();
          }
        }
        ProgressBar {
          id: progress_bar
          y: popup_song_author.y + 50
          width: song_info.width - 100
          hoverEnabled: false
          height: 10
          from: 0
          to: root.track_length
          value: root.track_progress
          indeterminate: false
          background: Rectangle {
            color: Globals.bg3
            height: 3
            radius: 5
          }
          contentItem: Item {
            implicitHeight: 2

            Rectangle {
              width: parent.width * (progress_bar.value / progress_bar.to)
              height: 3
              radius: 5
              color: Globals.bright_aqua
            }
          }
        }

        Text {
          id: elapsed_time
          verticalAlignment: Text.AlignVCenter
          y: progress_bar.y - (this.height / 2) - 1
          x: progress_bar.x + progress_bar.width + 10
          text: Qt.formatTime(new Date(root.track_progress * 1000), "mm:ss") + " / " + Qt.formatTime(new Date(root.track_length * 1000), "mm:ss")
          color: Globals.fg3

          font.family: Globals.font_1
          font.pointSize: 10
          antialiasing: true
        }

        Rectangle {
          id: control_box
          radius: 10
          color: Globals.bg1
          height: 30
          width: song_info.width
          y: progress_bar.y + 40
          RowLayout {
            id: controls
            x: control_box.x + control_box.width / 2 - controls.width / 2 + 10
            anchors.verticalCenter: control_box.verticalCenter
            spacing: 20
            width: progress_bar.width - 100
            Button {
              background: Rectangle {
                color: "transparent"
              }
              contentItem: Text {
                text: ""
                font.pointSize: 14
                color: Globals.fg0
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
              }
              onClicked: Mpris.players.values[0].previous()
              hoverEnabled: false
            }

            Button {
              contentItem: Text {
                text: root.isPaused ? "" : ""
                font.pointSize: 14
                color: Globals.fg0
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
              }
              font.pointSize: 16
              background: Rectangle {
                color: "transparent"
              }
              onClicked: {
                if (!root.isPaused)
                  Mpris.players.values[0].pause();
                else
                  Mpris.players.values[0].play();
              }
              hoverEnabled: false
            }

            Button {
              contentItem: Text {
                text: ""
                font.pointSize: 14
                color: Globals.fg0
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
              }
              font.pointSize: 14
              background: Rectangle {
                color: "transparent"
              }
              onClicked: Mpris.players.values[0].next()
              hoverEnabled: false
            }
          }
        }

//################# Volume Slider - Disabled #################//
/*         Slider {
          id: volume_slider
          width: 80
          height: 10
          anchors.verticalCenter: control_box.verticalCenter
          anchors.right: song_info.right
          from: 0
          to: 1
          value: root.player_volume
          stepSize: 0.01
          hoverEnabled: false
 
        

          onValueChanged: {
            Mpris.players.values[0].volume = 0;
          }
        } */

        NumberAnimation {
          id: scrollAnim
          target: popup_song_name
          property: "x"
          from: 10
          to: -(popup_song_name.width + 40) + song_info.width
          duration: (popup_song_name.width / player.speed) * 1000
          loops: Animation.Infinite
          running: popup_song_name.width > song_info.width ? true : false
        }
        Component.onCompleted: {
          if (popup_song_name.width > width)
            scrollAnim.start();
        }
      }
    }
  }
}
