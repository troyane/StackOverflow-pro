#pragma once
#include <QObject>

class Worker : public QObject
{
    Q_OBJECT
public:
    Worker();
    /// Method to set all input data, e.g. all input arguments required for job
    void setInput(const QString input);
    void startJob();

signals:
    /// Signal that will be called as soon as job will be done
    void resultReady(QString result);

private:
    QString mInput;
    /// Static class variable to reflect run count
    static int runCount;
    /// Simple string that is available only on C++ side, inside worker
    const QString mSecret = "Pony are horses!";
};
