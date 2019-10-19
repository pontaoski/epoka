#ifndef WINDOWICONISER_H
#define WINDOWICONISER_H

#include <QObject>
#include <QQuickWindow>
#include <QImage>

class WindowIconiser : public QObject
{
    Q_OBJECT
public:
    explicit WindowIconiser(QObject *parent = nullptr);
    Q_INVOKABLE void setIconForWindow(QImage icon, QQuickWindow &win);

private:
    QWindow m_win;

signals:

public slots:
};

#endif // WINDOWICONISER_H
