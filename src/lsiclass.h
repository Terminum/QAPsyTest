#ifndef LSICLASS_H
#define LSICLASS_H

#include "basetestclass.h"

class LSIClass : public BaseTestClass {
    Q_OBJECT

public:
    LSIClass();
    ~LSIClass();

    Q_INVOKABLE const QString getQuestion();
    Q_INVOKABLE void setAnswer(const int ans);
    Q_INVOKABLE void resetTest();
    Q_INVOKABLE double overallTension(); // общая напряженность всех защит (ОНЗ)
    Q_INVOKABLE double repressionTension(); //Вытеснение
    Q_INVOKABLE double regressusTension(); //Регрессия
    Q_INVOKABLE double substitutionTension(); //Замещение
    Q_INVOKABLE double denialTension(); //Отрицание
    Q_INVOKABLE double projectioTension(); //Проекция
    Q_INVOKABLE double compensationTension(); //Компенсация
    Q_INVOKABLE double hyperCompensationTension(); //Гиперкомпенсация
    Q_INVOKABLE double rationalisTension(); //Рационализация
    Q_INVOKABLE QString getDescription(int index);

private:
    QFile testQuestions;
    QTextStream *m_in;
    QVector<int> m_answers;
};

#endif // LSICLASS_H
