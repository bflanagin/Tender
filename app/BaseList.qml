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

       /* model: ListModel {

            ListElement {
                name:"Absinthe"
                casttype:1
            }

       ListElement {
                name:"Beer"
                casttype:2
            }

       ListElement {
            name:"Burbon"
            casttype:3
        }
        ListElement {
            name:"Brandy"
            casttype:4
        }

        ListElement {
            name:"Champagne"
            casttype:5
        }

        ListElement {
            name:"Gin"
            casttype:6
        }

        ListElement {
            name:"Liqueur"
            casttype:7
        }
        ListElement {
            name:"Moonshine"
            casttype:8
        }
        ListElement {
            name:"Rum"
            casttype:9
        }
        ListElement {
            name:"Scotch"
            casttype:10
        }

        ListElement {
            name:"Tequila"
            casttype:11
        }
        ListElement {
            name:"Vodka"
            casttype:12
        }
        ListElement {
            name:"Wine"
            casttype:13
        }
        ListElement {
            name:"Wiskey"
            casttype:14
        }

        } */

        model:bases.split(",")

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
                        text:bases.split(",")[index]
                        font.pixelSize: parent.height * 0.4
                    }

                    MouseArea {
                        anchors.fill:parent
                       // onClicked:switch (dialog)  {
                       //           case 1:if(type != 99) {equipselected = name,window_container.visible = false} else {window_container.visible = false};break;
                        //          default:if(type != 99) {equipname = name,window_container.visible = false} else {window_container.visible = false}break;
                         //       }

                        onClicked: window_container.visible = false,addnew.type = index,addnew.state = "Show",supplies.state = "Hide"


                       }

                }


        }
    }


}

}
