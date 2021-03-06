// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

#pragma once

#include <QDir>
#include <QQmlExtensionPlugin>

class KQuickChatComponentsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
private:
    QString resolveFilePath(const QString &path) const
    {
#if defined(Q_OS_ANDROID) && QT_VERSION >= QT_VERSION_CHECK(5, 14, 0)
        return QStringLiteral(":/android_rcc_bundle/qml/org/kde/kquickchatcomponents/") + path;
#else
        return baseUrl().toLocalFile() + QLatin1Char('/') + path;
#endif
    }
    QString resolveFileUrl(const QString &filePath) const
    {
#if defined(Q_OS_ANDROID) && QT_VERSION >= QT_VERSION_CHECK(5, 14, 0)
        return QStringLiteral("qrc:/android_rcc_bundle/qml/org/kde/kquickchatcomponents/") + filePath;
#else
        return baseUrl().toString() + QLatin1Char('/') + filePath;
#endif
    }
};

