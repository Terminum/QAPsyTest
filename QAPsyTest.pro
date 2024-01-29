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
    TestProject.qml \
    TestScreen.qml\
#    qml/*

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
