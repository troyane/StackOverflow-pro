#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "listprovider.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    ListProvider listProvider;
    engine.rootContext()->setContextProperty("Lists", &listProvider);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
