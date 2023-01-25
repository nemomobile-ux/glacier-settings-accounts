/*
 * Copyright (C) 2022-2023 Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
 *
 * You may use this file under the terms of the BSD license as follows:
 *
 * "Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Nemo Mobile nor the names of its contributors
 *     may be used to endorse or promote products derived from this
 *     software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
 */

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0

import org.nemomobile.googleauth 1.0
import org.nemomobile.accounts 1.0
import org.nemomobile.social 1.0

Page {
    id: googleAccountPage

    property AccountModel accountModel
    property Provider provider
    property int accountId: 0
    property string _existingUserName
    property bool hasSetName

    property Account newAccount: Account{
        identifier: googleAccountPage.accountId
        onStatusChanged: {
            if (status == Account.Initialized ) {
                console.log("Init or synced")
            } else if (status == Account.Invalide) {
                console.log("Accoout is invalid!!!")
            } else if (status == Account.Synced) {
                console.log("Accoout is synced")
            } else if (status == Account.Error) {
                console.log("Google provider account error:", errorMessage)
            }
        }
    }

    property SocialNetwork newSocialNetwork: SocialNetwork{
        onArbitraryRequestResponseReceived: {
            var userEmail = data["email"]
            if (userEmail == undefined || userEmail == "") {
                console.log("email is empty")
            } else {
                newAccount.displayName = userEmail
                newAccount.setConfigurationValue("", "default_credentials_username", userEmail)
                newAccount.setConfigurationValue("google-gmail", "emailaddress", userEmail)
                newAccount.setConfigurationValue("google-gmail", "imap4/username", userEmail)
                newAccount.setConfigurationValue("google-gmail", "smtp/smtpusername", userEmail)
                newAccount.sync()
                console.log("Make sync")
            }
        }
    }

    headerTools: HeaderToolsLayout {
        title: qsTr("Google")
        showBackButton: true
    }

    GoogleAuth{
        id: gAuth

        Component.onCompleted: {
            if(gAuth.needAuth) {
                mainLoader.setSource(Qt.resolvedUrl("AccountSetup.qml"))
            }
        }

        onAuthFinish: {
            var queryItems = {"access_token": token}
            newSocialNetwork.arbitraryRequest(SocialNetwork.Get, "https://www.googleapis.com/oauth2/v2/userinfo", queryItems)
        }
    }

    Loader{
        id: mainLoader
        anchors.fill: parent

        asynchronous: true
        visible: status == Loader.Ready
    }
}
