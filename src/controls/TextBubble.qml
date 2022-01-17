// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

import org.kde.kquickchatcomponents 1.0 as KQCC
import org.kde.kquickchatcomponents.private 1.0 as Private

/**
 * A BubbleControl displaying text.
 */
BubbleControl {
    id: bubble

    /**
     * The text displayed by the control.
     */
    required property string text

    // QML doesn't let us set such a nested thing as a binding
    // (neither syntactic nor Binding object)
    // so we need to manually update this property ourselves.
    onTextChanged: if (mirrorInlineFooter) {
        this.bubble.inlineFooter.LayoutMirroring.enabled = Private.Utilities.isRTL(this.text)
    }

    /**
     * The TextEdit used to display the text.
     */
    property alias textEdit: tEdit

    /**
     * Items that should be placed before the text.
     */
    property alias before: before.data

    /**
     * Items that should be placed after the text.
     */
    property alias after: after.data

    /**
     * Whether the control should automatically mirror
     * the bubble's inline footer to dodge the text.
     */
    property bool mirrorInlineFooter: true

    QQC2.Label {
        id: dummy
        text: " "
    }

    contentItem: ColumnLayout {
        id: col

        readonly property string textPadding: " ".repeat(Math.ceil(bubble.bubble.inlineFooter.implicitWidth / dummy.implicitWidth)) + "⠀"

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