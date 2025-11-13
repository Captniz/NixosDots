// ClockWidget.qml
import QtQuick
import QtQuick.Layouts
import "../src"
import "../"

D_WidgetContainer {
  id: root
  width: child.width
  height: 25
  Text {
    leftPadding: 5
    rightPadding: 5
    id: child
    anchors.centerIn: root
    color: Globals.fg0
    text: D_Time.time
    font.family: Globals.font_2
    font.italic: true
    font.weight: 600
  }
}
