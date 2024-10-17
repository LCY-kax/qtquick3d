QT += quick quick3d quick3d-private

TEMPLATE = app
TARGET = cluster_HUD

CONFIG += c++11 qtquickcompiler 

DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += \
        main.cpp \

RESOURCES += QML/qml.qrc \
            obj/obj.qrc \

QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =

DISTFILES += \
    README.md


