import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0
import "main.js" as Scripts
import "openseed.js" as OpenSeed


Item {
    id:window_container
    clip:true

    property string selected:""

    states: [
           State {
            name:"Show"

            PropertyChanges {
                target:window_container
                y:0

            }

        },
        State {
            name:"Hide"

            PropertyChanges {
                target:window_container
                y:parent.height
            }

        }
    ]

    transitions: [

        Transition {
            from: "Hide"
            to: "Show"
            reversible: true


            NumberAnimation {
                target: window_container
                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

    ]

    MouseArea {
        anchors.fill: parent
        onClicked:console.log("caught")
    }

state:"Hide"

onStateChanged: if(state == "Show") {Scripts.create_list("","all")}



Rectangle {
    anchors.fill:parent
    color:Qt.rgba(1,1,1,0.98)
    border.color:"#404040"
    border.width:4
    radius:4
}

Text {
    text:"Filter"
    id:title
    anchors.horizontalCenter: parent.horizontalCenter
    font.pixelSize: parent.height * 0.07
    anchors.top:parent.top
    anchors.topMargin:parent.height * 0.01
}

Rectangle {
    anchors.right:parent.right
    anchors.top:parent.top
    anchors.topMargin:parent.height * 0.01
    anchors.rightMargin: parent.height * 0.01
    width:title.height
    height:title.height
    clip:true

    Image {
        anchors.centerIn: parent
            source:"graphics/add.svg"
        fillMode: Image.PreserveAspectFit
        width:parent.width * 0.5
        height:parent.height * 0.5
        rotation:45
    }

    MouseArea {
        anchors.fill: parent
        onClicked:window_container.state = "Hide"
    }

}

Rectangle {
    id:titlebottom
    anchors.top:title.bottom
    width:parent.width * 0.98
    anchors.horizontalCenter: parent.horizontalCenter
    height:parent.height * 0.005
    color:"black"

}



ListView {
    anchors.top:titlebottom.bottom
    anchors.margins:parent.height * 0.01
    anchors.bottom:cltop.top
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

                    onClicked: {if(type != 0) {selected =ingredient.split("^")[1],  confirm.visible = true;}
                    }

                   }

            }


    }
}

Rectangle {
    id:cltop
    anchors.bottom:currentlistview.top
    width:parent.width * 0.98
    anchors.horizontalCenter: parent.horizontalCenter
    height:parent.height * 0.005
    color:"black"

}

GridView {
    id:currentlistview
    anchors.bottom:parent.bottom
    anchors.left:parent.left
    width:parent.width
    height:window_container.height * 0.06
    clip:true
    cellWidth:window_container.width * 0.33

    flow:GridView.FlowTopToBottom

    model:currentlist.split(",")

    delegate: Item {
                anchors.verticalCenter: parent.verticalCenter
                width:currentlistview.cellWidth
                height:currentlistview.height * 0.9

                Rectangle {
                    anchors.centerIn: word
                    color:"#404040"
                    radius:height /2
                    width:word.width * 1.3
                    height:parent.height * 0.9

                }

            Text {

                id:word
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                width:window_container.width * 0.25
                text:if(currentlist.split(",")[index] != "") {currentlist.split(",")[index]} else {"..."}
                color:"white"
                font.pixelSize: (parent.height * 0.7) - text.length
                //clip:true
            }



    }

}



Item {
    id:confirm
    visible:false

    width:parent.width * 0.85
    height:parent.height * 0.20
    anchors.centerIn: parent

    MouseArea {
        anchors.fill:parent
        onClicked:console.log("")
    }

    Rectangle {
        anchors.fill:parent
        border.color: "#404040"
        radius:3
        border.width:3
    }

    Text {
        id:confirmtitle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin:parent.height * 0.04
        font.pixelSize: (parent.height * 0.2) - selected.length
        text:"Add "+selected+" to list"
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.98
        height:parent.height * 0.03
        anchors.top:confirmtitle.bottom
        color:"#404040"

    }

    Item {
        anchors.top:confirmtitle.bottom
        anchors.topMargin:parent.height * 0.15
        width:parent.width
        anchors.left:parent.left
        anchors.leftMargin:parent.height * 0.6

        CheckBox {
            id:addstock
            checked:false
        }
        Text {
            anchors.left:addstock.right
            text:"Add item to Stock"
        }
    }


    Rectangle {
        id:okaybutton
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.3
        width:parent.height * 0.6
         border.width:1
         radius:5

         color:Qt.rgba(0.9,0.9,0.9,0.7)


         Text {
             anchors.centerIn: parent
             text:"Okay"
             font.pixelSize: parent.height /2
         }

         MouseArea {
             anchors.fill:parent
             onClicked:Scripts.add_currentlist(selected),confirm.visible = false,selected = ""
         }

    }


    Rectangle {
        id:cancelbutton
        anchors.bottom:parent.bottom
        anchors.left:parent.left
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.3
        width:parent.height * 0.6
         border.width:1
         radius:5

         color:Qt.rgba(0.9,0.9,0.9,0.7)


         Text {
             anchors.centerIn: parent
             text:"Cancel"
             font.pixelSize: parent.height /2
         }

         MouseArea {
             anchors.fill:parent
             onClicked:confirm.visible = false,selected = ""
         }

    }

}


}
