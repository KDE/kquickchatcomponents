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

            bubble.inlineFooter.data: [
                KQCC.Timestamp {
                    date: new Date() // now
                    edited: true
                }
            ]
        }
        KQCC.TextBubble {
            text: "مرحبا بالعالم"
            bubble.inlineFooter.data: [
                KQCC.Timestamp {
                    date: new Date() // now
                    edited: true
                }
            ]
        }
        KQCC.TextBubble {
            text: "look at how i deal with the\ntimestamp"
            isOwnMessage: false
            fromLeft: false

            bubble.inlineFooter.data: [
                KQCC.Timestamp {
                    icon: "clock"
                    date: new Date() // now
                }
            ]
        }
    }
}
