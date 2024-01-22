import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _window

    property StackView pageStack: StackView.view

    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent\

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
                id: _barCategoryAxis
                categories: ["Вытеснение", "Регрессия", "Замещение", "Отрицание", "Проекция", "Компенсация", "Гиперкомпенсация", "Рационализация"]
            }
            axisX: ValuesAxis {
                min: 0
                max: 1
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
                onClicked: {
                    console.log(_barCategoryAxis.categories[index])

                    switch (index) {
                    case 0:
                        _dialog.title = "Вытеснение"
                        break
                    case 1:
                        _dialog.title = "Регрессия"
                        break
                    case 2:
                        _dialog.title = "Замещение"
                        break
                    case 3:
                        _dialog.title = "Отрицание"
                        break
                    case 4:
                        _dialog.title = "Проекция"
                        break
                    case 5:
                        _dialog.title = "Компенсация"
                        break
                    case 6:
                        _dialog.title = "Гиперкомпенсация"
                        break
                    case 7:
                        _dialog.title = "Рационализация"
                        break
                    default:
                        _dialog.title = "Error"
                    }
                    _textArea.text = LifeStyle.getDescription(index)
                    _dialog.visible = true
                }
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
        onAccepted: visible = false

        Flickable {
            id: _scrollWrapper
            anchors.fill: parent

            clip: true
            boundsMovement: Flickable.StopAtBounds
            boundsBehavior: Flickable.DragAndOvershootBounds

            contentHeight: _textArea.paintedHeight
            contentWidth: parent.width

            ScrollBar.vertical: ScrollBar {
                anchors.right: parent.right
                policy: ScrollBar.AlwaysOff
            }

            TextArea {
                id: _textArea
                anchors.fill: parent
                readOnly: true
                wrapMode: TextEdit.WordWrap
                
        GoHomeBtn {
            id: _goHomeBtn
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.topMargin: parent.width * 0.08
            Layout.rightMargin: parent.width * 0.05
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
