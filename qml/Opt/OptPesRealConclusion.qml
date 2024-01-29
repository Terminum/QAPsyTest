import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "../../"

Item {
    id: _window

    property StackView pageStack: StackView.view

    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent

        GoHomeBtn {
            id: _goHomeBtn
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.topMargin: parent.width * 0.08
            Layout.rightMargin: parent.width * 0.05
        }
    }

    Text {
        id: _testConclusionText
        text: Optimist.testResult()
    }

    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.pop()
                            event.accepted = true
                        }
                    }
}

