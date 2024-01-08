import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls

Item {
    id: _window
    visible: true
    property StackView pageStack: StackView.view

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

    Button {
        text: "Tuta"

        onClicked: {
            pageStack.push(Qt.resolvedUrl("qrc:/GraphChart.qml"), {
                               "pageStack": pageStack
                           })
        }
    }
}
