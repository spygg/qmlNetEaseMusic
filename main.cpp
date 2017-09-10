#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <musiclist.h>
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<MusicList>("an.qt.MusicList", 1, 0, "MusicList");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
