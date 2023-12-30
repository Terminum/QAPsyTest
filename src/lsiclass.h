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

    /*Q_INVOCABLE*/ const QString &getQuestion() const;
    /*Q_INVOCABLE*/ void setAnswer(const bool ans);


private:
    QFile testQuestions;
    QTextStream *m_in;
    QMap <int,bool> m_answers;
    int m_iter;

};

#endif // LSICLASS_H
