#include "optpesreal.h"

OptPesReal::OptPesReal()
{
    testQuestions.setFileName(":/OptPesSrc/OptPesRea.txt");
    if (!testQuestions.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    m_in = new QTextStream(&testQuestions);
}

OptPesReal::~OptPesReal()
{
    testQuestions.close();
    delete m_in;
}

const QString OptPesReal::getQuestion()
{
    if (!m_in->atEnd()) {
        return m_in->readLine();
    } else {
        emit testEnd();
        return "";
    }
}

void OptPesReal::setAnswer(const int ans)
{
    m_answers.push_back(ans);
}

void OptPesReal::resetTest()
{
    m_answers.clear();
}

QString OptPesReal::testResult()
{
    int res = m_answers[0];
    res += m_answers[1];
    res += m_answers[3];
    res += m_answers[6];
    res += m_answers[10];
    res += m_answers[12];
    res += m_answers[13];
    res += m_answers[14];
    res += m_answers[15];
    res += m_answers[16];
    res += m_answers[17];
    res += m_answers[18];
    res += m_answers[19];
    res += !m_answers[2];
    res += !m_answers[4];
    res += !m_answers[5];
    res += !m_answers[7];
    res += !m_answers[8];
    res += !m_answers[9];
    res += !m_answers[11];

    if (res < 6) {
        return "Rare Pessimist";
    } else if (res < 11) {
        return "Sad by reality now";
    } else if (res < 16) {
        return "Life appears obvious & really";
    } else if (res < 19) {
        return "well optimist";
    } else {
        return "Omg most optimistic person";
    }
}
