/****************************************************************************
** Meta object code from reading C++ file 'headunit.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../modules/android-auto/headunit.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'headunit.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Headunit_t {
    QByteArrayData data[31];
    char stringdata0[363];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Headunit_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Headunit_t qt_meta_stringdata_Headunit = {
    {
QT_MOC_LITERAL(0, 0, 8), // "Headunit"
QT_MOC_LITERAL(1, 9, 13), // "outputResized"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 12), // "videoResized"
QT_MOC_LITERAL(4, 37, 15), // "deviceConnected"
QT_MOC_LITERAL(5, 53, 12), // "notification"
QT_MOC_LITERAL(6, 66, 19), // "btConnectionRequest"
QT_MOC_LITERAL(7, 86, 7), // "address"
QT_MOC_LITERAL(8, 94, 13), // "statusChanged"
QT_MOC_LITERAL(9, 108, 18), // "receivedVideoFrame"
QT_MOC_LITERAL(10, 127, 11), // "QVideoFrame"
QT_MOC_LITERAL(11, 139, 5), // "frame"
QT_MOC_LITERAL(12, 145, 15), // "playbackStarted"
QT_MOC_LITERAL(13, 161, 9), // "mouseDown"
QT_MOC_LITERAL(14, 171, 5), // "point"
QT_MOC_LITERAL(15, 177, 9), // "mouseMove"
QT_MOC_LITERAL(16, 187, 7), // "mouseUp"
QT_MOC_LITERAL(17, 195, 8), // "keyEvent"
QT_MOC_LITERAL(18, 204, 3), // "key"
QT_MOC_LITERAL(19, 208, 17), // "videoFrameHandler"
QT_MOC_LITERAL(20, 226, 11), // "outputWidth"
QT_MOC_LITERAL(21, 238, 12), // "outputHeight"
QT_MOC_LITERAL(22, 251, 10), // "videoWidth"
QT_MOC_LITERAL(23, 262, 11), // "videoHeight"
QT_MOC_LITERAL(24, 274, 6), // "status"
QT_MOC_LITERAL(25, 281, 9), // "hu_status"
QT_MOC_LITERAL(26, 291, 12), // "videoSurface"
QT_MOC_LITERAL(27, 304, 22), // "QAbstractVideoSurface*"
QT_MOC_LITERAL(28, 327, 13), // "NO_CONNECTION"
QT_MOC_LITERAL(29, 341, 13), // "VIDEO_WAITING"
QT_MOC_LITERAL(30, 355, 7) // "RUNNING"

    },
    "Headunit\0outputResized\0\0videoResized\0"
    "deviceConnected\0notification\0"
    "btConnectionRequest\0address\0statusChanged\0"
    "receivedVideoFrame\0QVideoFrame\0frame\0"
    "playbackStarted\0mouseDown\0point\0"
    "mouseMove\0mouseUp\0keyEvent\0key\0"
    "videoFrameHandler\0outputWidth\0"
    "outputHeight\0videoWidth\0videoHeight\0"
    "status\0hu_status\0videoSurface\0"
    "QAbstractVideoSurface*\0NO_CONNECTION\0"
    "VIDEO_WAITING\0RUNNING"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Headunit[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       6,  102, // properties
       1,  126, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x06 /* Public */,
       3,    0,   75,    2, 0x06 /* Public */,
       4,    1,   76,    2, 0x06 /* Public */,
       6,    1,   79,    2, 0x06 /* Public */,
       8,    0,   82,    2, 0x06 /* Public */,
       9,    1,   83,    2, 0x06 /* Public */,
      12,    0,   86,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      13,    1,   87,    2, 0x0a /* Public */,
      15,    1,   90,    2, 0x0a /* Public */,
      16,    1,   93,    2, 0x0a /* Public */,
      17,    1,   96,    2, 0x0a /* Public */,
      19,    1,   99,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QVariantMap,    5,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Bool, QMetaType::QPoint,   14,
    QMetaType::Bool, QMetaType::QPoint,   14,
    QMetaType::Bool, QMetaType::QPoint,   14,
    QMetaType::Bool, QMetaType::QString,   18,
    QMetaType::Void, 0x80000000 | 10,   11,

 // properties: name, type, flags
      20, QMetaType::Int, 0x00495003,
      21, QMetaType::Int, 0x00495003,
      22, QMetaType::Int, 0x00495001,
      23, QMetaType::Int, 0x00495001,
      24, 0x80000000 | 25, 0x00495009,
      26, 0x80000000 | 27, 0x0009510b,

 // properties: notify_signal_id
       0,
       0,
       1,
       1,
       4,
       0,

 // enums: name, alias, flags, count, data
      25,   25, 0x0,    3,  131,

 // enum data: key, value
      28, uint(Headunit::NO_CONNECTION),
      29, uint(Headunit::VIDEO_WAITING),
      30, uint(Headunit::RUNNING),

       0        // eod
};

void Headunit::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Headunit *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->outputResized(); break;
        case 1: _t->videoResized(); break;
        case 2: _t->deviceConnected((*reinterpret_cast< QVariantMap(*)>(_a[1]))); break;
        case 3: _t->btConnectionRequest((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->statusChanged(); break;
        case 5: _t->receivedVideoFrame((*reinterpret_cast< const QVideoFrame(*)>(_a[1]))); break;
        case 6: _t->playbackStarted(); break;
        case 7: { bool _r = _t->mouseDown((*reinterpret_cast< QPoint(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 8: { bool _r = _t->mouseMove((*reinterpret_cast< QPoint(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 9: { bool _r = _t->mouseUp((*reinterpret_cast< QPoint(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 10: { bool _r = _t->keyEvent((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 11: _t->videoFrameHandler((*reinterpret_cast< const QVideoFrame(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVideoFrame >(); break;
            }
            break;
        case 11:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVideoFrame >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Headunit::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::outputResized)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Headunit::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::videoResized)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Headunit::*)(QVariantMap );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::deviceConnected)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Headunit::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::btConnectionRequest)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Headunit::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::statusChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Headunit::*)(const QVideoFrame & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::receivedVideoFrame)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (Headunit::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Headunit::playbackStarted)) {
                *result = 6;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 5:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QAbstractVideoSurface* >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Headunit *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->m_outputWidth; break;
        case 1: *reinterpret_cast< int*>(_v) = _t->m_outputHeight; break;
        case 2: *reinterpret_cast< int*>(_v) = _t->videoWidth(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->videoHeight(); break;
        case 4: *reinterpret_cast< hu_status*>(_v) = _t->status(); break;
        case 5: *reinterpret_cast< QAbstractVideoSurface**>(_v) = _t->videoSurface(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Headunit *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (_t->m_outputWidth != *reinterpret_cast< int*>(_v)) {
                _t->m_outputWidth = *reinterpret_cast< int*>(_v);
                Q_EMIT _t->outputResized();
            }
            break;
        case 1:
            if (_t->m_outputHeight != *reinterpret_cast< int*>(_v)) {
                _t->m_outputHeight = *reinterpret_cast< int*>(_v);
                Q_EMIT _t->outputResized();
            }
            break;
        case 5: _t->setVideoSurface(*reinterpret_cast< QAbstractVideoSurface**>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject Headunit::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Headunit.data,
    qt_meta_data_Headunit,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Headunit::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Headunit::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Headunit.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Headunit::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Headunit::outputResized()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Headunit::videoResized()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Headunit::deviceConnected(QVariantMap _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void Headunit::btConnectionRequest(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void Headunit::statusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Headunit::receivedVideoFrame(const QVideoFrame & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void Headunit::playbackStarted()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
