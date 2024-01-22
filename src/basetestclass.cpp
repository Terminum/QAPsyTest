#include "basetestclass.h"

BaseTestClass::BaseTestClass(QObject *parent)
    : QObject{parent}
{

}

//BaseTestClass::~BaseTestClass()
//{
//    testQuestions.close();
//    delete m_in;
//}

const QString BaseTestClass::getQuestion()
{
    if (!m_in->atEnd()) {
        return m_in->readLine();
    } else {
        m_testEnded = true;
        emit testEnd();
        return "";
    }
}

void BaseTestClass::setAnswer(const int ans)
{
    if(!m_testEnded) {
        m_answers.push_back(ans);
    }
}

void BaseTestClass::resetTest()
{
    qDebug() << "Reset test";
    m_testEnded = false;
    m_answers.clear();
    if(!m_in->seek(0))
        qDebug() << "Seek fail";
    else
        qDebug() << "Seek Succes";
}

bool BaseTestClass::testEnded() const
{
    return m_testEnded;
}

void BaseTestClass::setTestEnded(bool newTestEnded)
{
    m_testEnded = newTestEnded;
}
