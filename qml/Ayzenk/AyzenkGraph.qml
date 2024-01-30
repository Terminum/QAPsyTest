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

        ChartView {
            id: _secondChart
//            title: "Напряженность психологической защиты"
            anchors.top: _goHomeBtn.bottom
//            margins.top: 20
            width: parent.width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignBottom
            legend.visible: false
            antialiasing: true


            ValueAxis {
                id: _x
                min: 0
                max: 24
            }

            ValueAxis {
                id: _y
                min: 0
                max: 24
            }



            ScatterSeries {
                    id: _borders
                    name: "User Score"
                    XYPoint { x: 1; y: 12; /*Label{text: "introversion"}*/}
                    XYPoint { x: 24; y: 12 }
                    XYPoint { x: 12; y: 24 }
                    XYPoint { x: 12; y: 1 }
            }
            ScatterSeries {
                id: _userScore
                name: "Emotional Stability"
                XYPoint { x: Ayzenk.extIntroversia(); y: Ayzenk.neyrotizm() }
            }
        }
    }

    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.pop()
                            event.accepted = true
                        }
                    }
}
