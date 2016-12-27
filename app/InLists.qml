import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0
import "main.js" as Scripts


Item {

    property int type: 0

    id:window_container
    states: [
           State {
            name:"Show"

            PropertyChanges {
                target:window_container
                x:0
            }

        },
        State {
            name:"Hide"

            PropertyChanges {
                target:window_container
                x:parent.width
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
                property: "x"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

    ]

    onStateChanged: if(window_container.state == "Show") {if(type < 14) {Scripts.load_base()} else {
                            if(type != 50) {Scripts.load_gear(type)} else {Scripts.load_recipes("")} } } else {}

    MouseArea {
        anchors.fill: parent
        onClicked:console.log("caught")
    }

 Rectangle {
    anchors.fill:parent
    color:Qt.rgba(0.98,0.98,0.98,0.9)
 }

 Image {
     width:parent.width
     height:parent.height
     fillMode:Image.PreserveAspectCrop
     source:"graphics/atoms.svg"
     opacity:0.3
 }

 /*Bubbles {
     width:parent.width
     height:parent.height
     opacity:0.1
 } */


 Image {
     anchors.right:title.left
     source:"graphics/backing.svg"
     height:title.height
     anchors.verticalCenter: title.verticalCenter
     fillMode:Image.PreserveAspectFit
     rotation:90
     anchors.rightMargin: parent.width * 0.1

 }

 Rectangle {
     anchors.centerIn: title
     width:parent.width
     height:title.height
     color:Qt.rgba(1,1,1,0.7)
 }

 Text {
     id:title
     text:switch(type) {

          case 1:"Base";break;
          case 30:"Equipment";break;
          case 40:"Garnishes";break;
          case 50:"Recipes";break;
          }

     anchors.horizontalCenter: parent.horizontalCenter
     anchors.top:parent.top
     font.pixelSize: parent.height * 0.05
 }
 Image {
     anchors.left:title.right
     source:"graphics/backing.svg"
     height:title.height
     anchors.verticalCenter: title.verticalCenter
     fillMode:Image.PreserveAspectFit
     rotation:90
     anchors.leftMargin: parent.width * 0.1

 }

 Rectangle {
     anchors.top:title.bottom
     width:parent.width * 0.98
     height:parent.height * 0.005
     color:"gray"
     anchors.horizontalCenter: parent.horizontalCenter
 }


ListView {
    visible:if(type == 1) {true} else {false}
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:title.bottom
    anchors.topMargin:parent.height * 0.01
    anchors.bottom:parent.bottom
    anchors.bottomMargin:parent.height * 0.1
    clip:true
    width:parent.width * 0.9
    //height:parent.height * 0.8
    //spacing:parent.height * 0.01

    model:ListModel {
        id:castslist

    }

    delegate:
                Item {
                width:parent.width
                height:window_container.height * 0.08
                anchors.horizontalCenter: parent.horizontalCenter
                clip:true
                Rectangle {
                    id:thename
                    color:if(itemtype == "drink") {Qt.rgba(0.9,0.9,0.9,0.8)} else {"black"}
                    width:if(itemtype == "cast") {parent.width} else {parent.width * 0.9}
                    height:if(itemtype == "drink") {window_container.height * 0.07} else {window_container.height * 0.04 }
                    radius:5
                    border.width:1
                    anchors.verticalCenter: parent.verticalCenter

                    Text {

                        text:name
                        anchors.left:parent.left
                        anchors.leftMargin: parent.height * 0.1
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: parent.height * 0.7 - text.length
                        color:if(itemtype == "cast") {Qt.rgba(0.9,0.9,0.9,0.8)} else {"black"}
                    }


                    Image {
                        visible: if(itemtype == "cast") {false} else {true}
                        width:parent.height * 0.6
                        height:parent.height * 0.6
                        source:"graphics/remove.svg"
                        anchors.right:parent.right
                        anchors.rightMargin:parent.height * 0.1
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode:Image.PreserveAspectFit

                        Rectangle {
                            height:parent.height
                            width:parent.width * 0.06
                            anchors.right:parent.left
                            anchors.rightMargin: parent.height * 0.2
                            color:"gray"
                        }
                    }

                    MouseArea {
                        anchors.fill:parent
                        onClicked:{

                        }
                    }

                }

            }


    Rectangle {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        width:parent.height * 0.1
        height:parent.height * 0.1
        radius: width /2
        border.color: Qt.rgba(0.6,0.6,0.6,0.5)
        border.width:parent.height * 0.01
        color: Qt.rgba(0.9,0.9,0.9,0.9)

        Image {
            source:"graphics/add.svg"
            anchors.centerIn: parent
            width:parent.width * 0.5
            height:parent.width * 0.5
        }

        Text {
            visible:if(castslist.count == 0) {true} else {false}
            text:"To add click here -->"
            font.pixelSize: parent.height * 0.3
            anchors.right:parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill:parent

            onClicked: basetype.visible = true;
        }
    }


}


ListView {
    visible:if(type == 30) {true} else {false}
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:title.bottom
    anchors.topMargin:parent.height * 0.01
    anchors.bottom:parent.bottom
    anchors.bottomMargin:parent.height * 0.1
    clip:true
    width:parent.width * 0.9
    //height:parent.height * 0.8
    spacing:parent.height * 0.02


    model:ListModel {
        id:equipmentlist


    }

    delegate: Item {
        width:parent.width
        height:window_container.height * 0.06

        Rectangle {
            color:Qt.rgba(1,1,1,0.9)
            width:parent.width
            height:parent.height
            radius:5
            border.width:1

            Text {
                text:name
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height * 0.5
            }


            Image {
                width:parent.height * 0.6
                height:parent.height * 0.6
                source:if(name == "Add New") {"graphics/add.svg"} else {"graphics/remove.svg"}
                anchors.right:parent.right
                anchors.rightMargin:parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                fillMode:Image.PreserveAspectFit

                Rectangle {
                    height:parent.height
                    width:parent.width * 0.06
                    anchors.right:parent.left
                    anchors.rightMargin: parent.height * 0.2
                    color:"gray"
                }
            }
           /* MouseArea {
                anchors.fill:parent
                onClicked:window_container.state = "Hide",addnew.type = 11,addnew.state ="Show"
            } */




        }


    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        width:parent.height * 0.1
        height:parent.height * 0.1
        radius: width /2
        border.color: Qt.rgba(0.6,0.6,0.6,0.5)
        border.width:parent.height * 0.01
        color: Qt.rgba(0.9,0.9,0.9,0.9)

        Image {
            source:"graphics/add.svg"
            anchors.centerIn: parent
            width:parent.width * 0.5
            height:parent.width * 0.5
        }

        Text {
            visible:if(equipmentlist.count == 0) {true} else {false}
            text:"To add click here -->"
            font.pixelSize: parent.height * 0.3
            anchors.right:parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill:parent
            onClicked:window_container.state = "Hide",addnew.type = 30,addnew.state ="Show"
        }
    }

}


ListView {
    visible:if(type == 40) {true} else {false}
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:title.bottom
    anchors.topMargin:parent.height * 0.01
    anchors.bottom:parent.bottom
    anchors.bottomMargin:parent.height * 0.1
    clip:true
    width:parent.width * 0.9
    //height:parent.height * 0.8
    spacing:parent.height * 0.02


    model:ListModel {
        id:extraslist


    }

    delegate: Item {
        width:parent.width
        height:window_container.height * 0.06

        Rectangle {
           color:Qt.rgba(1,1,1,0.7)
            width:parent.width
            height:parent.height
            radius:5
            border.width:1

            Text {
                text:name
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height * 0.5
            }


            Image {
                width:parent.height * 0.6
                height:parent.height * 0.6
                source:if(name == "Add New") {"graphics/add.svg"} else {"graphics/remove.svg"}
                anchors.right:parent.right
                anchors.rightMargin:parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                fillMode:Image.PreserveAspectFit

                Rectangle {
                    height:parent.height
                    width:parent.width * 0.06
                    anchors.right:parent.left
                    anchors.rightMargin: parent.height * 0.2
                    color:"gray"
                }
            }




        }

       /* MouseArea {
            anchors.fill:parent
            onClicked:window_container.state = "Hide",addnew.type = 12,addnew.state ="Show"
        } */
    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        width:parent.height * 0.1
        height:parent.height * 0.1
        radius: width /2
        border.color: Qt.rgba(0.6,0.6,0.6,0.5)
        border.width:parent.height * 0.01
        color: Qt.rgba(0.9,0.9,0.9,0.9)

        Image {
            source:"graphics/add.svg"
            anchors.centerIn: parent
            width:parent.width * 0.5
            height:parent.width * 0.5
        }

        Text {
            visible:if(equipmentlist.count == 0) {true} else {false}
            text:"To add click here -->"
            font.pixelSize: parent.height * 0.3
            anchors.right:parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill:parent
            onClicked:window_container.state = "Hide",addnew.type = 40,addnew.state ="Show"
        }
    }

}

ListView {
    visible:if(type == 50) {true} else {false}
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:title.bottom
    anchors.topMargin:parent.height * 0.01
    anchors.bottom:parent.bottom
    anchors.bottomMargin:parent.height * 0.1
    clip:true
    width:parent.width * 0.9
    //height:parent.height * 0.8
    spacing:parent.height * 0.02


    model:ListModel {
        id:recipelist

    }

    delegate: Item {
        width:parent.width
        height:if(window_container.height * 0.36 < recipecolumn.height + recipecolumn.y) {(recipecolumn.height + recipecolumn.y) * 1.2}
               else { window_container.height * 0.36}
        clip:true
        Rectangle {
            color:Qt.rgba(1,1,1,0.9)
            width:parent.width
            height:parent.height
            radius:5
            border.width:1

            Text {
                id:drinkname
                text:name
                anchors.left:parent.left
                anchors.top:parent.top
                anchors.margins: parent.height * 0.01

                font.pixelSize: window_container.height * 0.04


            }


            Image {

                width:drinkname.height
                height:drinkname.height
                source:if(name == "Add New") {"graphics/add.svg"} else {"graphics/remove.svg"}
                anchors.right:parent.right
                anchors.top:parent.top
                anchors.rightMargin:parent.height * 0.01
                fillMode:Image.PreserveAspectFit

                Rectangle {
                    height:parent.height
                    width:parent.width * 0.06
                    anchors.right:parent.left
                    anchors.rightMargin: parent.height * 0.2
                    color:"gray"
                }
            }

            Rectangle {
                id:titleborder
                anchors.top:drinkname.bottom
                height:parent.height * 0.01
                width:parent.width
                anchors.left:parent.left

                color:"gray"
            }

            Column {
                id:recipecolumn
                anchors.top:titleborder.bottom
                anchors.topMargin:window_container.height * 0.01
                //anchors.bottom:parent.bottom
                width:parent.width *0.9
                anchors.horizontalCenter: parent.horizontalCenter
                spacing:window_container.height * 0.01

                Column {
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 1: "



                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                Text {
                    id:step1text
                    text:step1

                }



                }

                Column {
                    visible:if(step2 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 2: "


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                Text {
                    id:step2text
                    text:step2

                }



                }

                Column {
                    visible:if(step3 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 3: "


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                Text {
                    id:step3text
                    text:step3

                }



                }
                Column {
                    visible:if(step4 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 4: "


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                Text {
                    id:step4text
                    text:step4

                }



                }
                Column {
                    visible:if(step5 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 5: "


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                Text {
                    id:step5text
                    text:step5

                }



                }


            }
            Text {
                anchors.bottom:parent.bottom
                anchors.right:parent.right
                anchors.margins: parent.height * 0.05
                text:author
            }


        }


    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        width:parent.height * 0.1
        height:parent.height * 0.1
        radius: width /2
        border.color: Qt.rgba(0.6,0.6,0.6,0.5)
        border.width:parent.height * 0.01
        color: Qt.rgba(0.9,0.9,0.9,0.9)

        Image {
            source:"graphics/add.svg"
            anchors.centerIn: parent
            width:parent.width * 0.5
            height:parent.width * 0.5
        }

        Text {
            visible:if(equipmentlist.count == 0) {true} else {false}
            text:"To add click here -->"
            font.pixelSize: parent.height * 0.3
            anchors.right:parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill:parent
            onClicked:window_container.state = "Hide",addnew.type = 50,addnew.state ="Show"
        }
    }

}

Rectangle {
    anchors.bottom:backbutton.top
    anchors.bottomMargin: parent.height * 0.01
    width:parent.width * 0.98
    height:parent.height * 0.005
    color:"gray"
    anchors.horizontalCenter: parent.horizontalCenter
}

 Rectangle {
     id:backbutton
     anchors.bottom:parent.bottom
     anchors.right:parent.right
     anchors.margins: parent.height * 0.02
     height:parent.height * 0.06
     width:parent.height * 0.2
      border.width:1
      radius:8

      color:Qt.rgba(0.9,0.9,0.9,0.9)


      Text {
          anchors.centerIn: parent
          text:"Back"
          font.pixelSize: parent.height /2
      }

      MouseArea {
          anchors.fill:parent
          onClicked:inventory.state = "Show",window_container.state = "Hide"

      }
 }



 BaseList {
     id:basetype
     visible:false
     anchors.horizontalCenter: parent.horizontalCenter
     width:parent.width * 0.9
     height:parent.height * 0.8

 }



}
