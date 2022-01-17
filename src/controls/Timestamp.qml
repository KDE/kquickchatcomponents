// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.12 as Kirigami

Row {
    id: _rootRow

    property string icon: ""
    property date date: new Date()
    property bool edited: false
    property string text: {
        const time = date.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)

        if (edited) {
            return qsTr("edited %1").arg(time)
        } else {
            return time
        }
    }
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