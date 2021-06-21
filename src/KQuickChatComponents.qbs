// SPDX-FileCopyrightText: 2021 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

Library {
    name: "kquickchatcomponents"

    property string headersInstallDir: "include"

    files: [
        "./**.cpp",
        "./**.h",
        "resources.qrc",
    ]

    install: type.contains("dynamiclibrary")
    installDir: "lib64/qml/org/kde/kquickchatcomponents"

    Group {
        name: "QML resources"
        files: ["controls/**"]
        qbs.install: product.type.contains("dynamiclibrary")
        qbs.installDir: "lib64/qml/org/kde/kquickchatcomponents"
    }
    Qt.core.pluginMetaData: ["uri=org.kde.kquickchatcomponents"]

    Group {
        fileTagsFilter: ["Exporter.qbs.module"]
        qbs.installDir: "qbs/modules/kquickchatcomponents"
    }
    Depends { name: "Exporter.qbs" }

    Export {
        Depends { name: "cpp" }
        Depends { name: "Qt"; submodules: ["core", "qml", "quick"] }
    }

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["core", "qml", "quick"] }
}
