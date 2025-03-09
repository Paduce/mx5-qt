QT += qml quick multimedia quickcontrols2 bluetooth
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated.
DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    main.cpp \
    modules/android-auto/androidauto.cpp \
    modules/android-auto/headunit.cpp \
    modules/android-auto/headunit/hu/hu_aad.cpp \
    modules/android-auto/headunit/hu/hu_aap.cpp \
    modules/android-auto/headunit/hu/hu_ssl.cpp \
    modules/android-auto/headunit/hu/hu_tcp.cpp \
    modules/android-auto/headunit/hu/hu_usb.cpp \
    modules/android-auto/headunit/hu/hu_uti.cpp \
    modules/android-auto/headunit/hu/generated.x64/hu.pb.cc \
    modules/android-auto/headunit/common/glib_utils.cpp \
    modules/android-auto/qgstvideobuffer.cpp

HEADERS += \
    modules/android-auto/androidauto.h \
    modules/android-auto/headunit.h \
    modules/android-auto/headunit/hu/hu_aad.h \
    modules/android-auto/headunit/hu/hu_aap.h \
    modules/android-auto/headunit/hu/hu_ssl.h \
    modules/android-auto/headunit/hu/hu_tcp.h \
    modules/android-auto/headunit/hu/hu_usb.h \
    modules/android-auto/headunit/hu/hu_uti.h \
    modules/android-auto/headunit/hu/generated.x64/hu.pb.h \
    modules/android-auto/headunit/common/glib_utils.h \
    modules/android-auto/qgstvideobuffer.h

RESOURCES += resources.qrc

# Include paths - using explicit paths
INCLUDEPATH += $PWD/modules/android-auto/headunit/hu
INCLUDEPATH += $PWD/modules/android-auto/headunit/hu/generated.x64
INCLUDEPATH += $PWD/modules/android-auto/headunit/common
INCLUDEPATH += $PWD/includes

# Package configurations
CONFIG += link_pkgconfig
PKGCONFIG += gstreamer-1.0 gstreamer-app-1.0 gstreamer-video-1.0 protobuf libusb-1.0 openssl glib-2.0

# Define output directories
CONFIG(debug, debug|release) {
    DESTDIR = $$OUT_PWD/debug
} else {
    DESTDIR = $$OUT_PWD/release
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.rcc
UI_DIR = $$DESTDIR/.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target