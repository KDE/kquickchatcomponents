// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.12 as Kirigami

/**
 * A timestamp control, for use as a bubble's inline footer.
 */
Row {
    id: _rootRow

    /**
     * The icon displayed by the timestamp.
     */
    property string icon: ""

    /**
     * The date displayed by the timestamp.
     */
    property date date: new Date()

    /**
     * Whether or not this is the timestamp of
     * an edited message.
     */
    property bool edited: false

    /**
     * The text of the timestamp. By default, affected by
     * the date and edited properties.
     */
    property string text: {
        const time = date.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)

        if (edited) {
            return qsTr("edited %1").arg(time)
        } else {
            return time
        }
    }

    /**
     * The tooltip text of the timestamp. By default, affected by
     * the date property.
     */
    property string tooltipText: {
        const time = date.toLocaleString(Qt.locale(), Locale.LongFormat)

        return time
    }

    spacing: Math.round(Kirigami.Units.smallSpacing / 2)

    Kirigami.Icon {
        width: 16
        height: 16
        opacity: 0.5
        source: _rootRow.icon
        visible: _rootRow.icon !== ""
        anchors.bottom: _timestamp.bottom
    }
    QQC2.Label {
        id: _timestamp
        text: _rootRow.text

        opacity: 0.5
        font.pointSize: -1
        font.pixelSize: Math.round(Kirigami.Units.gridUnit * (2/3))
    }

    HoverHandler {
        id: hov
        cursorShape: Qt.SplitHCursor
    }

    QQC2.ToolTip {
        text: _rootRow.tooltipText
        delay: Qt.styleHints.mousePressAndHoldInterval
        visible: hov.hovered
    }
}