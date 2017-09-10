RC_FILE = myapp.rc

RC_ICONS = cloudmusic.ico

TEMPLATE = app

QT += qml quick multimedia
CONFIG += c++11

SOURCES += main.cpp \
    musiclist.cpp

RESOURCES += qml.qrc \
    src.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    musiclist.h

