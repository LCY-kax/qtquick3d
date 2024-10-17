#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick3D/private/qquick3dviewport_p.h> //3d
//#include <QtQuick3D/QQuick3DView> // QT 5.15版本包含Qt Quick 3D视图类的头文件
//#include <QtQuick3D/QQuick3DScene> // QT 5.15版本包含Qt Quick 3D场景类的头文件
//#include <QtQuick3D/QQuick3DModel> // QT 5.15版本包含Qt Quick 3D模型类的头文件
#include <QtQuick3D>
//#include <QtQuick3D/qquick3d.h>  //qt 6.7.1

#include <QQmlContext>
#include <QObject>
#include <QQuickView>


int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

//添加渲染引擎

//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QSurfaceFormat::setDefaultFormat(QQuick3DViewport::idealSurfaceFormat());
//    QQuick3DViewport::setDefaultSurfaceFormat(QQuick3DViewport::idealSurfaceFormat()); //QT 5.15版本

//    QSurfaceFormat format;
//    format.setRenderableType(QSurfaceFormat::OpenGL);
//    format.setProfile(QSurfaceFormat::CoreProfile);
//    format.setVersion(3, 3); // 设置OpenGL的版本号
//    format.setDepthBufferSize(24); // 设置深度缓冲区大小

//    QQuickView view;
//    view.setFormat(format);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}

