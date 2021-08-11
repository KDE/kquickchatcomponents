// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

QQC2.Control {
    id: bubble

    required property bool isOwnMessage
    required property bool fromLeft
    property alias bubble: bubbleBG

    topPadding: Kirigami.Units.largeSpacing
    bottomPadding: Kirigami.Units.largeSpacing
    leftPadding: bubble.fromLeft ? Kirigami.Units.largeSpacing+2+Kirigami.Units.largeSpacing : Kirigami.Units.largeSpacing+2
    rightPadding: bubble.fromLeft ? Kirigami.Units.largeSpacing+2 : Kirigami.Units.largeSpacing+2+Kirigami.Units.largeSpacing

    background: ChatBubble {
        id: bubbleBG

        tailSize: Kirigami.Units.largeSpacing
        tailVisible: true
        tailDirection: bubble.fromLeft ? ChatBubble.TailDirection.FromLeft : ChatBubble.TailDirection.FromRight

        Kirigami.Theme.backgroundColor: {
            if (bubble.isOwnMessage)
                return Kirigami.ColorUtils.tintWithAlpha(bubble.parent.Kirigami.Theme.backgroundColor, bubble.parent.Kirigami.Theme.focusColor, 0.2)

            if (Kirigami.ColorUtils.brightnessForColor(bubble.parent.Kirigami.Theme.backgroundColor) == Kirigami.ColorUtils.Light)
                return Qt.darker(bubble.parent.Kirigami.Theme.backgroundColor, 1.1)
            else
                return Qt.lighter(bubble.parent.Kirigami.Theme.backgroundColor, 1.3)
        }
        Kirigami.Theme.inherit: false
    }
}
