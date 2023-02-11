cmake_minimum_required(VERSION 3.6.0)

project(glacier-settings-accounts
        VERSION 0.1
        DESCRIPTION "Glacier settings accounts plugin")


include(FeatureSummary)
include(GNUInstallDirs)
set(CMAKE_INSTALL_PREFIX /usr)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)

find_package(Qt5 COMPONENTS Core Qml Quick LinguistTools NetworkAuth REQUIRED)

add_subdirectory(src)
add_subdirectory(service_types)
add_subdirectory(providers)
