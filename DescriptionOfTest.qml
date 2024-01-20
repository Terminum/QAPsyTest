import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: _window
    visible: true

    property StackView pageStack: StackView.view
    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property int mainPadding: parent.width * 0.05

    property string testTitle: "Индекс жизненного стиля (LSI)"
    property string testAuthors: "Р. Плутчик, Х. Келлерман, Х. Конте"
    property string testDescription: "Опросник Плутчика Келлермана Конте - Методика Индекс жизненного стиля (Life Style Index, LSI) был разработан Р.Плутчиком в соавторстве с Г.Келлерманом и Х.Р.Контом в 1979 году. Тест используется для диагностики различных механизмов психологической защиты.  Механизмы психологической защиты развиваются в детстве для сдерживания, регуляции определенной эмоции; все защиты в своей основе имеют механизм подавления, который первоначально возник для того, чтобы победить чувство страха. Предполагается, что существует восемь базисных защит, которые тесно связаны с восемью базисными эмоциями психоэволюционной теории. Существование защит позволяет  косвенно измерить уровни внутриличностного конфликта, т.е. дезадаптированные люди должны использовать защиты в большей степени, чем адаптированные личности. Защитные механизмы  стараются свести до минимального негативные, травмирующие личность переживания. Эти переживания в основном связанны с внутренними или внешними конфликтами, состояниями тревоги или дискомфорта. Механизмы защиты помогают нам сохранить стабильность своей самооценки, представлений о себе и о мира. Так же они могут выступать в роли буферов, стараясь не допустить очень близко к нашему сознанию слишком сильные разочарования и угрозы, которые приносит нам жизнь. В тех случаях, когда мы не можем справиться с тревогой или страхом, защитные механизмы искажают реальную действительность с целью сохранения нашего психологического здоровья и нас самих как личность."

    ColumnLayout {
        id: _mainLayout
        width: _window.width
        height: _window.height
        Layout.fillWidth: true

        BackCustomBtn {
            id: _goBackBtn

            Layout.alignment: Qt.AlignRight | Qt.AlignTop

            Layout.rightMargin: mainPadding
            Layout.topMargin: mainPadding

            onClicked: {
                pageStack.pop()
            }
        }

        Text {
            id: _titleOfTest
            width: parent.width
            color: accentColor
            text: testTitle
            wrapMode: Text.WordWrap
            font.bold: true
            font.pixelSize: parent.width * 0.07
            Layout.maximumWidth: parent.width
            padding: mainPadding
            bottomPadding: 0
            topPadding: 0
        }

        Text {
            id: _subtitleOfTest
            width: parent.width
            color: secondaryColor
            text: "Авторы: " + testAuthors
            wrapMode: Text.WordWrap
            font.bold: true
            font.italic: true
            font.pixelSize: parent.width * 0.045
            Layout.maximumWidth: parent.width
            padding: mainPadding
            bottomPadding: 0
            topPadding: 0
        }

        Flickable {
            id: _scrollWrapper
            width: parent.width
            height: parent.height / 2
            clip: true

            boundsMovement: Flickable.StopAtBounds
            boundsBehavior: Flickable.DragAndOvershootBounds
            contentWidth: parent.width
            contentHeight: _descriptionOfTest.height

            ScrollBar.vertical: ScrollBar {
                anchors.right: parent.right
                policy: ScrollBar.AsNeeded
                width: 5
            }

            Text {
                id: _descriptionOfTest
                color: secondaryColor
                width: parent.width
                text: testDescription
                wrapMode: Text.WordWrap
                font.pixelSize: parent.width * 0.045
                Layout.maximumWidth: parent.width
                padding: mainPadding
                topPadding: 0
                bottomPadding: 0
            }
        }

        PaddedRectangle {
            id: _splitLine
            width: parent.width
            radius: parent.height / 2
            color: "#f0f0f0"
            height: 2
            leftPadding: mainPadding
            rightPadding: mainPadding
        }

        MainCustomBtn {
            id: _goToTestBtn
            text: "Начать тест"
            Layout.alignment: Qt.AlignBottom
            Layout.rightMargin: mainPadding
            Layout.leftMargin: mainPadding
            Layout.bottomMargin: mainPadding

            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:/TestScreen.qml"), {
                                   "pageStack": pageStack
                               })
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
