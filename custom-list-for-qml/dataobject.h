#ifndef DATAOBJECT_H
#define DATAOBJECT_H

#include <QObject>

class DataObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

    QString m_name;
    int m_value;

public:
    explicit DataObject(QObject *parent = 0);

    QString name() const { return m_name; }
    int value() const { return m_value; }

signals:
    void nameChanged(QString arg);
    void valueChanged(int arg);

public slots:
    void setName(QString arg);
    void setValue(int arg);
};

#endif // DATAOBJECT_H
