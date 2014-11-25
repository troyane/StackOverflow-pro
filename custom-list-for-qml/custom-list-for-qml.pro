TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    listprovider.cpp \
    dataobject.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    listprovider.h \
    dataobject.h
