install(FILES google.provider
    DESTINATION /usr/share/accounts/providers)

#install(FILES google.png
#    DESTINATION /usr/share/themes/glacier/meegotouch/icons)

install(FILES google-calendars.service
              google-contacts.service
              google-gmail.service
              google-sync.service
    DESTINATION /usr/share/accounts/services)

install(DIRECTORY qml/
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/accounts/providers/google)

add_subdirectory(src)
