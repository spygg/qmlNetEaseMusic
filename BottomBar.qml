import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    height: 50;
    width: 1024;

    //分隔条
    Rectangle{
        id: upSeparator;
        width: parent.width;
        height:1;
        border.width: 1;
        anchors.top: parent.top;
        anchors.left: parent.left;
        color: "#E1E1E2";
    }

    //播放按钮
    Row{
        id: playBtns;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 20;

        //红色实心圆圈组件
        Component{
            id: redCircle;
            Rectangle{
                width: 40;
                height: 40;
                color: "#C62F2F";
                radius: 50;
            }
        }

        //上一首
        Loader{
            id: btnPre;
            width: 30;
            height: 30;
            anchors.verticalCenter: parent.verticalCenter;
            sourceComponent: redCircle;
            opacity: preArea.containsMouse ? 1.0 : 0.9;
            Image{
                anchors.centerIn: parent;
                source: "qrc:///bottomwidget/btnPrevious1.png";
                z: 1;
            }
            MouseArea{
                id: preArea;
                anchors.fill: parent;
                hoverEnabled: true;
            }
        }

        //播放
        Loader{
            id: btnPlay;
            width: 40;
            height: 40;
            anchors.verticalCenter: parent.verticalCenter;
            sourceComponent: redCircle;
            opacity: playArea.containsMouse ? 1.0 : 0.9;
            visible: false;
            Image{
                anchors.centerIn: parent;
                source: "qrc:///bottomwidget/btnPlay1.png";
                z: 1;
            }
            MouseArea{
                id: playArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onPressed:{
                    btnPause.visible = true;
                    btnPlay.visible = false;
                }
            }
        }

        //暂停
        Loader{
            id: btnPause;
            width: 40;
            height: 40;
            anchors.verticalCenter: parent.verticalCenter;
            sourceComponent: redCircle;
            opacity: pauseArea.containsMouse ? 1.0 : 0.9;
            Image{
                anchors.centerIn: parent;
                source: "qrc:///bottomwidget/btnPause1.png";
                z: 1;
            }
            MouseArea{
                id: pauseArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onPressed:{
                    btnPause.visible = false;
                    btnPlay.visible = true;
                }
            }
        }

        //下一首
        Loader{
            id: btnNext;
            width: 30;
            height: 30;
            anchors.verticalCenter: parent.verticalCenter;
            sourceComponent: redCircle;
            opacity: nextArea.containsMouse ? 1.0 : 0.9;
            Image{
                anchors.centerIn: parent;
                source: "qrc:///bottomwidget/btnNext1.png";
                z: 1;
            }
            MouseArea{
                id: nextArea;
                anchors.fill: parent;
                hoverEnabled: true;
            }
        }
    }

    //歌曲进度条
    RowLayout{
        id: playSlider;
        anchors.right: soundSlider.left;
        anchors.rightMargin: 20;
        anchors.left: playBtns.right;
        anchors.leftMargin: 20;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.bottom: parent.bottom;
        spacing: 10;

        Text{
            id: timeCount;
            anchors.verticalCenter: parent.verticalCenter;
            text: "00:00";
        }

        Slider{
            Layout.fillWidth: true;
            anchors.verticalCenter: parent.verticalCenter;
            style: SliderStyle{
                handle: Rectangle{
                    width: 16;
                    height: 16;
                    border.width: 1;
                    border.color: "#E1E1E2";
                    radius: 10;
                    Rectangle{
                        width: 4;
                        height: 4;
                        color: "red";
                        radius: 10;
                        anchors.centerIn: parent;
                    }
                }
            }
        }

        Text{
            id: timeAcount
            anchors.verticalCenter: parent.verticalCenter;
            text: "03:00";
        }
    }

    //音量进度条
    Row{
        id: soundSlider;
        anchors.right: playSequence.left;
        anchors.rightMargin: 25;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;
        Image{
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/menuVol.png";
            opacity: volArea.containsMouse ? 1.0 : 0.9;
            MouseArea{
                id: volArea;
                anchors.fill: parent;
                hoverEnabled: true;
            }
        }

        Slider{
            anchors.verticalCenter: parent.verticalCenter;
            width: 120;
//            MouseArea{
//                id: volHandleArea;
//                anchors.fill: parent;
//                hoverEnabled: true;

//            }
            style: SliderStyle{
                handle: Rectangle{
                    id: volHandle;
                    width: 16;
                    height: 16;
                    border.width: 1;
                    border.color: "#E1E1E2";
                    radius: 10;
//                    opacity: volHandleArea.containsMouse ? 1.0 : 0.0;
                    Rectangle{
                        width: 4;
                        height: 4;
                        color: "red";
                        radius: 10;
                        anchors.centerIn: parent;
                    }

                }
            }

        }
    }

    //歌曲播放顺序设置
    Row{
        id: playSequence;
        spacing: 14;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.right: parent.right;
        anchors.rightMargin: 20;

        //顺序播放
        Image{
            id: btnSequence;
            width: 20;
            height: 20;
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/listsequence.png";
            visible: true;
            opacity: sequenceArea.containsMouse ? 1.0 : 0.9;
            MouseArea{
                id: sequenceArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: {
                    btnSequence.visible = false;
                    btnCircle.visible = true;
                }
            }
        }

        //列表循环
        Image{
            id: btnCircle;
            width: 20;
            height: 20;
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/listcircle.png";
            visible: false;
            opacity: circleArea.containsMouse ? 1.0 : 0.9;
            MouseArea{
                id: circleArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: {
                    btnCircle.visible = false;
                    btnRandom.visible = true;
                }
            }
        }

        //列表随机
        Image{
            id: btnRandom;
            width: 20;
            height: 20;
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/listrandom.png";
            visible: false;
            opacity: randomArea.containsMouse ? 1.0 : 0.9;
            MouseArea{
                id: randomArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: {
                    btnRandom.visible = false;
                    btnSingle.visible = true;
                }
            }
        }

        //单曲循环
        Image{
            id: btnSingle;
            width: 20;
            height: 20;
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/listsingle.png";
            visible: false;
            opacity: singleArea.containsMouse ? 1.0 : 0.9;
            MouseArea{
                id: singleArea;
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: {
                    btnSingle.visible = false;
                    btnSequence.visible = true;
                }
            }
        }

        //歌词
        Image{
            id: btnLrc;
            width: 20;
            height: 20;
            anchors.verticalCenter: parent.verticalCenter;
            source: "qrc:///bottomwidget/menuLrc.png";
            opacity: lrcArea.containsMouse ? 1.0 : 0.8;
            MouseArea{
                id: lrcArea;
                anchors.fill: parent;
                hoverEnabled: true;
            }
        }

        //歌曲列表按钮
        Rectangle{
            id: btnList;
            width: 50;
            height: 18;
            anchors.verticalCenter: parent.verticalCenter;
            color: "#E1E1E2";
            radius: 10;
            Image{
                width: 20;
                height: 20;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                z: 1;
                source: "qrc:///bottomwidget/btnlist.png";
                opacity: lrcListArea.containsMouse ? 1.0 : 0.8;
                MouseArea{
                    id: lrcListArea;
                    anchors.fill: parent;
                    hoverEnabled: true;
                }
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter;
                anchors.right: parent.right;
                anchors.rightMargin: 10;
                text: "32";
                z: 1;
            }
        }
    }
}
