import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Io
import "../"

Rectangle {
  id: root
  width: 100
  height: 20
  property string name
  property string icon
  property list<string> comm
  property var closePopUp
  color: Globals.bg1

  MouseArea {
    anchors.fill: root
    anchors.centerIn: root
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      notify.running = true;
      timer.running = true;
      closePopUp();
    }

    Timer {
      id: timer
      interval: 3000
      running: false
      repeat: false
      onTriggered: {
        action.running = true;
      }
    }

    Process {
      id: action
      command: comm
      running: false
    }
    Process {
      id: notify
      command: ["notify-send", "--urgency=critical", "--app-name=System", name, "The system will " + name.toLowerCase() + " now. Cya!"]
      running: false
    }
  }
  Row {
    id: texts
    anchors.left: parent.left
    width: 100
    height: parent.height
    padding: 5
    spacing: 20
    Text {
      id: iconText
      anchors.verticalCenter: parent.verticalCenter
      text: icon
      color: Globals.bright_orange
      font.pointSize: 8
    }

    Text {
      id: nameText
      anchors.verticalCenter: parent.verticalCenter
      text: name
      color: Globals.fg1
      font.pointSize: 8
    }
  }
}
