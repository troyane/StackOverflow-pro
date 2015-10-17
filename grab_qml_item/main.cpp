// main.cpp
//
// Created by troyane@github

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  // I can be 100% sure, that my QML window is first in list. But be careful.
  QObject *object = engine.rootObjects().at(0);
  QQuickWindow *w = qobject_cast<QQuickWindow *>(object);
  if (w) {
    // Object name of QML item inside w, I want to grab.
    QVariant what = "rect";
    // File name of picture to save grabbed item. (For testing purposes
    // it is Ok for me to save it in the same directory with app binary)
    QVariant where = "rect.png";
    QMetaObject::invokeMethod(w, "render",
                              Q_ARG(QVariant, what),
                              Q_ARG(QVariant, where));
  }
  return app.exec();
}
