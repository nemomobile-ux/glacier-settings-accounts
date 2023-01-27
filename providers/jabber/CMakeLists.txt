install(FILES jabber.provider
    DESTINATION /usr/share/accounts/providers)

install(FILES jabber.service
    DESTINATION /usr/share/accounts/services)

install(FILES icon-s-common-jabber.png
    DESTINATION /usr/share/themes/glacier/meegotouch/icons)

install(DIRECTORY qml/
    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-settings/plugins/accounts/providers/jabber)
