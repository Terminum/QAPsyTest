QT += charts qml quick

SOURCES += \
        main.cpp \
        src/ayzenkclass.cpp \
        src/basetestclass.cpp \
        src/lsiclass.cpp \
        src/optpesreal.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/ayzenkclass.h \
    src/basetestclass.h \
    src/lsiclass.h \
    src/optpesreal.h

DISTFILES += \
    ChooseThemeScreen.qml \
    DescriptionOfTest.qml \
    FirstScreen.qml \
    GoHomeBtn.qml \
    GraphChart.qml \
    LifeStyleCharts.qml \
    MainCustomBtn.qml \
    TestScreen.qml \
    qml/Ayzenk/AyzenkTest.qml \
    qml/Ayzenk/AyzenkGraph.qml \
    qml/Opt/OptPesRealTest.qml \
    qml/Opt/OptPesRealConclusion.qml

ios {
    # Qt 6.8.1 + новый Apple clang: qyieldcpu.h вызывает __yield() без объявления.
    # Подключаем объявление принудительно. Можно убрать после обновления Qt.
    QMAKE_CXXFLAGS += -include arm_acle.h

    # Bundle identifier: noGame.QAPsyTest
    QMAKE_TARGET_BUNDLE_PREFIX = noGame
    QMAKE_BUNDLE = QAPsyTest
    QMAKE_IOS_DEPLOYMENT_TARGET = 16.0
    VERSION = 1.0.0

    # Development Team не храним в репозитории: он у каждого свой.
    # Задаётся в Qt Creator (Projects → Build → iOS Settings → Development team).
}

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

#set_target_properties(qtodo PROPERTIES
#            QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
#        )
