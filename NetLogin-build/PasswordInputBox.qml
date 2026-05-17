import QtQuick 2.0

FocusScope {
    id: container
    width: 80; height: 30

    property alias color: innerBox.color
    property alias borderColor: innerBox.borderColor
    property alias focusColor: innerBox.focusColor
    property alias hoverColor: innerBox.hoverColor
    property alias radius: innerBox.radius
    property alias font: innerBox.font
    property alias textColor: innerBox.textColor
    property alias echoMode: innerBox.echoMode
    property alias text: innerBox.text

    property alias image: img.source
    property double imageFadeIn: 300
    property double imageFadeOut: 200

    property alias tooltipEnabled: tooltip.visible
    property alias tooltipText: tooltipText.text
    property alias tooltipFG: tooltipText.color
    property alias tooltipBG: tooltip.color

    property bool capsLock: false

    TextInputBox {
        id: innerBox
        width: parent.width; height: parent.height
        font.pixelSize: 14
        echoMode: TextInput.Password
        focus: true
    }

    Image {
        id: img
        opacity: 0
        state: capsLock ? "activated" : ""
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        smooth: true
        height: parent.height * 0.8
        source: "images/warning.png"
        sourceSize.width: width
        sourceSize.height: height
        anchors.rightMargin: 0.3 * width

        states: [
            State {
                name: "activated"
                PropertyChanges { target: img; opacity: 1 }
            },
            State {
                name: ""
                PropertyChanges { target: img; opacity: 0 }
            }
        ]

        transitions: [
            Transition {
                to: "activated"
                NumberAnimation { target: img; property: "opacity"; from: 0; to: 1; duration: container.imageFadeIn }
            },
            Transition {
                to: ""
                NumberAnimation { target: img; property: "opacity"; from: 1; to: 0; duration: container.imageFadeOut }
            }
        ]

        MouseArea {
            id: hoverArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.ArrowCursor
            onEntered: {
                tooltip.x = mouseX + img.x + 10
                tooltip.y = mouseY + 10
            }
            onPositionChanged: {
                tooltip.x = mouseX + img.x + 10
                tooltip.y = mouseY + 10
            }
        }
    }

    Rectangle {
        id: tooltip
        color: "lightblue"
        border.color: "black"
        border.width: 1
        width: 1.1 * tooltipText.implicitWidth
        height: 1.4 * tooltipText.implicitHeight
        radius: 2
        opacity: 0

        state: hoverArea.containsMouse && img.state == "activated" ? "activated" : ""

        states: [
            State {
                name: "activated"
                PropertyChanges { target: tooltip; opacity: 1 }
            },
            State {
                name: ""
                PropertyChanges { target: tooltip; opacity: 0 }
            }
        ]

        transitions: [
            Transition {
                to: "activated"
                NumberAnimation { target: tooltip; property: "opacity"; from: 0; to: 1; duration: container.imageFadeIn }
            },
            Transition {
                to: ""
                NumberAnimation { target: tooltip; property: "opacity"; from: 1; to: 0; duration: container.imageFadeOut }
            }
        ]

        Text {
            id: tooltipText
            anchors.centerIn: parent
            text: textConstants.capslockWarning
        }
    }
}
