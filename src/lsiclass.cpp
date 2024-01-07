#include "lsiclass.h"
#include <QDebug>

LSIClass::LSIClass(QObject *parent) :
    QObject(parent)
{
    testQuestions.setFileName(":/LifeStyleIndexKellermanKonte.txt");
    if (!testQuestions.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    m_in = new QTextStream(&testQuestions);
}

LSIClass::~LSIClass()
{
    testQuestions.close();
    delete m_in;
}

const QString LSIClass::getQuestion()
{
    if (!m_in->atEnd()) {
        qDebug() << m_answers.size();
        return m_in->readLine();
    } else {
        m_testEnded = true;
        emit testEnd();
        return "000";
    }
}

void LSIClass::setAnswer(const int ans)
{
    m_answers.insert(m_iter++,ans);
    qDebug() << m_answers[m_answers.size()-1];
}

double LSIClass::overallTension()
{
    if(!m_testEnded)
        return 0;
    return m_answers.keys(1).count() / 92;
}

double LSIClass::regressusTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[1]};
    res += m_answers[4];
    res += m_answers[8];
    res += m_answers[12];
    res += m_answers[26];
    res += m_answers[31];
    res += m_answers[34];
    res += m_answers[39];
    res += m_answers[49];
    res += m_answers[53];
    res += m_answers[61];
    res += m_answers[63];
    res += m_answers[67];
    res += m_answers[69];
    res += m_answers[71];
    res += m_answers[74];
    res += m_answers[83];
    return res / 17;
}

double LSIClass::substitutionTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[7]};
    res += m_answers[9];
    res += m_answers[18];
    res += m_answers[20];
    res += m_answers[24];
    res += m_answers[36];
    res += m_answers[48];
    res += m_answers[57];
    res += m_answers[75];
    res += m_answers[88];
    return res / 10;
}

double LSIClass::denialTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[0]};
    res += m_answers[19];
    res += m_answers[22];
    res += m_answers[25];
    res += m_answers[38];
    res += m_answers[41];
    res += m_answers[43];
    res += m_answers[45];
    res += m_answers[46];
    res += m_answers[62];
    res += m_answers[89];
    return res / 11;
}

double LSIClass::projectioTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[11]};
    res += m_answers[21];
    res += m_answers[27];
    res += m_answers[28];
    res += m_answers[44];
    res += m_answers[58];
    res += m_answers[66];
    res += m_answers[70];
    res += m_answers[77];
    res += m_answers[78];
    res += m_answers[81];
    res += m_answers[87];
    return res / 12;
}

double LSIClass::сompensationTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[2]};
    res += m_answers[14];
    res += m_answers[15];
    res += m_answers[17];
    res += m_answers[23];
    res += m_answers[32];
    res += m_answers[51];
    res += m_answers[56];
    res += m_answers[82];
    res += m_answers[84];
    return res / 10;
}

double LSIClass::hyperCompensationTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[16]};
    res += m_answers[52];
    res += m_answers[60];
    res += m_answers[64];
    res += m_answers[65];
    res += m_answers[68];
    res += m_answers[73];
    res += m_answers[79];
    res += m_answers[80];
    res += m_answers[85];
    return res / 10;
}

double LSIClass::rationalisTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[3]};
    res += m_answers[6];
    res += m_answers[13];
    res += m_answers[29];
    res += m_answers[37];
    res += m_answers[42];
    res += m_answers[47];
    res += m_answers[50];
    res += m_answers[55];
    res += m_answers[59];
    res += m_answers[86];
    res += m_answers[90];
    return res / 12;
}

double LSIClass::RepressionTension()
{
    if(!m_testEnded)
        return 0;

    int res {m_answers[5]};
    res += m_answers[10];
    res += m_answers[30];
    res += m_answers[33];
    res += m_answers[35];
    res += m_answers[40];
    res += m_answers[54];
    res += m_answers[72];
    res += m_answers[76];
    res += m_answers[91];
    return res / 10;
}
