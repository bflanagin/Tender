import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0
import "main.js" as Scripts

Item {
    id:window_container

    property int dialog: 0
    property string selected: " "
    property int selectedindex: 99

    onVisibleChanged: if(visible == true) {Scripts.create_list("","equip");}

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
            id:fullist
        }


        delegate: Item {
                        width:parent.width
                        height:window_container.height * 0.1

                Rectangle {
                    anchors.centerIn: parent
                    //width:parent.width * 0.90
                    height:parent.height * 0.95
                    //radius:5
                    color:if(type == 0) {Qt.rgba(0.7,0.8,0.8,0.98)} else {Qt.rgba(0.9,0.9,0.9,0.98)}
                    width:if(type == 0) {parent.width * 0.96} else { parent.width * 0.96}

                    Text {
                        anchors.centerIn: parent
                        text:if(type == 0) {ingredient} else {ingredient.split("^")[1]}
                        font.pixelSize: parent.height * 0.4
                    }

                    MouseArea {
                        anchors.fill:parent
                        /*onClicked:switch (dialog)  {
                                  case 1:if(type != 99) {equipselected = name,window_container.visible = false} else {window_container.visible = false};break;
                                  default:if(type != 99) {equipname = name,window_container.visible = false} else {window_container.visible = false}break;
                                } */

                        onClicked: equipselected = ingredient, window_container.visible = false


                       }

                }


        }
    }



}

}
