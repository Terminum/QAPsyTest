#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/lsiclass.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    LSIClass life;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("LifeStyle", &life);
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
