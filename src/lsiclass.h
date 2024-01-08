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
    Q_INVOKABLE double overallTension(); // общая напряженность всех защит (ОНЗ)
    Q_INVOKABLE double repressionTension(); //Вытеснение
    Q_INVOKABLE double regressusTension(); //Регрессия
    Q_INVOKABLE double substitutionTension(); //Замещение
    Q_INVOKABLE double denialTension(); //Отрицание
    Q_INVOKABLE double projectioTension(); //Проекция
    Q_INVOKABLE double compensationTension(); //Компенсация
    Q_INVOKABLE double hyperCompensationTension(); //Гиперкомпенсация
    Q_INVOKABLE double rationalisTension(); //Рационализация

signals:
    void testEnd();

private:
    QFile testQuestions;
    QTextStream *m_in;
    QMap <int,int> m_answers;
    int m_iter;
    bool m_testEnded = false;

};

#endif // LSICLASS_H
