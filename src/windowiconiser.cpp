#include "windowiconiser.h"
#include <QWindow>
#include <QImage>
#include <QIcon>
#include <QPixmap>
#include <QObject>
#include <QDebug>
#include <QQuickWindow>

WindowIconiser::WindowIconiser(QObject *parent) : QObject(parent)
{

}

void WindowIconiser::setIconForWindow(QImage icon, QQuickWindow &win)
{
    qDebug() << "ouch";
    win.setIcon(QIcon(QPixmap::fromImage(icon)));
}
