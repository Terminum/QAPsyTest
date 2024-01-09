import QtQuick 2.15
import QtCharts 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: _window
    visible: true

    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"

    ChartView {
        id: _chart
        width: _window.width
        height: _window.height
        title: "Общая напряженность всех защит (ОНЗ)"
        titleColor: secondaryColor
        titleFont: Qt.font({
                               "bold": true
                           })
        legend.alignment: Qt.AlignBottom
        legend.visible: false
        antialiasing: true
        margins.top: parent.width * 0.2

        animationOptions: {
            animationDuration: 2
            animationEasingCurve: ChartView.GridAxisAnimations
        }

        PieSeries {
            id: _pieSeries

            PieSlice {
                id: _firstSlice
                labelVisible: true
                label: (LifeStyle.overallTension() * 100).toFixed(2) + "%"
                value: LifeStyle.overallTension()

                labelPosition: PieSlice.LabelInsideHorizontal
                labelColor: "white"
            }

            PieSlice {
                id: _secondSlice
                labelVisible: false
                value: 1 - LifeStyle.overallTension()
            }
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

    // ChartView {
    //     title: "Напряженность психологической защиты"
    //     anchors.fill: parent
    //     legend.alignment: Qt.AlignBottom
    //     antialiasing: true

    //     HorizontalBarSeries {
    //         axisY: BarCategoryAxis {
    //             categories: ["Вытеснение", "Регрессия", "Замещение", "Отрицание", "Проекция", "Компенсация", "Гиперкомпенсация", "Рационализация"]
    //         }
    //         BarSet {
    //             label: "Name"
    //             values: [2, // LifeStyle.repressionTension()
    //                 2, // LifeStyle.regressusTension()
    //                 3, // LifeStyle.substitutionTension()
    //                 4, // LifeStyle.denialTension()
    //                 5, // LifeStyle.projectioTension()
    //                 6, // LifeStyle.compensationTension()
    //                 7, // LifeStyle.hyperCompensationTension()
    //                 8// LifeStyle.rationalisTension()
    //             ]
    //         }
    //     }
    // }
}
