#-------------------------------------------------
#
# Project created by QtCreator 2019-01-20T01:11:58
#
#-------------------------------------------------

QT       += core gui multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

# QMAKE_LFLAGS += -no-pie

TARGET = Soundboard
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        mainwindow.cpp \
    dialogboard.cpp \
    dialogkeybind.cpp \
    dialogsettings.cpp \
    listitemboard.cpp \
    listitemsound.cpp \
    widgetkeybind.cpp \
    listitem.cpp \
    dialogsound.cpp \
    audiofilestream.cpp \
    widgetaudio.cpp \
    audioobject.cpp

HEADERS += \
        mainwindow.h \
    dialogboard.h \
    dialogkeybind.h \
    dialogsettings.h \
    listitemboard.h \
    listitemsound.h \
    widgetkeybind.h \
    listitem.h \
    dialogsound.h \
    audiofilestream.h \
    widgetaudio.h \
    audioobject.h

FORMS += \
        mainwindow.ui \
    dialogboard.ui \
    dialogkeybind.ui \
    dialogsettings.ui \
    dialogsound.ui

# QHotkey (from qhotkey.pri)
PUBLIC_HEADERS += $$PWD/QHotkey/qhotkey.h \
        $$PWD/QHotkey/QHotkey

HEADERS += $$PUBLIC_HEADERS \
        $$PWD/QHotkey/qhotkey_p.h

SOURCES += $$PWD/QHotkey/qhotkey.cpp

mac: SOURCES += $$PWD/QHotkey/qhotkey_mac.cpp
else:win32: SOURCES += $$PWD/QHotkey/qhotkey_win.cpp
else:unix: SOURCES += $$PWD/QHotkey/qhotkey_x11.cpp

INCLUDEPATH += $$PWD/QHotkey

# QHotkey (from qhotkey.prc)
mac: LIBS += -framework Carbon
else:win32: LIBS += -luser32
else:unix {
        QT += x11extras
        LIBS += -lX11
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
