#ifndef OPTPESREAL_H
#define OPTPESREAL_H

#include "basetestclass.h"

class OptPesReal : public BaseTestClass
{
    Q_OBJECT
public:
    explicit OptPesReal(QObject *parent = nullptr);
    ~OptPesReal();

    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();

private:
    QFile testQuestions;
    QVector<int> m_answers;
};

#endif // OPTPESREAL_H
