cmake_minimum_required(VERSION 3.5)

# version and project boilerplate
set(KF5_VERSION "5.70.0")
set(KQCC_VERSION "0.1")
set(REQUIRED_QT_VERSION 5.15.0)

set(CMAKE_AUTOMOC ON)

project(KQuickChatComponents LANGUAGES CXX VERSION ${KQCC_VERSION})

# ecm boilerplate

find_package(ECM ${KF5_VERSION} NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

# module boilerplate
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)

include(ECMSetupVersion)

include(CMakePackageConfigHelpers)
include(FeatureSummary)

# CMake boilerplate
set(CMAKECONFIG_INSTALL_DIR "${KDE_INSTALL_CMAKEPACKAGEDIR}/KQuickChatComponents")

configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/KQuickChatComponentsConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/KQuickChatComponentsConfig.cmake"
    INSTALL_DESTINATION  ${CMAKECONFIG_INSTALL_DIR}
    PATH_VARS  KF5_INCLUDE_INSTALL_DIR CMAKE_INSTALL_PREFIX
)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/KQuickChatComponentsConfigVersion.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/KQuickChatComponentsConfig.cmake"
    DESTINATION "${CMAKECONFIG_INSTALL_DIR}"
    COMPONENT Devel
)

ecm_setup_version(${KQCC_VERSION}
    VARIABLE_PREFIX KQUICKCHATCOMPONENTS
    PACKAGE_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/KQuickChatComponentsConfigVersion.cmake"
    SOVERSION 1
)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

add_subdirectory(src)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
