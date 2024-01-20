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
        height: parent.height - y * 2
        y: _goHomeBtn.y + parent.height * 0.04
        title: "Общая напряженность всех защит (ОНЗ)"
        titleColor: secondaryColor
        titleFont.bold: true
        titleFont.pixelSize: parent.width * 0.04
        legend.visible: false
        antialiasing: true
        margins.top: parent.width * 0.2

        PieSeries {
            id: _pieSeries

            PieSlice {
                id: _firstSlice
                labelVisible: true
                label: (LifeStyle.overallTension() * 100).toFixed(2) + "%"
                NumberAnimation on value {
                    duration: 500
                    from: 0
                    to: LifeStyle.overallTension()
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
        height: parent.height
        width: _chart.width

        GoHomeBtn {
            id: _goHomeBtn
            Layout.alignment: Qt.AlignHCenter | Qt.AlignRight | Qt.AlignTop
            Layout.topMargin: _chart.width * 0.1
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.08

            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:/ChooseThemeScreen.qml"),
                               StackView.PopTransition)
            }
        }

        MainCustomBtn {
            text: "К следующему графику"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            Layout.bottomMargin: _chart.height * 0.05
            Layout.rightMargin: parent.width * 0.1
            Layout.leftMargin: parent.width * 0.1

            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:/GraphChart.qml"), {
                                   "pageStack": pageStack
                               })
            }
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
