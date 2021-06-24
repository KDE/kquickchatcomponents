// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.10
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.14 as Kirigami

Item {
    id: backgroundRoot

    required property bool tailVisible
    required property int tailSize

    clip: true

    Item {
        id: tailBase
        clip: true
        visible: false

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

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            leftMargin: -backgroundRoot.tailSize*2
            rightMargin: -backgroundRoot.tailSize
            right: mainBG.left
        }
        Kirigami.ShadowedRectangle {
            anchors.fill: parent
            anchors.rightMargin: backgroundRoot.tailSize

            width: backgroundRoot.tailSize*3
            color: "black"

            corners {
                topLeftRadius: 0
                topRightRadius: 0
                bottomRightRadius: backgroundRoot.tailSize*10
                bottomLeftRadius: 0
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
            topLeftRadius: 4
            topRightRadius: 4
            bottomRightRadius: 4
            bottomLeftRadius: 4
        }
        color: Kirigami.Theme.backgroundColor
        anchors.fill: parent
        anchors.leftMargin: backgroundRoot.tailSize
    }
}