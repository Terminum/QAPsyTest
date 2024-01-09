import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    property string btnText: "<"
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property color btnTextColor: "white"

    id: idBtn
    text: qsTr(btnText)

    width: parent.width * 0.15
    height: parent.width * 0.15

    contentItem: Text {
        id: idBtnText
        text: idBtn.text
        color: btnTextColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: parent.width * 0.45
    }

    background: Rectangle {
        id: idBtnRect
        radius: parent.width * 0.5
        color: accentColor
    }

    onPressed: {
        idBtnRect.color = secondaryColor
    }

    onReleased: {
        idBtnRect.color = accentColor
    }
}
