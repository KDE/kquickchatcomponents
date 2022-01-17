// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

/**
 * The raw bubble shape used in chat apps as a plain Item.
 * If you're looking for a high-level component, check out
 * the BubbleControl.
 */
Item {
    id: backgroundRoot

    /**
     * Whether or not the tail of the chat bubble is visible.
     */
    required property bool tailVisible
    /**
     * How large the tail is.
     */
    required property int tailSize
    /**
     * Which direction the tail comes from: if it comes
     * from the left edge of the bubble, or the right edge.
     */
    property int tailDirection: ChatBubble.TailDirection.FromLeft
    /**
     * How rounded the bubble is.
     */
    property int radius: 4
    /**
     * A Row placed in the bottom corner of the background.
     */
    property alias inlineFooter: _row

    /**
     * The directions the tail can come from.
     */
    enum TailDirection {
        /** From the left edge of the bubble. */
        FromLeft,
        /** From the right edge of the bubble. */
        FromRight
    }

    Item {
        id: tailBase
        clip: true
        visible: false

        LayoutMirroring.enabled: backgroundRoot.tailDirection === ChatBubble.TailDirection.FromRight
        LayoutMirroring.childrenInherit: true

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            leftMargin: -backgroundRoot.tailSize*2
            rightMargin: -backgroundRoot.tailSize
            right: mainBG.left
        }
        Rectangle {
            color: Kirigami.Theme.backgroundColor

            anchors.fill: parent
            anchors.topMargin: 4
            anchors.rightMargin: -backgroundRoot.tailSize
        }
    }
    Item {
        id: tailMask
        clip: true
        visible: false

        LayoutMirroring.enabled: backgroundRoot.tailDirection === ChatBubble.TailDirection.FromRight
        LayoutMirroring.childrenInherit: true

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            leftMargin: -backgroundRoot.tailSize*2
            rightMargin: -backgroundRoot.tailSize
            right: mainBG.left
        }
        Kirigami.ShadowedRectangle {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: backgroundRoot.tailSize

            width: backgroundRoot.tailSize*3
            color: "black"

            corners {
                topLeftRadius: 0
                topRightRadius: 0
                bottomRightRadius: (backgroundRoot.tailDirection === ChatBubble.TailDirection.FromRight) ? 0 : (backgroundRoot.tailSize*10)
                bottomLeftRadius: (backgroundRoot.tailDirection === ChatBubble.TailDirection.FromRight) ? (backgroundRoot.tailSize*10) : 0
            }
        }
    }
    OpacityMask {
        anchors.fill: tailBase
        source: tailBase
        maskSource: tailMask
        invert: true
        visible: backgroundRoot.tailVisible
    }
    Kirigami.ShadowedRectangle {
        id: mainBG
        corners {
            topLeftRadius: backgroundRoot.radius
            topRightRadius: backgroundRoot.radius
            bottomRightRadius: backgroundRoot.radius
            bottomLeftRadius: backgroundRoot.radius
        }
        color: Kirigami.Theme.backgroundColor
        anchors.fill: parent
        anchors.leftMargin: backgroundRoot.tailSize
        LayoutMirroring.enabled: backgroundRoot.tailDirection === ChatBubble.TailDirection.FromRight
    }
    Row {
        id: _row
        spacing: 2

        anchors {
            bottom: parent.bottom
            right: mainBG.right
            margins: Kirigami.Units.smallSpacing
            rightMargin: Kirigami.Units.largeSpacing+2
        }
    }
    layer.enabled: true
    layer.effect: DropShadow {
        cached: true
        horizontalOffset: 0
        verticalOffset: 1
        radius: 2.0
        samples: 17
        color: "#30000000"
    }
}