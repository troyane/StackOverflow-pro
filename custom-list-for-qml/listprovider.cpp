#include <QDebug>
#include "listprovider.h"

ListProvider::ListProvider(QObject *parent) :
    QObject(parent)
{
    qRegisterMetaType<ObjectsList>("ObjectsList");

    for (int i = 0; i < 5; ++i) {
        DataObject *d = new DataObject();
        d->setName( QString("Object #%1").arg(i) );
        d->setValue( i*i );
        m_data.append(d);
    }
    emit dataChanged(m_data);
}

ObjectsList ListProvider::data() const
{
    return m_data;
}

void ListProvider::setData(ObjectsList arg)
{
    if (m_data == arg)
        return;

    m_data = arg;
    emit dataChanged(arg);
}
