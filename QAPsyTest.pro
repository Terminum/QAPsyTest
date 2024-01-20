QT += charts qml quick

SOURCES += \
        main.cpp \
        src/lsiclass.cpp

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
    src/lsiclass.h

DISTFILES += \
    ChooseThemeScreen.qml \
    DescriptionOfTest.qml \
    FirstScreen.qml \
    GoHomeBtn.qml \
    GraphChart.qml \
    LifeStyleCharts.qml \
    MainCustomBtn.qml \
    TestProject.qml \
    TestScreen.qml

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
