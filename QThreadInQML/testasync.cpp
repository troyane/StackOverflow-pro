#include "testasync.h"
#include <QDebug>

TestAsync::TestAsync()
    : QObject(nullptr)
{
    /// "Mark" our worker thread to make it readable
    workerThread.setObjectName("WorkerThread");
}

TestAsync::~TestAsync()
{
    qDebug() << "Quit worker thread, and wait until it ends.";
    workerThread.quit();
    workerThread.wait();
}

void TestAsync::prepareJob(const QString input)
{
    /// For each new job we'll have new worker
    Worker *worker = new Worker;
    /// Pass all arguments to worker
    worker->setInput(input);

    qDebug() << "Now worker is placed in: " << worker->thread();
    // as soon as we move worker to another thread, its thread should change
    worker->moveToThread(&workerThread);
    qDebug() << "Now worker is placed in: " << worker->thread();

    /// Provide all required connections:
    ///  - delete worker on finished
    ///  - emit respective signal on job done
    ///  - start job on signal
    connect(worker, &Worker::resultReady, this, &TestAsync::jobDone);
    connect(worker, &Worker::resultReady, worker, &QObject::deleteLater);
    connect(this, &TestAsync::startJob, worker, &Worker::startJob);
    /// Run worker thread
    workerThread.start();
}
