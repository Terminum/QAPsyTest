import QtQuick 2.15
import QtCharts 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: _window
    visible: true

    ChartView { // отображение величин
        id: chart
        width: _window.width
        height: 200
        title: "Общая напряженность всех защит (ОНЗ)"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        PieSeries {
            id: pieSeries
            PieSlice { label: "ОНЗ"; value: LifeStyle.overallTension() }
            PieSlice { value: 1 - LifeStyle.overallTension()}
        }

    }

//    ChartView {
//        title: "Напряженность психологической защиты"
//        anchors.fill: parent
//        legend.alignment: Qt.AlignBottom
//        antialiasing: true

//        HorizontalBarSeries {
//            axisY: BarCategoryAxis {
//                categories: ["Вытеснение",
//                    "Регрессия",
//                    "Замещение",
//                    "Отрицание",
//                    "Проекция",
//                    "Компенсация",
//                    "Гиперкомпенсация",
//                    "Рационализация"] }
//            BarSet { label: "Name"; values: [2, // LifeStyle.repressionTension()
//                    2, // LifeStyle.regressusTension()
//                    3, // LifeStyle.substitutionTension()
//                    4, // LifeStyle.denialTension()
//                    5, // LifeStyle.projectioTension()
//                    6, // LifeStyle.compensationTension()
//                    7, // LifeStyle.hyperCompensationTension()
//                    8, // LifeStyle.rationalisTension()
//                ] }
//        }
//    }
}
