#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "src/lsiclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    LSIClass life;
    life.getQuestion();
    life.setAnswer(1);
    life.setAnswer(0);
    life.setAnswer(1);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QAPsyTest/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
//    QSharedPointer<QQmlContext> rootContext(engine.rootContext());
//    rootContext->setContextProperty("Test", life);

    return app.exec();
}
