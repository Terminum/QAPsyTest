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

                    switch (index) {
                    case 0:
                        _dialog.title = "Вытеснение"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 1:
                        _dialog.title = "Регрессия"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 2:
                        _dialog.title = "Замещение"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 3:
                        _dialog.title = "Отрицание"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 4:
                        _dialog.title = "Проекция"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 5:
                        _dialog.title = "Компенсация"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 6:
                        _dialog.title = "Гиперкомпенсация"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    case 7:
                        _dialog.title = "Рационализация"
                        _textArea.text = LifeStyle.getDescription(index)
//                        _textArea.text = :/LSIIndexSrc/Vitesnenie.txt
                        break
                    default:
                        _dialog.title = "Error"

                    }

                   _dialog.visible = true
                }
            }
        }
    }

    Dialog {
        id: _dialog
        anchors.centerIn: _window
        width: _window.width - (_window.width / 10)
        height: _window.height - (_window.height / 10)
        title: "Title"
        modal: true
        visible: false
        standardButtons: Dialog.Ok
//        onAccepted: console.log("Ok clicked")
        onAccepted: visible = false

//        contentItem: {
        ScrollView {
            anchors.fill: parent
            contentWidth: -1
            TextArea {
                id: _textArea
                anchors.fill: parent
//                contentWidth: parent.width
                readOnly: true
                wrapMode: TextEdit.WordWrap
            }
        }
//        }
    }

    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Back) {
                            pageStack.pop()
                            event.accepted = true
                        }
                    }
}
