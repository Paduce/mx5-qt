#include "androidauto.h"

AndroidAutoPlugin::AndroidAutoPlugin(QObject *parent) : QObject(parent)
{
    gst_init(NULL, NULL);
    headunit = new Headunit();

    connect(headunit, &Headunit::playbackStarted, this, &AndroidAutoPlugin::playbackStarted);
    connect(headunit, &Headunit::statusChanged, this, &AndroidAutoPlugin::huStatusChanged);

    connect(headunit, &Headunit::videoSinkChanged, this, &AndroidAutoPlugin::videoSinkChanged);
}

QObject *AndroidAutoPlugin::getContextProperty(){
    return qobject_cast<QObject *>(headunit);
}

void AndroidAutoPlugin::eventMessage(QString id, QVariant message){
    if(id == "UsbConnectionListenerPlugin::UsbDeviceAdded"){
        if(headunit->status() != Headunit::RUNNING){
            headunit->startHU();
        }
    } else if(id == "UsbConnectionListenerPlugin::UsbDeviceRemoved"){
    } else if(id == "SYSTEM::SetNightMode"){
        headunit->setNigthmode(message.toBool());
    }
}

void AndroidAutoPlugin::init(){
    headunit->init();
}

void AndroidAutoPlugin::startHU() {
    headunit->startHU();
}

void AndroidAutoPlugin::stopHU() {
    // Implement this if needed
}

void AndroidAutoPlugin::start() {
    qDebug() << "AndroidAutoPlugin::startMedia called";
    
    // Force status to RUNNING to make sure video displays
    if (headunit) {
        headunit->setStatus(Headunit::RUNNING);
    }
    
    // Now call the existing media start method
    headunit->startMedia();
}
void AndroidAutoPlugin::stop() {
    headunit->stopMedia();
}

void AndroidAutoPlugin::prevTrack() {
    headunit->prevTrack();
}

void AndroidAutoPlugin::nextTrack() {
    headunit->nextTrack();
}

void AndroidAutoPlugin::setMediaVolume(uint8_t volume) {
    headunit->setMediaVolume(volume);
}

void AndroidAutoPlugin::setVoiceVolume(uint8_t volume) {
    headunit->setVoiceVolume(volume);
}

bool AndroidAutoPlugin::mouseDown(QPoint point) {
    return headunit->mouseDown(point);
}

bool AndroidAutoPlugin::mouseMove(QPoint point) {
    return headunit->mouseMove(point);
}

bool AndroidAutoPlugin::mouseUp(QPoint point) {
    return headunit->mouseUp(point);
}

void AndroidAutoPlugin::huStatusChanged(){
    qDebug() << "Android Auto status changed to:" << headunit->status();
    
    emit message("connected", (headunit->status() > Headunit::NO_CONNECTION));
    emit statusChanged();
}


void AndroidAutoPlugin::startMedia() {
    qDebug() << "AndroidAutoPlugin::startMedia called";
    
    if (headunit) {
        qDebug() << "Setting status to RUNNING to force video display";
        
        // Force status to running - much simpler approach
        headunit->setStatus(Headunit::RUNNING);
    }
}