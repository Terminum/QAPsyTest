#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/lsiclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    LSIClass life;
//    life.getQuestion();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("LifeStyle", &life);
    const QUrl url(u"qrc:/QAPsyTest/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
