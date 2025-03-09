#ifndef PLUGININTERFACE_H
#define PLUGININTERFACE_H

#include <QObject>
#include <QStringList>
#include <QVariant>

// Plugin settings structure
struct PluginSettings {
    QStringList events;
    QStringList eventListeners;
};

// Plugin interface definition
class PluginInterface {
public:
    virtual ~PluginInterface() {}
    
    // Pure virtual methods that must be implemented by plugins
    virtual QObject* getContextProperty() = 0;
    virtual void init() = 0;
    virtual void eventMessage(QString id, QVariant message) = 0;
    
    // Plugin settings
    PluginSettings m_pluginSettings;
};

// Declare interface
Q_DECLARE_INTERFACE(PluginInterface, "org.viktorgino.headunit.plugininterface")

#endif // PLUGININTERFACE_H