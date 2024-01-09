import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _window
    visible: true
    property StackView pageStack: StackView.view
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"

    ChartView {
        id: _chart
        width: parent.width
        height: parent.height
//        title: "Общая напряженность всех защит (ОНЗ)"
        legend.alignment: Qt.AlignBottom
        legend.visible: false
        antialiasing: true
        margins.top: parent.width * 0.2
        animationOptions: ChartView.GridAxisAnimations
        animationDuration: 3

        PieSeries {
            id: _pieSeries

            PieSlice {
                id: _firstSlice
                labelVisible: true
                label: (LifeStyle.overallTension() * 100).toFixed(2) + "%"
                NumberAnimation on value {
                    duration: 500
                    from: 0
                    to:LifeStyle.overallTension()
                }

                labelPosition: PieSlice.LabelInsideHorizontal
                labelColor: "white"
                exploded: true
                explodeDistanceFactor: 0.05
            }

            PieSlice {
                id: _secondSlice
                labelVisible: false
                value: 1 - LifeStyle.overallTension()
            }
        }
    }

    ColumnLayout {
        id: _headerLayout
        Layout.fillWidth: true
        width: _chart.width

        BackCustomBtn {
            id: _backBtn
            Layout.alignment: Qt.AlignHCenter | Qt.AlignRight
            Layout.topMargin: _chart.width * 0.2
            Layout.bottomMargin: parent.height * 0.2
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.08

            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:/ChooseThemeScreen.qml"))
            }
        }

        Text {
            id: _headerLayoutTitle
            text: "Общая напряженность всех защит (ОНЗ)"
            font.pixelSize: _chart.width * 0.04
            font.bold: true
            color: secondaryColor
            Layout.alignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }


    Button {
        text: "Tuta"

        onClicked: {
            pageStack.push(Qt.resolvedUrl("qrc:/GraphChart.qml"), {
                               "pageStack": pageStack
                           })
        }
    }

    RowLayout {
        id: _legendLayout
        Layout.fillWidth: true

        anchors {
            horizontalCenter: _chart.horizontalCenter
            bottom: _chart.bottom
            bottomMargin: _chart.height * 0.1
        }

        Rectangle {
            id: _legendMarker
            width: _legendTitle.width * 0.4
            height: _legendTitle.height * 0.6
            color: _firstSlice.color
        }

        Text {
            id: _legendTitle
            text: "ОНЗ"
        }
    }

    focus: true
    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.push(Qt.resolvedUrl(
                                               "qrc:/ChooseThemeScreen.qml"))
                            event.accepted = true
                        }
                    }
}
