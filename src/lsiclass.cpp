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
        emit testEnd();
        return "";
    }
}

void LSIClass::setAnswer(const int ans)
{
    m_answers.insert(m_iter++,ans);
    qDebug() << m_answers[m_answers.size()-1];
}
