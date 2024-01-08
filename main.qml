import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    color: "blue"
    title: qsTr("Hello World")

    Text {
        id: _qText
        anchors.centerIn: parent
        text: qsTr("Внимательно прочитайте приведенные ниже утверждения, описывающие чувства,
                поведение и реакции людей в определенных жизненных ситуациях, и если они
                имеют к Вам отношение, то ответьте утвердительно.")
        //Внимательно прочитайте приведенные ниже утверждения, описывающие чувства,
        //поведение и реакции людей в определенных жизненных ситуациях, и если они
        //имеют к Вам отношение, то ответьте утвердительно.
    }

    Button {
        id: _buttonYes
        text: "Yes"
        anchors.top: _qText.bottom

        onClicked: {
            if (!_buttonNo.visible)
                _buttonNo.visible = true
            _qText.text = LifeStyle.getQuestion()
            LifeStyle.setAnswer(1);
        }
    }

    Button {
        id: _buttonNo
        visible: false
        text: "No"
        anchors.top: _buttonYes.bottom

        onClicked: {
            _qText.text = LifeStyle.getQuestion()
            LifeStyle.setAnswer(0);
        }
    }

    Connections {
        target: LifeStyle

        function onTestEnd() {
            console.log("Test End")
            // do something on test ended
        }
    }

}
