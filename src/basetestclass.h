#ifndef BASETESTCLASS_H
#define BASETESTCLASS_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class BaseTestClass : public QObject
{
    Q_OBJECT
public:
    explicit BaseTestClass(QObject *parent = nullptr);
    ~BaseTestClass();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();

    QFile &getTestQuestions() const;
    void setTestQuestions(const QFile &newTestQuestions);

    QTextStream *in() const;
    void setIn(QTextStream *newIn);

    bool testEnded() const;
    void setTestEnded(bool newTestEnded);

signals:
    void testEnd();

private:
    bool m_testEnded = false;

};

#endif // BASETESTCLASS_H
