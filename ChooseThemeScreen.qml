import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: _window

    property int blockCount: 5
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property StackView pageStack: StackView.view

//    ListModel {
//        id: _themeModel
//        ListElement {
//            themeName: "Life Style Index"
//            themeImage: "Images/test1_picture.jpg"
//        }
//        ListElement {
//            themeName: "Test Ayzenk"
//            themeImage: "Images/test2_picture.jpg"
//        }
//        ListElement {
//            themeName: "Optimist Pessimist"
//            themeImage: "Images/test3_picture.jpg"
//        }
//        ListElement {
//            themeName: "Тема 4"
//            themeImage: "Images/test4_picture.jpg"
//        }
//    }

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
                Layout.topMargin: _window.height * 0.05
                padding: _window.width * 0.05
                topPadding: 0
                text: "Which test do you want to take first?"
                wrapMode: Text.Wrap
                font.pixelSize: _window.width * 0.06
                font.weight: 800
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

                Rectangle {
                    id: _LSIItem
                    Layout.fillWidth: true
                    width: _mainLayout.width / 2
                    height: _mainLayout.height / 4
                    radius: _mainLayout.width * 0.05
                    color: "lightblue"

                    Image {
                        id: _LSIImg
                        source: "Images/test1_picture.jpg"
                        anchors.fill: parent
                        asynchronous: true

                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded
                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: _LSIImg.width
                                height: _LSIImg.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: _LSIImg.adapt ? _LSIImg.width : Math.min(
                                                           _LSIImg.width,
                                                           _LSIImg.height)
                                    height: _LSIImg.adapt ? _LSIImg.height : width
                                    radius: _LSIItem.radius
                                }
                            }
                        }
                    }

                    Text {
                        id: _LSIText
                        text: "Life Style Index"
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
                            pageStack.push(Qt.resolvedUrl(
                                               "qrc:/DescriptionOfTest.qml"), {
                                               "pageStack": pageStack
                                           })
                        }
                    }
                }

                /////////////////////////////////////////////////////////////////////
                Rectangle {
                    id: _AyzenkItem
                    Layout.fillWidth: true
                    width: _mainLayout.width / 2
                    height: _mainLayout.height / 4
                    radius: _mainLayout.width * 0.05
                    color: "lightblue"

                    Image {
                        id: _AyzenkImg
                        source: "Images/test2_picture.jpg"
                        anchors.fill: parent
                        asynchronous: true

                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded
                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: _AyzenkImg.width
                                height: _AyzenkImg.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: _AyzenkImg.adapt ? _AyzenkImg.width : Math.min(
                                                           _AyzenkImg.width,
                                                           _AyzenkImg.height)
                                    height: _AyzenkImg.adapt ? _AyzenkImg.height : width
                                    radius: _AyzenkItem.radius
                                }
                            }
                        }
                    }

                    Text {
                        id: _AyzenkText
                        text: "Test Ayzenk"
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
                            pageStack.push(Qt.resolvedUrl(
                                               "qrc:/qml/Ayzenk/AyzenkTest.qml"), {
                                               "pageStack": pageStack
                                           })
                        }
                    }
                }
                ////////////////////////////////////////////////////////////////////
                Rectangle {
                    id: _OptItem
                    Layout.fillWidth: true
                    width: _mainLayout.width / 2
                    height: _mainLayout.height / 4
                    radius: _mainLayout.width * 0.05
                    color: "lightblue"

                    Image {
                        id: _OptImg
                        source: "Images/test3_picture.jpg"
                        anchors.fill: parent
                        asynchronous: true

                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded
                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: _OptImg.width
                                height: _OptImg.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: _OptImg.adapt ? _OptImg.width : Math.min(
                                                           _OptImg.width,
                                                           _OptImg.height)
                                    height: _OptImg.adapt ? _OptImg.height : width
                                    radius: _OptItem.radius
                                }
                            }
                        }
                    }

                    Text {
                        id: _OptText
                        text: "Optimist Pessimist"
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
                            pageStack.push(Qt.resolvedUrl(
                                               "qrc:/qml/Opt/OptPesRealTest.qml"), {
                                               "pageStack": pageStack
                                           })
                        }
                    }
                }
                ////////////////////////////////////////////////////////////////////
            }
        }
    }
}
