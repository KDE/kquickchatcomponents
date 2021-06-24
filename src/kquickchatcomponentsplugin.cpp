// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

#include <QQmlEngine>
#include <QResource>

#include "kquickchatcomponentsplugin.h"

void KQuickChatComponentsPlugin::registerTypes(const char *uri)
{
    Q_UNUSED(uri)

#if defined(Q_OS_ANDROID) && QT_VERSION >= QT_VERSION_CHECK(5, 14, 0)
    QResource::registerResource(QStringLiteral("assets:/android_rcc_bundle.rcc"));
#endif

    qmlRegisterModule(uri, 1, 0);

    qmlProtectModule(uri, 1);
}
