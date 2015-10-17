#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickItemGrabResult>
#include <QQuickPaintedItem>
#include <QQuickWindow>
#include <QThread>

#include "quickitemimagegrabber.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  QObject *object = engine.rootObjects().at(0);

  QQuickWindow *w = qobject_cast<QQuickWindow *>(object);

  QVariant what = "rect";
  QVariant where = "rect.png";
  QMetaObject::invokeMethod(w, "render",
                            Q_ARG(QVariant, what),
                            Q_ARG(QVariant, where));

//  QQuickItem *rect = object->findChild<QQuickItem*>("renderRect");
//  if (rect) {
//    qDebug() << rect->width() << rect->height() << rect->objectName();
//  }

  return app.exec();
}
