#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "testasync.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<TestAsync>("AsyncWorker", 1, 0, "AsyncWorker");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.thread()->setObjectName("MainThread");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
