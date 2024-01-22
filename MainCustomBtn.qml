import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    property string btnText: "DefaultText"
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property color textColor: "#ffffff"

    text: qsTr(btnText)
    Layout.fillWidth: true

    contentItem: Text {
        text: parent.text
        color: textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: parent.height * 0.08
        font.pixelSize: parent.width * 0.05
        font.bold: true
    }

    background: Rectangle {
        id: _idBtnRect
        radius: parent.width / 2
        color: accentColor
    }

    onPressed: {
        _idBtnRect.color = secondaryColor
    }

    onReleased: {
        _idBtnRect.color = accentColor
    }
}
