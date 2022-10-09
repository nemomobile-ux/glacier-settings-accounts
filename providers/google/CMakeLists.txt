install(FILES google.provider
    DESTINATION /usr/share/accounts/providers)

#install(FILES google.png
#    DESTINATION /usr/share/themes/glacier/meegotouch/icons)

install(DIRECTORY qml/
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/accounts/providers/google)

add_subdirectory(src)
