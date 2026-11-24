cmake_minimum_required(VERSION 3.16)

project(glacier-settings-accounts
        VERSION 0.1
        DESCRIPTION "Glacier settings accounts plugin")

include(FeatureSummary)
include(GNUInstallDirs)

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Default install prefix" FORCE)
endif()

set(QT_MIN_VERSION "6.0.0")
find_package(Qt6 COMPONENTS Core Qml Quick LinguistTools NetworkAuth REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(src)
add_subdirectory(service_types)
add_subdirectory(providers)
