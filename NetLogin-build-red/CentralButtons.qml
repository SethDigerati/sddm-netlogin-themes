// CentralButtons.qml

import QtQuick 2.0



// central panel buttons
Item {
    id: centralbuttonsroot

    // size includes three buttons (bg button hidden if <= 1)
    width: sessionbutton.width + (bgCount > 1 ? bgbutton.width : 0) + layoutbutton.width
    // height is the same as sessionbutton height
    height: sessionbutton.height



// PUBLIC PROPERTIES AND PROPERTIES HOLDING A PUBLIC FUNCTIONS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    // this property holds an openSessionMenu() function from "Main.qml"
    property var openSessionMenu

    // this property holds an openBackgroundMenu() function from "Main.qml"
    property var openBackgroundMenu

    // this property holds an openLayoutMenu() function from "Main.qml"
    property var openLayoutMenu


    property var setFocus

    // number of available backgrounds; hide button when <= 1
    property int bgCount: 0



    // last button which had focus
    property string last_focussed_button: "session"



    // giveFocus: unfocus all of the available bottom buttons
    function giveFocus(button) {
        // do actions depending on button type
        switch (button) {
        // sessionbutton has to receive a focus
        case "session":
            // set the last_focussed_button button to "session"
            last_focussed_button = button;
            // give sessionbutton the focus
            sessionbutton.focus = true;
            break;

        // bgbutton has to receive a focus
        case "background":
            // set the last_focussed_button button to "background"
            last_focussed_button = button;
            // give bgbutton the focus
            bgbutton.focus = true;
            break;

        // layoutbutton has to receive a focus
        case "layout":
            // set the last_focussed_button button to "layout"
            last_focussed_button = button;
            // give layoutbutton the focus
            layoutbutton.focus = true;
            break;

        // last hovered buton receives a focus
        case "last":
            // is last_focussed_button the "layout"?
            if (last_focussed_button === "layout") {
                // give focus to layoutbutton
                layoutbutton.focus = true;
            } else if (last_focussed_button === "background") {
                // give focus to bgbutton
                bgbutton.focus = true;
            } else {
                // give focus to sessionbutton
                sessionbutton.focus = true;
            }
            break;
        }
    }



// SESSION BUTTON
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    // Session button white
    ButtonWhite {
        id: sessionbutton
        // width and height of a ButtonWhite from ButtonWhite.qml
        width: buttonwidth
        height: buttonheight

        // button type is "left"
        buttontype: "left"

        // button label is translated (session)
        buttonlabel: textConstants.session

        // place it by the left side of the bgbutton
        anchors.right: bgbutton.left

        // do actions when component is completed
        Component.onCompleted: {
            // assign an openSessionMenu from "Main.qml" to openMenu property in "ButtonWhite.qml"
            sessionbutton.openMenu = centralbuttonsroot.openSessionMenu;
        }

        // key navigations
        // on RIGHT key pressed go to background button
        KeyNavigation.right: bgbutton
        // on TAB key pressed go to background button
        KeyNavigation.tab: bgbutton

        // keyboard navigation and actions
        Keys.onPressed: event => {
            // when BACKTAB or ESCAPE key is pressed
            if (event.key === Qt.Key_Backtab || event.key === Qt.Key_Escape || event.key === Qt.Key_Up) {
                // remember the last focussed button
                last_focussed_button = "session";
                // go directly to login
                setFocus("login");
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when RETURN/ENTER or SPACE key is pressed
            } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Space) {
                // provide the mouse click action; button is pressed
                // open the session menu
                sessionbutton.onClicked();
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when DOWN key is pressed
            } else if (event.key === Qt.Key_Down) {
                // remember the last focussed button
                last_focussed_button = "session";
                // give focus to the nearest possible button from hibernate to the right
                setFocus("bottombuttons", "middle");
                // do not let the event to propagate down to parent
                event.accepted = true;
            }
        }
    }



    // BACKGROUND BUTTON
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // background (wallpaper) button white
    ButtonWhite {
        id: bgbutton
        // hide if only one or zero backgrounds
        visible: bgCount > 1
        // width and height of a ButtonWhite from ButtonWhite.qml
        width: buttonwidth
        height: buttonheight

        // button type is "middle"
        buttontype: "left"

        // button label
        buttonlabel: "Background"

        // place it centred between session and layout
        anchors.horizontalCenter: parent.horizontalCenter

        // do actions when component is completed
        Component.onCompleted: {
            // assign an openBackgroundMenu from "Main.qml" to openMenu property in "ButtonWhite.qml"
            bgbutton.openMenu = centralbuttonsroot.openBackgroundMenu;
        }

        // key navigations
        KeyNavigation.left: sessionbutton
        KeyNavigation.right: layoutbutton
        KeyNavigation.backtab: sessionbutton
        KeyNavigation.tab: layoutbutton

        // keyboard navigation and actions
        Keys.onPressed: event => {
            // when ESCAPE or UP key is pressed
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Up) {
                // remember the last focussed button
                last_focussed_button = "background";
                // go directly to login
                setFocus("login");
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when RETURN/ENTER or SPACE key is pressed
            } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Space) {
                // open the background menu
                bgbutton.onClicked();
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when DOWN key is pressed
            } else if (event.key === Qt.Key_Down) {
                // remember the last focussed button
                last_focussed_button = "background";
                // give focus to bottom buttons
                setFocus("bottombuttons", "middle");
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when TAB key is pressed
            } else if (event.key === Qt.Key_Tab) {
                // give focus to bottom buttons
                setFocus("bottombuttons", "left");
                // do not let the event to propagate down to parent
                event.accepted = true;
            }
        }
    }



    // LAYOUT BUTTON
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    // layout (keyboard) button white
    ButtonWhite {
        id: layoutbutton
        // width and height of a ButtonWhite from ButtonWhite.qml
        width: buttonwidth
        height: buttonheight

        // button type is "right"
        buttontype: "right"

        // button label is translated (layout)
        buttonlabel: textConstants.layout

        // place it by the right side of the bgbutton
        anchors.left: bgbutton.right

        // do actions when component is completed
        Component.onCompleted: {
            // assign an openLayoutMenu from "Main.qml" to openMenu property in "ButtonWhite.qml"
            layoutbutton.openMenu = centralbuttonsroot.openLayoutMenu;
        }



        // key navigations
        // on LEFT key pressed go to background button
        KeyNavigation.left: bgbutton
        // on BACKTAB key pressed go to background button
        KeyNavigation.backtab: bgbutton

        // keyboard navigation and actions
        Keys.onPressed: event => {
            // when ESCAPE key is pressed
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Up) {
                // remember the last focussed button
                last_focussed_button = "layout";
                // go directly to login
                setFocus("login");
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when RETURN/ENTER or SPACE key is pressed
            } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Space) {
                // provide the mouse click action; button is pressed
                // open the keyboard layout menu
                layoutbutton.onClicked();
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when DOWN key is pressed
            } else if (event.key === Qt.Key_Down) {
                // remember the last focussed button
                last_focussed_button = "layout";
                // give focus to the nearest possible button from hibernate to the right
                setFocus("bottombuttons", "middle");
                // do not let the event to propagate down to parent
                event.accepted = true;

            // when TAB key is pressed
            } else if (event.key === Qt.Key_Tab) {
                // give focus to the nearest possible button from hibernate to the right
                setFocus("bottombuttons", "left");
                // do not let the event to propagate down to parent
                event.accepted = true;
            }
        } // Keys.onPressed END
    } // keyboard/layout button white END
} // central panel buttons END
