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

const QString &LSIClass::getQuestion() const
{
    qDebug() << m_in->readLine();
    return QString(m_in->readLine());
}

void LSIClass::setAnswer(const bool ans)
{
    m_answers.insert(m_iter++,ans);
    qDebug() << m_answers[m_answers.size()-1];
}
