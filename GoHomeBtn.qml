import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"

    contentItem: Image {
        id: _idBtnImage
        source: "Images/homeIcon.svg"
        sourceSize.width: parent.width * 0.7
        sourceSize.height: parent.width * 0.45
        anchors.centerIn: _idBtnRect
    }

    background: Rectangle {
        id: _idBtnRect
        radius: parent.width * 0.5
        color: accentColor
    }

    onPressed: {
        _idBtnRect.color = secondaryColor
    }

    onReleased: {
        _idBtnRect.color = accentColor
    }
}
