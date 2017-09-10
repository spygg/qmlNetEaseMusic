import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button{
    id: rootItem;
    width: 200;
    height: 34;
    property var myText: null;
    property var source: null;

    focus: true;
    MouseArea{
        id: mouseArea;
        anchors.fill: parent;
        hoverEnabled: true;
    }
    style: ButtonStyle{
        background: Rectangle{
            implicitWidth: 100;
            implicitHeight: 30;
            color: mouseArea.containsMouse ? "#E6E7EA" : "#F5F5F7";
            Row{
                height: parent.height;
                anchors.top: parent.top;
                anchors.left: parent.left;
                spacing: 10;
                Rectangle{
                    width: 2;
                    height: 30;
                    color: "red";
                    opacity: mouseArea.containsMouse ? 1.0 : 0.0;
                }

                Image{
                    id: btnIcon;
                    width: 20;
                    height: 20;
                    anchors.verticalCenter: parent.verticalCenter;
                    source: rootItem.source;
                    opacity: mouseArea.containsMouse ? 1.0 : 0.7;
                }

                Text{
                    id: btnText
                    anchors.verticalCenter: parent.verticalCenter;
                    opacity: mouseArea.containsMouse ? 1.0 : 0.7;
                    text: rootItem.myText;
                }
            }


        }
    }
}
