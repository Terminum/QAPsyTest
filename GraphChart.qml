import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _window
    visible: true
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
            title: "Напряженность психологической защиты"
            width: parent.width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignBottom
            legend.visible: false
            antialiasing: true
            animationOptions: ChartView.SeriesAnimations

            HorizontalBarSeries {
                axisY: BarCategoryAxis {
                    categories: ["Вытеснение", "Регрессия", "Замещение", "Отрицание", "Проекция", "Компенсация", "Гиперкомпенсация", "Рационализация"]
                }
                BarSet {
                    values: [LifeStyle.repressionTension(
                            ), LifeStyle.regressusTension(
                            ), LifeStyle.substitutionTension(
                            ), LifeStyle.denialTension(
                            ), LifeStyle.projectioTension(
                            ), LifeStyle.compensationTension(
                            ), LifeStyle.hyperCompensationTension(
                            ), LifeStyle.rationalisTension()]
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
