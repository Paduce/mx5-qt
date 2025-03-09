#ifndef MEDIAINTERFACE_H
#define MEDIAINTERFACE_H

#include <QObject>
#include <stdint.h>

// Media interface settings
struct MediaInterfaceSettings {
    bool mediaStream;
    bool voiceStream;
};

// Media interface definition
class MediaInterface {
public:
    virtual ~MediaInterface() {}
    
    // Pure virtual methods that must be implemented by media plugins
    virtual void start() = 0;
    virtual void stop() = 0;
    virtual void prevTrack() = 0;
    virtual void nextTrack() = 0;
    virtual void setMediaVolume(uint8_t volume) = 0;
    virtual void setVoiceVolume(uint8_t volume) = 0;
    
    // Signals that would be emitted by the plugin
    virtual void playbackStarted() = 0;
    
    // Media interface settings
    MediaInterfaceSettings m_interfaceSettings;
};

#endif // MEDIAINTERFACE_H