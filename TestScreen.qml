import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: _window

    property StackView pageStack: StackView.view

    Rectangle {
        anchors.fill: parent
        color: "blue"
    }

    ColumnLayout {
        id: _mainLayout
        Layout.fillWidth: true
        Layout.fillHeight: true
        width: parent.width
        height: parent.height
        Layout.alignment: Qt.AlignVCenter
        anchors.fill: parent

        anchors.left: parent.left
        anchors.right: parent.right

        anchors.leftMargin: parent.width * 0.06
        anchors.rightMargin: parent.width * 0.06

        Text {
            id: _qText
            anchors.centerIn: parent
            text: qsTr("Внимательно прочитайте приведенные ниже утверждения, описывающие чувства,
        поведение и реакции людей в определенных жизненных ситуациях, и если они
        имеют к Вам отношение, то ответьте утердительно.")
            color: "white"
            wrapMode: Text.WordWrap
            Layout.preferredWidth: parent.width
            font.pixelSize: _window.width * 0.05
            Layout.fillWidth: true
        }

        Button {
            id: _buttonYes
            text: "Yes"
            anchors.top: _qText.bottom
            width: parent.width
            padding: parent.width * 0.2

            onClicked: {
                if(!_buttonNo.visible)
                    _buttonNo.visible = true
                _qText.text = LifeStyle.getQuestion()
                LifeStyle.setAnswer(1)
            }
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
        }

        Button {
            id: _buttonNo
            text: "No"
            visible: false
            anchors.top: _buttonYes.bottom
            width: parent.width
            padding: parent.width * 0.2

            onClicked: {
                _qText.text = LifeStyle.getQuestion()
                LifeStyle.setAnswer(0)
            }

            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
        }
    }
    Connections {
            target: LifeStyle

            function onTestEnd() {
                console.log("Test End")
                // do something on test ended
                pageStack.push(Qt.resolvedUrl("qrc:/LifeStyleCharts.qml"))
            }
        }
}
