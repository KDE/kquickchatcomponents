// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

/**
 * A QtQuick.Controls.Control subclass wrapping the raw ChatBubble
 * as a background, allowing you to provide a contentItem that
 * gets fitted into the bubble.
 */
QQC2.Control {
    id: bubble

    /**
     * Whether or not this is a message from the user using the app.
     * A visual treatment will be applied indicating that this
     * is the case.
     */
    required property bool isOwnMessage

    /**
     * Whether or not the message's tail should go from the left.
     * By default, the message's tail always from the right,
     * regardless of right-to-left or other similar conditions.
     */
    required property bool fromLeft

    /**
     * The ChatBubble providing the background for this control.
     */
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
