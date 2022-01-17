// SPDX-FileCopyrightText: 2022 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

#pragma once

#include <QObject>

class KQCCUtilities : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE bool isRTL(const QString& str);
};