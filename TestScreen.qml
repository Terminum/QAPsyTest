import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _window

    property StackView pageStack: StackView.view

    Image {
        id: _bgImg
        anchors.fill: parent

        source: "Images/testBg_picture.jpg"
        asynchronous: true
        cache: true

        visible: _bgImg.status === Image.Ready
        opacity: _bgImg.status === Image.Ready ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
    }

    ColumnLayout {
        id: _mainLayout
        width: parent.width
        height: parent.height

        anchors {
            left: parent.left
            right: parent.right
            leftMargin: parent.width * 0.06
            rightMargin: parent.width * 0.06
        }

        GoHomeBtn {
            id: _goHomeBtn
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.topMargin: parent.width * 0.1
        }

        ColumnLayout {
            id: _contentLayout
            width: parent.width
            Layout.alignment: Qt.AlignBottom
            Layout.topMargin: parent.height * 0.15

            Text {
                id: _qText
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Внимательно прочитайте приведенные ниже утверждения,
описывающие чувства, поведение и реакции людей в определенных жизненных ситуациях,
и если они имеют к Вам отношение, то ответьте утердительно.")
                color: "white"
                wrapMode: Text.WordWrap
                Layout.preferredWidth: parent.width
                font.pixelSize: parent.width * 0.05
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            ColumnLayout {
                id: _buttonsYENO
                Layout.alignment: Qt.AlignBottom
                Layout.bottomMargin: parent.width * 0.1

                MainCustomBtn {
                    id: _buttonYes
                    btnText: "Да"

                    Layout.rightMargin: 0
                    Layout.leftMargin: 0
                    accentColor: "#dbdbdb"
                    secondaryColor: "#e6e6e6"
                    textColor: "#03524D"

                    onClicked: {
                        if (!_buttonNo.visible) {
                            _buttonNo.visible = true
                            LifeStyle.resetTest()
                        }
                        _qText.text = LifeStyle.getQuestion()
                        LifeStyle.setAnswer(1)
                    }
                }

                MainCustomBtn {
                    id: _buttonNo

                    btnText: "Нет"
                    Layout.rightMargin: 0
                    Layout.leftMargin: 0
                    accentColor: "#dbdbdb"
                    secondaryColor: "#e6e6e6"
                    textColor: "#03524D"

                    visible: false

                    onClicked: {
                        _qText.text = LifeStyle.getQuestion()
                        LifeStyle.setAnswer(0)
                    }
                }
            }
        }
    }

    Connections {
        target: LifeStyle

        function onTestEnd() {
            console.log("Test End")
            pageStack.push(Qt.resolvedUrl("qrc:/LifeStyleCharts.qml"), {
                               "pageStack": pageStack
                           })
        }
    }

    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.pop()
                            event.accepted = true
                        }
                    }
}
