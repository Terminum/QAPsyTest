#include "optpesreal.h"

OptPesReal::OptPesReal(QObject *parent)
    : BaseTestClass{parent}
{
    testQuestions.setFileName(":/OptPesSrc/OptPesRea.txt");
    if (!testQuestions.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    setIn(new QTextStream(&testQuestions));
}

void OptPesReal::setAnswer(const int ans)
{
    m_answers.push_back(ans);
}

void OptPesReal::resetTest()
{
    m_answers.clear();
    resetTest();
}
