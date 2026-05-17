import QtQuick 2.0

Item {
    id: btn
    width: w; height: h
    property string label: ""
    property real w: 56
    property real h: 36
    property real fs: 16
    property string bg: "#44ffffff"
    signal clicked

    Rectangle {
        anchors.fill: parent; radius: 4
        color: mouseArea.containsMouse ? "#88ffffff" : bg
        border.color: "#88ffffff"; border.width: 1
        Text {
            anchors.centerIn: parent
            text: label
            font.family: "Sans"; font.pixelSize: fs; font.bold: true; color: "white"
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: clicked()
    }
}
