
function formatIcon(icon) {

    var icon_replace = {
        "image://theme/graphic-service-generic-mail": "image://theme/envelope",
        "icon-l-google" : "image://theme/at",
        "image://theme/graphic-service-google" : "image://theme/google"
    }

    for (const key in icon_replace) {
        if (icon === key) {
            return icon_replace[key];
        }
    }


    if (String(icon).startsWith("image://")) {
        return icon;
    }

    if (String(icon).startsWith("file://")) {
        return icon;
    }

    return "image://theme/"+icon

}
