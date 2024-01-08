import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: 450
    height: 800
    visible: true
    color: "white"

    StackView {
        id: _pageStack
        initialItem: _loader
        anchors.fill: parent

        Loader {
            id: _loader
            source: "qrc:/FirstScreen.qml"
            onLoaded: {
                item.pageStack = _pageStack
            }
        }
    }
}
