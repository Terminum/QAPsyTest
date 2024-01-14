import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls

Item {
    id: _window
    visible: true
    property StackView pageStack: StackView.view

    ChartView {
        title: "Напряженность психологической защиты"
        anchors.fill: parent
        legend.visible: false
        antialiasing: true
        animationOptions: ChartView.SeriesAnimations

        HorizontalBarSeries {
            axisY: BarCategoryAxis {
                id: _barCategoryAxis
                categories: ["Вытеснение", "Регрессия", "Замещение", "Отрицание", "Проекция", "Компенсация", "Гиперкомпенсация", "Рационализация"]

            }
            axisX: ValuesAxis {
                min: 0
                max: 1
            }

            BarSet {

                values: [LifeStyle.repressionTension(),
                        LifeStyle.regressusTension(),
                        LifeStyle.substitutionTension(),
                        LifeStyle.denialTension(),
                        LifeStyle.projectioTension(),
                        LifeStyle.compensationTension(),
                        LifeStyle.hyperCompensationTension(),
                        LifeStyle.rationalisTension()]
                onClicked: {
                   console.log(_barCategoryAxis.categories[index])
                }
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
