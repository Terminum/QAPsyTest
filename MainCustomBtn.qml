import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    property var idBtn
    property var idBtnText
    property var idBtnRect
    property string btnText: "DefaultText"
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"

    id: idBtn
    text: qsTr(btnText)
    Layout.rightMargin: parent.width * 0.05
    Layout.leftMargin: parent.width * 0.05
    Layout.fillWidth: true

    contentItem: Text {
        id: idBtnText
        text: idBtn.text
        color: "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: idBtn.height * 0.08
        font.pixelSize: 16
        font.bold: true
    }

    background: Rectangle {
        id: idBtnRect
        radius: 100
        color: accentColor
    }

    onPressed: {
        idBtnRect.color = secondaryColor
    }

    onReleased: {
        idBtnRect.color = accentColor
    }
}
