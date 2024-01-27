#ifndef OPTPESREAL_H
#define OPTPESREAL_H

#include "basetestclass.h"

class OptPesReal : public BaseTestClass
{
    Q_OBJECT
public:
    OptPesReal();
    ~OptPesReal();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();
    Q_INVOKABLE QString testResult();

private:
    QFile testQuestions;
    QTextStream *m_in;
    QVector<int> m_answers;
    bool m_testEnded = false;
};

#endif // OPTPESREAL_H
