// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import org.kde.kquickchatcomponents 1.0 as KQCC
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ApplicationWindow {
    visible: true
    id: messagesViewRoot

    component MessageBubble : KQCC.BubbleControl {
        id: bubble

        required property string text

        contentItem: QQC2.Label {
            text: bubble.text
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
        MessageBubble { text: "0"; bubble.radius: 0; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "1"; bubble.radius: 1; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "2"; bubble.radius: 2; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "3"; bubble.radius: 3; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "4"; bubble.radius: 4; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "5"; bubble.radius: 5; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "6"; bubble.radius: 6; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "7"; bubble.radius: 7; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "8"; bubble.radius: 8; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "8"; bubble.radius: 8; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "9"; bubble.radius: 9; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "10"; bubble.radius: 10; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "11"; bubble.radius: 11; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "12"; bubble.radius: 12; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "13"; bubble.radius: 13; isOwnMessage: false; fromLeft: false }
        MessageBubble { text: "14"; bubble.radius: 14; isOwnMessage: false; fromLeft: false }
    }
}
