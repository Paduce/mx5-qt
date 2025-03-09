#include "androidauto.h"

AndroidAutoPlugin::AndroidAutoPlugin(QObject *parent) : QObject(parent)
{
    gst_init(NULL, NULL);
    headunit = new Headunit();

    connect(headunit, &Headunit::playbackStarted, this, &AndroidAutoPlugin::playbackStarted);
    connect(headunit, &Headunit::statusChanged, this, &AndroidAutoPlugin::huStatusChanged);
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
    emit message("connected", (headunit->status() > Headunit::NO_CONNECTION));
    emit statusChanged();
}