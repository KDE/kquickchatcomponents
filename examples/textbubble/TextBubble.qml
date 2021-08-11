import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import org.kde.kquickchatcomponents 1.0 as KQCC
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ApplicationWindow {
    visible: true
    id: messagesViewRoot

    background: Rectangle {
        color: "white"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        KQCC.TextBubble {
            before: [
                Kirigami.Heading {
                    text: "author"
                    level: 4
                }
            ]
            text: "foo bar"
            isOwnMessage: true
            fromLeft: true
        }
        KQCC.TextBubble {
            text: "foo bar"
            isOwnMessage: false
            fromLeft: false
            after: [
                Kirigami.Heading {
                    text: "web page embed"
                    level: 4
                }
            ]
        }
        KQCC.TextBubble {
            text: "look at how i deal with the timestamp"
            isOwnMessage: false
            fromLeft: false

            bubble.inlineFooterContent: [
                QQC2.Label {
                    text: "19:13"
                    opacity: 0.5

                    font.pointSize: -1
                    font.pixelSize: Kirigami.Units.gridUnit * (2/3)
                }
            ]
        }
        KQCC.TextBubble {
            text: "look at how i deal with the\ntimestamp"
            isOwnMessage: false
            fromLeft: false

            bubble.inlineFooterContent: [
                QQC2.Label {
                    text: "19:13"
                    opacity: 0.5

                    font.pointSize: -1
                    font.pixelSize: Kirigami.Units.gridUnit * (2/3)
                }
            ]
        }
    }
}
