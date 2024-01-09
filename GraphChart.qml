import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls

Window {
    id: _window
    visible: true
    property StackView pageStack: StackView.view

    ChartView {
        title: "Напряженность психологической защиты"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        HorizontalBarSeries {
            axisY: BarCategoryAxis {
                categories: ["Вытеснение",
                    "Регрессия",
                    "Замещение",
                    "Отрицание",
                    "Проекция",
                    "Компенсация",
                    "Гиперкомпенсация",
                    "Рационализация"] }
            BarSet { label: "Name"; values: [LifeStyle.repressionTension(),
                    LifeStyle.regressusTension(),
                    LifeStyle.substitutionTension(),
                    LifeStyle.denialTension(),
                    LifeStyle.projectioTension(),
                    LifeStyle.compensationTension(),
                    LifeStyle.hyperCompensationTension(),
                    LifeStyle.rationalisTension(),
                ] }
        }
    }
}
