SET(PLUGIN accounts)

SET(SRC ${PLUGIN}settingsplugin.cpp)
SET(HEADERS ${PLUGIN}settingsplugin.h)

SET(PLUGINS_FILES
    ${PLUGIN}.qml
    ${PLUGIN}.svg
    ${PLUGIN}.js
    CreateAccountSheet.qml)

add_definitions(-DQT_PLUGIN)
add_library(${PLUGIN} MODULE ${SRC} ${HEADERS})
target_include_directories(${PLUGIN} PUBLIC "/usr/include/glacier-settings/")

target_link_libraries(${PLUGIN}
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    -lglaciersettings)

install(TARGETS ${PLUGIN}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/glacier-settings/)

INSTALL(FILES ${PLUGINS_FILES}
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/${PLUGIN}/)

# Translations
file(GLOB TS_FILES translations/*.ts)
#set_source_files_properties(${TS_FILES} PROPERTIES OUTPUT_LOCATION ${CMAKE_INSTALL_LOCALEDIR})
qt6_add_translation(QM_FILES ${TS_FILES})
add_custom_target(accounts_translations DEPENDS ${QM_FILES})
add_dependencies(accounts accounts_translations)

install(FILES ${QM_FILES}
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/translations)
