#install(FILES email.provider
#    DESTINATION /usr/share/accounts/providers)

#install(FILES icon-s-common-email.png
#    DESTINATION /usr/share/themes/glacier/meegotouch/icons)

install(DIRECTORY qml/
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/accounts/providers/email)
