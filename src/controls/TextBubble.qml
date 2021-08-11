// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

BubbleControl {
    id: bubble

    required property string text
    property alias textEdit: tEdit
    property alias before: before.data
    property alias after: after.data

    QQC2.Label {
        id: dummy
        text: " "
    }

    contentItem: ColumnLayout {
        id: col

        readonly property string textPadding: " ".repeat(Math.ceil(bubble.bubble.inlineFooter.width / dummy.implicitWidth)) + "⠀"

        ColumnLayout { id: before; visible: implicitHeight > 0; Layout.fillWidth: true }

        TextEdit {
            id: tEdit

            text: bubble.text + col.textPadding

            function clamp() {
                const l = length - col.textPadding.length
                if (selectionEnd >= l && selectionStart >= l) {
                    select(0, 0)
                } else if (selectionEnd >= l) {
                    select(selectionStart, l)
                } else if (selectionStart >= l) {
                    select(l, selectionEnd)
                }
            }

            onSelectionStartChanged: clamp()
            onSelectionEndChanged: clamp()

            readOnly: true
            selectByMouse: !Kirigami.Settings.isMobile
            wrapMode: Text.Wrap

            color: Kirigami.Theme.textColor
            selectedTextColor: Kirigami.Theme.highlightedTextColor
            selectionColor: Kirigami.Theme.highlightColor

            HoverHandler {
                acceptedButtons: Qt.NoButton
                cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.IBeamCursor
            }

            Layout.fillWidth: true
        }

        ColumnLayout { id: after; visible: implicitHeight > 0; Layout.fillWidth: true }
    }
}