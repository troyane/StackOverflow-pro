#ifndef LISTPROVIDER_H
#define LISTPROVIDER_H

#include <QObject>

#include "dataobject.h"

typedef QList<QObject*> ObjectsList;

class ListProvider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ObjectsList data READ data WRITE setData NOTIFY dataChanged)
    ObjectsList m_data;
public:
    explicit ListProvider(QObject *parent = 0);
    ObjectsList data() const;

signals:
    void dataChanged(ObjectsList arg);

public slots:
    void setData(ObjectsList arg);
};

#endif // LISTPROVIDER_H
