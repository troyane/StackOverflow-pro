#include "worker.h"
#include <QDebug>
#include <QThread>

int Worker::runCount = 0;

Worker::Worker()
{
}

void Worker::setInput(const QString input)
{
    mInput = input;
}

void Worker::startJob()
{
    qDebug() << "Doing some job here...";
    qDebug() << "Input string: " << mInput;

    // Sleep for 4 seconds, like we have here a long operation
    QThread::sleep(4);

    const QString result = QString("%1. %2. My secret is: %3")
            .arg(QString::number(++runCount))
            .arg(mInput).arg(mSecret);
    emit resultReady(result);
}
