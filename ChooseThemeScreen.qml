import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Item {
    id: _window

    property int blockCount: 5
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property bool itemIschecked: false

    ListModel {
        id: _themeModel
        ListElement {
            themeName: "Тема 1"
            themeImage: "source"
        }
        ListElement {
            themeName: "Тема 2"
            themeImage: "source"
        }
        ListElement {
            themeName: "Тема 3"
            themeImage: "source"
        }
        ListElement {
            themeName: "Тема 4"
            themeImage: "source"
        }
        ListElement {
            themeName: "Тема 5"
            themeImage: "source"
        }
    }

    Rectangle {
        id: _background
        anchors.fill: _window
        color: "#f6f6f6"
    }

    Flickable {
        id: tableArea
        anchors.fill: parent
        clip: true

        boundsMovement: Flickable.StopAtBounds
        boundsBehavior: Flickable.DragAndOvershootBounds
        contentWidth: _mainLayout.width
        contentHeight: _mainLayout.height

        ScrollBar.vertical: ScrollBar {
            anchors.right: parent.right
            policy: ScrollBar.AlwaysOff
        }

        ColumnLayout {
            id: _mainLayout
            width: _window.width
            implicitHeight: _window.height
            Layout.fillWidth: true

            Text {
                id: _title
                Layout.preferredWidth: _window.width
                Layout.alignment: Qt.AlignTop
                padding: _window.width * 0.05
                text: "Which test do you want to take first?"
                wrapMode: Text.Wrap
                font.pixelSize: _window.width * 0.06
                font.weight: 800
                Layout.topMargin: _window.height * 0.02
            }

            GridLayout {
                id: _grid
                columns: 2
                anchors.top: _title.bottom
                Layout.rightMargin: _window.width * 0.05
                Layout.leftMargin: _window.width * 0.05
                columnSpacing: _window.width * 0.02
                rowSpacing: _window.width * 0.05
                Layout.bottomMargin: parent.height * 0.02

                Repeater {
                    id: _repeater
                    model: _themeModel

                    PaddedRectangle {
                        id: _themeModelItem
                        Layout.fillWidth: true
                        width: _mainLayout.width / 2
                        height: _mainLayout.height / 4.5
                        radius: _mainLayout.width * 0.06
                        color: "lightblue"
                        padding: parent.width * 0.015

                        property bool checked: false

                        PaddedRectangle {
                            id: _themeModelItemBorder
                            visible: checked ? true : false
                            anchors.fill: parent
                            border.width: 3
                            border.color: secondaryColor
                            color: "transparent"
                            radius: parent.radius
                        }

                        Image {
                            source: model.themeImage
                            anchors.centerIn: parent
                        }

                        Text {
                            id: _themeModelItemText
                            text: model.themeName
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                bottom: parent.bottom
                                bottomMargin: parent.height * 0.1
                            }
                            font.pixelSize: parent.width * 0.1
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                //console.log("Вы выбрали тему:", model.themeName)
                                for (var i = 0; i < _repeater.count; i++) {
                                    _repeater.itemAt(i).checked = false
                                }
                                checked = true
                                setChecked()
                            }
                        }
                    }
                }
            }

            Button {
                id: _continueBtn
                text: qsTr("Get started")
                Layout.rightMargin: parent.width * 0.05
                Layout.leftMargin: parent.width * 0.05
                Layout.fillWidth: true
                Layout.bottomMargin: parent.height * 0.03
                Layout.alignment: Qt.AlignBottom

                contentItem: Text {
                    id: _continueBtnText
                    text: _continueBtn.text
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    padding: _continueBtn.height * 0.1
                    font.pixelSize: 16
                    font.bold: true
                }

                background: Rectangle {
                    id: _continueBtnRect
                    radius: 100
                    color: accentColor
                }

                onPressed: {
                    _continueBtnRect.color = secondaryColor
                }

                onReleased: {
                    _continueBtnRect.color = accentColor
                }

                onClicked: {
                    if (itemIschecked === false) {
                        _messageDialog.open()
                    } else if (itemIschecked) {
                        console.log("Yes")
                    }
                }
            }
        }
    }

    MessageDialog {
        id: _messageDialog
        text: "Please, choose the topic!"
        modality: Qt.ApplicationModal
        buttons: StandartButton.OK
        onButtonClicked: close()
    }

    function setChecked() {
        itemIschecked = true
    }
}
