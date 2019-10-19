#ifndef QUICKWINDOW_H
#define QUICKWINDOW_H

#include <QQuickWindow>
#include <QIcon>

class QuickWindow : public QQuickWindow
{
    Q_OBJECT

    Q_PROPERTY(QString windowIcon READ windowIcon WRITE setWindowIcon NOTIFY windowIconChanged)
public:
    explicit QuickWindow(QQuickWindow *parent = nullptr) : QQuickWindow(parent)  {}

    const inline QString &windowIcon(){return m_str;}
    inline void setWindowIcon(const QString &str){
         if(str != m_str){
             m_str = str;
             setIcon(QIcon(m_str));
             emit windowIconChanged();
         }
   }

signals:
    void windowIconChanged();

private:
    QString m_str;

};

#endif // QUICKWINDOW_H
