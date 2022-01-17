// SPDX-FileCopyrightText: 2022 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

#include <QGuiApplication>

#include "utilities.h"

bool KQCCUtilities::isRTL(const QString& str)
{
    for (const auto& rune : str) {
        if (rune.direction() == QChar::DirR || rune.direction() == QChar::DirAL) {
            return true;
        } else if (rune.direction() == QChar::DirL) {
            return false;
        }
    }
    return QGuiApplication::isRightToLeft();
}
