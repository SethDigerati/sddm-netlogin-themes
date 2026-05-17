import QtQuick 2.0

Item {
    id: keyboardRoot
    width: mainroot ? mainroot.width : 1024
    height: pinMode ? 160 : 220

    property var mainroot
    property bool pinMode: false
    property bool shifted: false
    property var appendChar
    property var deleteChar

    property real keyW: pinMode ? 72 : 56
    property real keyH: 36
    property real gap: 4
    property real fsize: 16

    Rectangle {
        anchors.fill: parent; color: "transparent"
        Column {
            anchors.centerIn: parent; spacing: gap

            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: pinMode
                OSKKey { label: "1"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("1") }
                OSKKey { label: "2"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("2") }
                OSKKey { label: "3"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("3") }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: pinMode
                OSKKey { label: "4"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("4") }
                OSKKey { label: "5"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("5") }
                OSKKey { label: "6"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("6") }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: pinMode
                OSKKey { label: "7"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("7") }
                OSKKey { label: "8"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("8") }
                OSKKey { label: "9"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("9") }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: pinMode
                OSKKey { label: "⌫"; w: keyW * 1.5; h: keyH; fs: fsize; onClicked: deleteChar() }
                OSKKey { label: "0"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar("0") }
            }

            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: !pinMode
                OSKKey { label: shifted ? "Q" : "q"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "Q" : "q") }
                OSKKey { label: shifted ? "W" : "w"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "W" : "w") }
                OSKKey { label: shifted ? "E" : "e"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "E" : "e") }
                OSKKey { label: shifted ? "R" : "r"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "R" : "r") }
                OSKKey { label: shifted ? "T" : "t"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "T" : "t") }
                OSKKey { label: shifted ? "Y" : "y"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "Y" : "y") }
                OSKKey { label: shifted ? "U" : "u"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "U" : "u") }
                OSKKey { label: shifted ? "I" : "i"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "I" : "i") }
                OSKKey { label: shifted ? "O" : "o"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "O" : "o") }
                OSKKey { label: shifted ? "P" : "p"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "P" : "p") }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: !pinMode
                OSKKey { label: shifted ? "A" : "a"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "A" : "a") }
                OSKKey { label: shifted ? "S" : "s"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "S" : "s") }
                OSKKey { label: shifted ? "D" : "d"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "D" : "d") }
                OSKKey { label: shifted ? "F" : "f"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "F" : "f") }
                OSKKey { label: shifted ? "G" : "g"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "G" : "g") }
                OSKKey { label: shifted ? "H" : "h"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "H" : "h") }
                OSKKey { label: shifted ? "J" : "j"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "J" : "j") }
                OSKKey { label: shifted ? "K" : "k"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "K" : "k") }
                OSKKey { label: shifted ? "L" : "l"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "L" : "l") }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: !pinMode
                OSKKey { label: "⇧"; w: keyW * 1.5; h: keyH; fs: fsize; bg: shifted ? "#66ffffff" : "#44ffffff"; onClicked: shifted = !shifted }
                OSKKey { label: shifted ? "Z" : "z"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "Z" : "z") }
                OSKKey { label: shifted ? "X" : "x"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "X" : "x") }
                OSKKey { label: shifted ? "C" : "c"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "C" : "c") }
                OSKKey { label: shifted ? "V" : "v"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "V" : "v") }
                OSKKey { label: shifted ? "B" : "b"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "B" : "b") }
                OSKKey { label: shifted ? "N" : "n"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "N" : "n") }
                OSKKey { label: shifted ? "M" : "m"; w: keyW; h: keyH; fs: fsize; onClicked: appendChar(shifted ? "M" : "m") }
                OSKKey { label: "⌫"; w: keyW * 1.5; h: keyH; fs: fsize; onClicked: deleteChar() }
            }
            Row { spacing: gap; anchors.horizontalCenter: parent.horizontalCenter; visible: !pinMode
                OSKKey { label: " "; w: keyW * 7; h: keyH; fs: fsize; onClicked: appendChar(" ") }
            }
        }
    }
}
