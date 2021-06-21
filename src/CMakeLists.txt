set(
    KQCC_SOURCES

    kquickchatcomponentsplugin.cpp
    resources.qrc

    ${kquickimageeditor_QM_LOADER}
)

set(
    KQCC_PLUGINDATA

    controls/qmldir
)

add_library(
    kquickchatcomponentsplugin
    SHARED

    ${KQCC_SOURCES} ${KQCC_PLUGINDATA}
)

target_link_libraries(
    kquickchatcomponentsplugin
    PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Qml
)

if (BUILD_SHARED_LIBS)
    install(DIRECTORY controls/ DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/kquickchatcomponents)
    install(TARGETS kquickchatcomponentsplugin DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/kquickchatcomponents)

    include(ECMGeneratePriFile)
    ecm_generate_pri_file(BASE_NAME KQuickChatComponents LIB_NAME KQuickChatComponents DEPS "core qml quick" FILENAME_VAR PRI_FILENAME )
    install(FILES ${PRI_FILENAME}
            DESTINATION ${ECM_MKSPECS_INSTALL_DIR})
endif()

