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

    focus: true
    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.pop()
                            event.accepted = true
                        }
                    }

    BackCustomBtn {
        id: _backBtn
        accentColor: "#ebebeb"
        secondaryColor: "#d4d4d4"
        btnTextColor: "gray"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.width * 0.1
        anchors.rightMargin: parent.width * 0.06

        onClicked: {
            pageStack.pop()
            LifeStyle.resetTest()
        }
    }

    ColumnLayout {
        id: _mainLayout
        Layout.fillWidth: true
        width: parent.width
        y: _backBtn.height + (parent.height * 0.2)
        height: parent.height * 0.4

        anchors {
            left: parent.left
            right: parent.right
            leftMargin: parent.width * 0.06
            rightMargin: parent.width * 0.06
        }

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
        }

        ColumnLayout {
            id: _buttonsYENO
            Layout.alignment: Qt.AlignBottom

            Button {
                id: _buttonYes
                text: "Yes"
                width: parent.width
                height: parent.width * 0.1
                padding: parent.width * 0.2

                onClicked: {
                    if (!_buttonNo.visible)
                        _buttonNo.visible = true
                    _qText.text = LifeStyle.getQuestion()
                    LifeStyle.setAnswer(1)
                }
                Layout.fillWidth: true
            }

            Button {
                id: _buttonNo
                text: "No"
                visible: false
                width: parent.width
                height: parent.width * 0.1
                padding: parent.width * 0.2

                onClicked: {
                    _qText.text = LifeStyle.getQuestion()
                    LifeStyle.setAnswer(0)
                }
                Layout.fillWidth: true
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
}
