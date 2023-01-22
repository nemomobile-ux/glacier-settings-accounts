cmake_minimum_required(VERSION 3.6.0)

project(glacier-settings-accounts
        VERSION 0.0.2
        DESCRIPTION "Glacier settings accounts plugin")


include(FeatureSummary)
include(GNUInstallDirs)
set(CMAKE_INSTALL_PREFIX /usr)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)


SET(PLUGIN accounts)
SET(SRC accountssettingsplugin.cpp)
SET(HEADERS accountssettingsplugin.h)

SET(PLUGINS_FILES
    accounts.qml
    accounts.js
    accounts.svg
    CreateAccountSheet.qml
)

find_package(Qt5 COMPONENTS Core Qml Quick LinguistTools NetworkAuth REQUIRED)

add_definitions(-DQT_PLUGIN)

add_library(accounts MODULE ${SRC} ${HEADERS})

target_link_libraries(accounts
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
    -lglaciersettings
    )
#    Glacier::Settings

target_include_directories(accounts PUBLIC "/usr/include/glacier-settings/")

add_subdirectory(providers)

install(TARGETS ${PLUGIN}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/glacier-settings/)

INSTALL(FILES ${PLUGINS_FILES}
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/${PLUGIN}/)

# Translations
file(GLOB TS_FILES translations/*.ts)
#set_source_files_properties(${TS_FILES} PROPERTIES OUTPUT_LOCATION ${CMAKE_INSTALL_LOCALEDIR})
qt5_add_translation(QM_FILES ${TS_FILES})
add_custom_target(accounts_translations DEPENDS ${QM_FILES})
add_dependencies(accounts accounts_translations)

install(FILES ${QM_FILES}
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/translations)

