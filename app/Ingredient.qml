import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0

Item {
    id:window_container

    property int dialog: 0
    property string selected: " "
    property int selectedindex: 99

    //onVisibleChanged: if(visible == true) {selected = " "}

Rectangle {
    id:equiplist
    //visible: false
    radius:4
    width:parent.width * 0.8
    height:parent.height * 0.9
    anchors.centerIn: parent
    border.color:Qt.rgba(0.6,0.6,0.6,0.5)
    border.width:parent.height * 0.01
    color:Qt.rgba(0.9,0.9,0.9,0.9)


    ListView {
        anchors.top:parent.top
        anchors.margins:parent.height * 0.02
        anchors.bottom:parent.bottom
        width:parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing:parent.height * 0.01

        clip:true

        model:ListModel {

            ListElement {
                name:"stir rod"
                type:0

            }
            ListElement {
                name:"Shot Glass"
                type:1

            }
            ListElement {
                name:"8oz Glass"
                type:2

            }
            ListElement {
                name:"12oz Glass"
                type:3

            }
            ListElement {
                name:"Bronze Mug"
                type:4

            }
            ListElement {
                name:"Tumbler"
                type:5
            }

            ListElement {
                name:"Strainer"
                type:6
            }

            ListElement {
                name:"Cancel"
                type:99
            }


        }


        delegate: Item {
                        width:parent.width
                        height:window_container.height * 0.1

                Rectangle {
                    anchors.centerIn: parent
                    width:parent.width * 0.90
                    height:parent.height * 0.95
                    radius:5
                    color:"white"

                    Text {
                        anchors.centerIn: parent
                        text:name
                        font.pixelSize: parent.height * 0.4
                    }

                    MouseArea {
                        anchors.fill:parent
                        onClicked:switch (dialog)  {
                                  case 1:if(type != 99) {equipselected = name,window_container.visible = false} else {window_container.visible = false};break;
                                  default:if(type != 99) {equipname = name,window_container.visible = false} else {window_container.visible = false}break;
                                }


                       }

                }


        }
    }



}

}
