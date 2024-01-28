#ifndef BASETESTCLASS_H
#define BASETESTCLASS_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class BaseTestClass : public QObject
{
    Q_OBJECT
public:
    BaseTestClass(QObject *parent = nullptr);
    ~BaseTestClass();

signals:
    void testEnd();

private:

};

#endif // BASETESTCLASS_H
