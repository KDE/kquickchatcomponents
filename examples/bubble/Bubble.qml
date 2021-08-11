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

    background: Rectangle {
        color: "white"
    }

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
    }
}
