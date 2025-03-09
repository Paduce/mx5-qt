#ifndef ANDROIDAUTO_H
#define ANDROIDAUTO_H

#include <QObject>
#include <QThreadPool>
#include <QDebug>
#include "headunit.h"

class AndroidAutoPlugin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int status READ status NOTIFY statusChanged)
    Q_PROPERTY(int outputWidth MEMBER m_outputWidth)
    Q_PROPERTY(int outputHeight MEMBER m_outputHeight)
    Q_PROPERTY(int videoWidth READ videoWidth)
    Q_PROPERTY(int videoHeight READ videoHeight)

public:
    explicit AndroidAutoPlugin(QObject *parent = nullptr);
    
    // Methods that were from PluginInterface
    QObject *getContextProperty();
    void init();

    // Methods that were from MediaInterface
    void start();
    void stop();
    void prevTrack();
    void nextTrack();
    void setMediaVolume(uint8_t volume);
    void setVoiceVolume(uint8_t volume);

    // Status method
    int status() const { return headunit ? headunit->status() : 0; }
    
    // Video dimensions
    int videoWidth() const { return headunit ? headunit->videoWidth() : 800; }
    int videoHeight() const { return headunit ? headunit->videoHeight() : 480; }

    // Mouse handling for touch events
    Q_INVOKABLE bool mouseDown(QPoint point);
    Q_INVOKABLE bool mouseMove(QPoint point);
    Q_INVOKABLE bool mouseUp(QPoint point);
    
    // USB device methods
    Q_INVOKABLE void startHU();
    Q_INVOKABLE void stopHU();

signals:
    void playbackStarted();
    void message(QString id, QVariant message);
    void statusChanged();

public slots:
    void eventMessage(QString id, QVariant message);

private slots:
    void huStatusChanged();

private:
    Headunit *headunit = nullptr;
    int m_outputWidth = 800;
    int m_outputHeight = 480;
};

#endif // ANDROIDAUTO_H