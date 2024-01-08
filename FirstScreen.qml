import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _window

    property color accentColor: "#03524D"
    property color secondaryColor: "#1C6763"
    property StackView pageStack: StackView.view

    Image {
        id: _imgBg
        visible: false
        source: "Images/bgImg_firstScreen.jpg"
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            const dpi = _window.devicePixelRatio
            var ctx = canvas.getContext("2d").scale(dpi, dpi)
            ctx.antialiasing = true

            // Задаем текущие координаты
            var _currentX = 0
            var _currentY = 0

            // Размеры фигуры
            var _widthSize = parent.width
            var _heightSize = parent.height * 0.3

            // Начальная, конечная и опорные точки кривой
            var _startPointX = _currentX
            var _startPointY = parent.height * 0.35
            var _controlPoint_firstX = _widthSize / 2.6
            var _controlPoint_firstY = parent.height * 0.47
            var _controlPoint_secondX = _widthSize - (_widthSize / 2)
            var _controlPoint_secondY = _heightSize
            var _endPointX = _widthSize
            var _endPointY = _heightSize

            // Рисуем фигуру
            ctx.beginPath()
            // Начальная позиция
            ctx.moveTo(_currentX, _currentY)
            // Вниз
            ctx.lineTo(_startPointX, _startPointY)
            // Кривая Безье
            ctx.bezierCurveTo(_controlPoint_firstX, _controlPoint_firstY,
                              _controlPoint_secondX, _controlPoint_secondY,
                              _endPointX, _endPointY)
            // Вверх
            ctx.lineTo(_endPointX, -_endPointY)

            ctx.closePath()

            ctx.fill()

            // Обрезаем рисование картинки по контуру фигуры
            ctx.clip()

            // Вставляем изображение в фигуру
            ctx.drawImage(_imgBg, 0, -(_imgBg.height * 0.8))
        }
    }

    Image {
        id: _logoImg
        visible: true
        width: _logoTitle.width * 0.5
        height: parent.height * 0.13
        source: "Images/logotype.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.1
    }

    Text {
        id: _logoTitle
        text: "Psychometrica"
        font.pixelSize: parent.width * 0.07
        color: "white"
        font.weight: 800
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: _logoImg.bottom
    }

    ColumnLayout {
        id: _contentLayout
        width: parent.width
        height: parent.height / 2
        y: parent.height / 2

        Text {
            id: _contentLayout_text
            Layout.preferredWidth: parent.width
            horizontalAlignment: Text.AlignHCenter
            padding: 15
            text: "Know Yourself & Grow Together"
            font.pixelSize: _window.width * 0.11
            font.bold: true
            wrapMode: Text.WordWrap
        }

        MainCustomBtn {
            idBtn: _startBtn
            idBtnText: _startBtnText
            idBtnRect: _startBtnRect
            btnText: "Get started"

            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:/ChooseThemeScreen.qml"))
            }
        }

        RowLayout {
            id: _signLayout
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: _contentLayout.height * 0.04
            Text {
                text: "Already a member?"
                color: "black"
                font.pixelSize: 14
            }
            Text {
                text: "Sign In"
                color: accentColor
                font.bold: true
                font.pixelSize: 14
                font.underline: true
            }
        }
    }
}
