#ifndef LSICLASS_H
#define LSICLASS_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QMap>

class LSIClass : public QObject
{
    Q_OBJECT
public:
    LSIClass(QObject *parent = nullptr);
    ~LSIClass();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);

signals:
    void testEnd();


private:
    QFile testQuestions;
    QTextStream *m_in;
    QMap <int,int> m_answers;
    int m_iter;

};

#endif // LSICLASS_H
