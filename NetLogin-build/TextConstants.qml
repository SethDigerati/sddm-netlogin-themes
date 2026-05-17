import QtQuick 2.0

QtObject {
    readonly property string capslockWarning:   qsTr("Warning, Caps Lock is ON!")
    readonly property string layout:            qsTr("Layout")
    readonly property string login:             qsTr("Login")
    readonly property string loginFailed:       qsTr("Login failed")
    readonly property string loginSucceeded:    qsTr("Login succeeded")
    readonly property string password:          qsTr("Password")
    readonly property string emptyPassword:     qsTr("Please enter a password!")
    readonly property string promptSelectUser:  qsTr("Select your user and enter password")
    readonly property string reboot:            qsTr("Reboot")
    readonly property string session:           qsTr("Session")
    readonly property string shutdown:          qsTr("Shutdown")
    readonly property string suspend:           qsTr("Suspend")
    readonly property string hibernate:         qsTr("Hibernate")
    readonly property string userName:          qsTr("Username")
    readonly property string welcomeText:       qsTr("Welcome to %1")
}
