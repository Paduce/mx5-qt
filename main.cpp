#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "modules/android-auto/androidauto.h"

int main(int argc, char *argv[])
{
    // Set application attributes
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    app.setApplicationName("Car Dashboard");
    app.setOrganizationName("YourOrganization");
    app.setWindowIcon(QIcon(":/modules/android-auto/social-android.svg"));

    // Register Android Auto as a QML type
    qmlRegisterType<AndroidAutoPlugin>("org.viktorgino.headunit", 1, 0, "AndroidAuto");

    // Initialize QML engine
    QQmlApplicationEngine engine;
    
    // Load the main QML file
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}