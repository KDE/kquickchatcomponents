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

    component MessageBubble : QQC2.Control {
        id: bubble

        required property string text
        required property bool isOwnMessage
        required property bool fromLeft

        topPadding: Kirigami.Units.largeSpacing
        bottomPadding: Kirigami.Units.largeSpacing
        leftPadding: bubble.fromLeft ? Kirigami.Units.largeSpacing+2+Kirigami.Units.largeSpacing : Kirigami.Units.largeSpacing+2
        rightPadding: bubble.fromLeft ? Kirigami.Units.largeSpacing+2 : Kirigami.Units.largeSpacing+2+Kirigami.Units.largeSpacing

        contentItem: QQC2.Label {
            text: bubble.text
        }
        background: KQCC.ChatBubble {
            tailSize: Kirigami.Units.largeSpacing
            tailVisible: true
            tailDirection: bubble.fromLeft ? KQCC.ChatBubble.TailDirection.FromLeft : KQCC.ChatBubble.TailDirection.FromRight

            Kirigami.Theme.backgroundColor: {
                if (bubble.isOwnMessage)
                    return Kirigami.ColorUtils.tintWithAlpha(messagesViewRoot.Kirigami.Theme.backgroundColor, messagesViewRoot.Kirigami.Theme.focusColor, 0.2)

                if (Kirigami.ColorUtils.brightnessForColor(messagesViewRoot.Kirigami.Theme.backgroundColor) == Kirigami.ColorUtils.Light)
                    return Qt.darker(messagesViewRoot.Kirigami.Theme.backgroundColor, 1.1)
                else
                    return Qt.lighter(messagesViewRoot.Kirigami.Theme.backgroundColor, 1.3)
            }
            Kirigami.Theme.inherit: false
        }
    }
    Column {
        anchors.centerIn: parent
        spacing: 20

        MessageBubble {
            text: "foo bar"
            isOwnMessage: true
            fromLeft: true
        }
        MessageBubble {
            text: "foo bar"
            isOwnMessage: false
            fromLeft: false
        }
    }
}
