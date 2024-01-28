#ifndef AYZENKCLASS_H
#define AYZENKCLASS_H

#include "basetestclass.h"

class AyzenkClass : public BaseTestClass
{
    Q_OBJECT
public:
    AyzenkClass();
    ~AyzenkClass();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();
    Q_INVOKABLE int extIntroversia();
    Q_INVOKABLE int neyrotizm();
    Q_INVOKABLE bool lieCheck();

private:
    QFile testQuestions;
    QTextStream *m_in;
    QVector<int> m_answers;
};

#endif // AYZENKCLASS_H
