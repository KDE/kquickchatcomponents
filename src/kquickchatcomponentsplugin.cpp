#include <QQmlEngine>
#include <QResource>

#include "kquickchatcomponentsplugin.h"

void KQuickChatComponentsPlugin::registerTypes(const char *uri)
{
    Q_UNUSED(uri)

#if defined(Q_OS_ANDROID) && QT_VERSION >= QT_VERSION_CHECK(5, 14, 0)
    QResource::registerResource(QStringLiteral("assets:/android_rcc_bundle.rcc"));
#endif
}
