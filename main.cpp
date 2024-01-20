#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/lsiclass.h"
#include "src/ayzenkclass.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    LSIClass life;
    engine.rootContext()->setContextProperty("LifeStyle", &life);

    AyzenkClass ayzenk;
    engine.rootContext()->setContextProperty("Ayzenk", &ayzenk);

    const QUrl url(u"qrc:/QAPsyTest/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    QNativeInterface::QAndroidApplication::hideSplashScreen(500);

    return app.exec();
}
