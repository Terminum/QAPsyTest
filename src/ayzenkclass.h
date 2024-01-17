#ifndef AYZENKCLASS_H
#define AYZENKCLASS_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class AyzenkClass : public QObject
{
    Q_OBJECT
public:
    AyzenkClass(QObject *parent = nullptr);
    ~AyzenkClass();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();
    Q_INVOKABLE int extIntroversia();
    Q_INVOKABLE int neyrotizm();
    Q_INVOKABLE bool lieCheck();


signals:
    void testEnd();

private:
    QFile testQuestions;
    QTextStream *m_in;
    QVector<int> m_answers;
    bool m_testEnded = false;
};

#endif // AYZENKCLASS_H
