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
        animationOptions: ChartView.GridAxisAnimations
        animationDuration: 3

        PieSeries {
            id: pieSeries
            PieSlice { label: "ОНЗ"; value: 0;
                NumberAnimation on value {
//                    target: object
//                    property: "name"
                    duration: 500
//                    easing.type: Easing.InOutQuad
                    from: 0
                    to:LifeStyle.overallTension()
                }}
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
