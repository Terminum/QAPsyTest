import QtQuick
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
        text: qsTr("text")
    }

    Button {
        id: _buttonYes
        text: "Yes"
        anchors.top: _qText.bottom

        onClicked: {
            _qText.text = LifeStyle.getQuestion()
            LifeStyle.setAnswer(1);
        }
    }

    Button {
        id: _buttonNo
        text: "No"
        anchors.top: _buttonYes.bottom

        onClicked: {
            _qText.text = LifeStyle.getQuestion()
            LifeStyle.setAnswer(0);
        }
    }
}
