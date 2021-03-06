#-------------------------------------------------
#
# Project created by QtCreator 2019-01-20T01:11:58
#
#-------------------------------------------------

win32: RC_ICONS = res/icon.ico

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

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
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

# This uses the -O3 compiler instead of -O2
CONFIG(release, debug|release) {
    CONFIG += optimize_full
}

SOURCES += \
    src/Audio/audioengine.cpp \
    src/Audio/audioobject.cpp \
    src/Audio/audioobjectfile.cpp \
    src/Audio/audioobjectinput.cpp \
    src/Audio/device.cpp \
    src/Audio/iomultifile.cpp \
    src/Audio/tempbuffer.cpp \
    src/Dialog/dialogboard.cpp \
    src/Dialog/dialogkeybind.cpp \
    src/Dialog/dialogsettings.cpp \
    src/Hotkey/hotkeytrigger.cpp \
    src/Widget/clickablelabel.cpp \
    src/Widget/listitemboard.cpp \
    src/Widget/listitemsound.cpp \
    src/Widget/widgetkeybind.cpp \
    src/Widget/listitem.cpp \
    src/Dialog/dialogsound.cpp \
    src/Widget/widgetaudio.cpp \
    src/Widget/widgetvolume.cpp \
    src/mainapp.cpp

HEADERS += \
    src/Audio/audioengine.h \
    src/Audio/audioobject.h \
    src/Audio/audioobjectfile.h \
    src/Audio/audioobjectinput.h \
    src/Audio/device.h \
    src/Audio/iomultifile.h \
    src/Audio/tempbuffer.h \
    src/Dialog/dialogboard.h \
    src/Dialog/dialogkeybind.h \
    src/Dialog/dialogsettings.h \
    src/Dialog/dialogtestaudio.h \
    src/Hotkey/hotkeytrigger.h \
    src/Widget/clickablelabel.h \
    src/Widget/listitemboard.h \
    src/Widget/listitemsound.h \
    src/Widget/widgetkeybind.h \
    src/Widget/listitem.h \
    src/Dialog/dialogsound.h \
    src/Widget/widgetaudio.h \
    src/Widget/widgetvolume.h \
    src/mainapp.h

FORMS += \
    src/Dialog/dialogboard.ui \
    src/Dialog/dialogkeybind.ui \
    src/Dialog/dialogsettings.ui \
    src/Dialog/dialogsound.ui \
    src/mainapp.ui

# Sources for HotkeyPass
HEADERS += src/Hotkey/hotkeypass.h
SOURCES += src/Hotkey/hotkeypass.cpp
mac: SOURCES += src/Hotkey/hotkeypass_mac.cpp
else:win32: SOURCES += src/Hotkey/hotkeypass_win.cpp
else:unix: SOURCES += src/Hotkey/hotkeypass_x11.cpp

# Sources for HotkeyUtil
HEADERS += src/Hotkey/hotkeyutil.h
mac: SOURCES += src/Hotkey/hotkeyutil_mac.cpp
else:win32: SOURCES += src/Hotkey/hotkeyutil_win.cpp
else:unix: SOURCES += src/Hotkey/hotkeyutil_x11.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#QHotkey dependency
QDEP_DEPENDS += Skycoder42/QHotkey@master
#SingleApplication dependency
DEFINES += QAPPLICATION_CLASS=QApplication
QDEP_DEPENDS += itay-grudev/SingleApplication@master
!load(qdep):error("Failed to load qdep feature, try running: qdep prfgen --qmake ~/Qt/$${QT_VERSION}/gcc_64/bin/qmake")


# Portaudio
unix:!macx: LIBS += -lportaudio -lrt -lm -lasound -ljack
win32: LIBS += -L$$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/lib/ -lportaudio
win32: INCLUDEPATH += $$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/include
win32: DEPENDPATH += $$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/include

#libsndfile
unix:!macx: LIBS += -lsndfile #-lmpg123 -lmp3lame
win32: LIBS += -L$$PWD/'../../../../../Program Files/Mega-Nerd/libsndfile/lib/' -llibsndfile-1
win32: INCLUDEPATH += $$PWD/'../../../../../Program Files/Mega-Nerd/libsndfile/include'
win32: DEPENDPATH += $$PWD/'../../../../../Program Files/Mega-Nerd/libsndfile/include'

#libsamplerate
unix:!macx: LIBS += -lsamplerate
win32: LIBS += -L$$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/lib/ -lsamplerate
win32: INCLUDEPATH += $$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/include
win32: DEPENDPATH += $$PWD/../../../../../Qt/$${QT_VERSION}/mingw73_64/include

RESOURCES += \
    res.qrc
