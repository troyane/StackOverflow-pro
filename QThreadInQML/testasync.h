#pragma once
#include "worker.h"
#include <QObject>
#include <QThread>

class TestAsync: public QObject
{
    Q_OBJECT
public:
    TestAsync();
    ~TestAsync();
    /// Method callable from QML to prepare job
    Q_INVOKABLE void prepareJob(const QString input);

signals:
    Q_INVOKABLE void startJob();
    void jobDone(const QString result);

private:
    /// Separate worker thread where worker(s) should do their job
    QThread workerThread;
};
