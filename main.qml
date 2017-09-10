import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "myJs.js" as Js

Window {
    id: mainWindow
    width: 1026;
    height: 672;

    flags: Qt.Window | Qt.FramelessWindowHint;
    visible: true
    color: "#666666";


    Rectangle{
        anchors.centerIn: parent;
        width: parent.width - 2;
        height: parent.height - 2;

        //标题部分
        TitleBar{
            id: titleBar;
            mainWindow: mainWindow;
            width: parent.width;
            height: 50;
        }

        //主体部分
        MainWidget{
            anchors.top: titleBar.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.bottom:parent.bottom;
        }

    }
}




