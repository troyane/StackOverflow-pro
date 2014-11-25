#include "dataobject.h"

DataObject::DataObject(QObject *parent) :
    QObject(parent)
{
}

void DataObject::setName(QString arg)
{
    if (m_name == arg)
        return;

    m_name = arg;
    emit nameChanged(arg);
}

void DataObject::setValue(int arg)
{
    if (m_value == arg)
        return;

    m_value = arg;
    emit valueChanged(arg);
}
