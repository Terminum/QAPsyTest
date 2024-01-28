#include "ayzenkclass.h"

AyzenkClass::AyzenkClass()
{
    testQuestions.setFileName(":/AyzenkSrc/QAyzenk.txt");
    if (!testQuestions.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    m_in = new QTextStream(&testQuestions);
}

AyzenkClass::~AyzenkClass()
{
    testQuestions.close();
    delete m_in;
}

const QString AyzenkClass::getQuestion()
{
    if (!m_in->atEnd()) {
        return m_in->readLine();
    } else {
        emit testEnd();
        qDebug() << lieCheck() << neyrotizm() << extIntroversia();
        return "";
    }
}

void AyzenkClass::setAnswer(const int ans)
{
    m_answers.push_back(ans);
}

void AyzenkClass::resetTest()
{
    qDebug() << "Reset test";
    m_answers.clear();
    if(!m_in->seek(0))
        qDebug() << "Seek fail";
    else
        qDebug() << "Seek Succes";
}

int AyzenkClass::extIntroversia()
{
    int res = m_answers[0];
    res += m_answers[2];
    res += m_answers[7];
    res += m_answers[9];
    res += m_answers[12];
    res += m_answers[16];
    res += m_answers[21];
    res += m_answers[24];
    res += m_answers[26];
    res += m_answers[38];
    res += m_answers[43];
    res += m_answers[45];
    res += m_answers[48];
    res += m_answers[52];
    res += m_answers[55];
    res += !m_answers[4];
    res += !m_answers[14];
    res += !m_answers[19];
    res += !m_answers[28];
    res += !m_answers[31];
    res += !m_answers[33];
    res += !m_answers[36];
    res += !m_answers[40];
    res += !m_answers[50];

    return res;
}

int AyzenkClass::neyrotizm()
{
    int res = m_answers[1];
    res += m_answers[3];
    res += m_answers[6];
    res += m_answers[8];
    res += m_answers[10];
    res += m_answers[13];
    res += m_answers[15];
    res += m_answers[18];
    res += m_answers[20];
    res += m_answers[22];
    res += m_answers[25];
    res += m_answers[27];
    res += m_answers[30];
    res += m_answers[32];
    res += m_answers[34];
    res += m_answers[37];
    res += m_answers[39];
    res += m_answers[42];
    res += m_answers[44];
    res += m_answers[46];
    res += m_answers[49];
    res += m_answers[51];
    res += m_answers[54];
    res += m_answers[56];

    return res;
}

/*
 *если вы набираете более 4 баллов по этому пункту, это значит,
 *что вы были неискренны в некоторых вопросах.
 *Отметка 4 и ниже свидетельствует о норме в ответах.
 *Рекомендация перепройти тест
 *false - проверка не пройдена
 *true - проверка пройдена
*/
bool AyzenkClass::lieCheck()
{
    int res = m_answers[5];
    res += m_answers[23];
    res += m_answers[35];
    res += !m_answers[11];
    res += !m_answers[17];
    res += !m_answers[29];
    res += !m_answers[41];
    res += !m_answers[47];

    return (res > 4) ? false : true;
}
