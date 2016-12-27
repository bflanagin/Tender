import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0

import QtGraphicalEffects 1.0

import "main.js" as Scripts

Item {
    id:window_container

    property string currentlist: ""

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

    MouseArea {
        anchors.fill: parent
        onClicked:console.log("caught")
    }

state:"Hide"

onStateChanged: if(state == "Show") {Scripts.load_recipes(currentlist)}



Rectangle {
    anchors.fill:parent
    color:Qt.rgba(1,1,1,0.7)
}

/*Bubbles {
    width:parent.width
    height:parent.height
    opacity:0.1
} */

Rectangle {
    anchors.top:parent.top
    anchors.left:parent.left
    anchors.right:parent.right
    height:titleborder.y
    color:Qt.rgba(1,1,1,0.9)
}

Image {
    anchors.right:title.left
    source:"graphics/backing.svg"
    height:title.height
    anchors.verticalCenter: title.verticalCenter
    fillMode:Image.PreserveAspectFit
    rotation:90
    anchors.rightMargin: parent.width * 0.03

}


Text {
    id:title
    text:"Drinks"

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:parent.top
    anchors.topMargin: window_container.height * 0.01
    font.pixelSize: parent.height * 0.05
}
Image {
    anchors.left:title.right
    source:"graphics/backing.svg"
    height:title.height
    anchors.verticalCenter: title.verticalCenter
    fillMode:Image.PreserveAspectFit
    rotation:90
    anchors.leftMargin: parent.width * 0.03

}

Rectangle {
    anchors.verticalCenter: title.verticalCenter

    anchors.right:parent.right
    anchors.rightMargin: parent.height * 0.01

    height:title.height * 0.9
    width:title.height * 0.9
    border.color: "gray"
    radius:5
    color:Qt.rgba(1,1,1,0.4)

    Image {
        anchors.centerIn: parent
        source:"graphics/find.svg"
        width:parent.width * 0.9
        height:parent.height * 0.9
    }

MouseArea {
    anchors.fill: parent
    onClicked:filters.state = "Show"
}

}

Rectangle {
    anchors.verticalCenter: title.verticalCenter

    anchors.left:parent.left
    anchors.leftMargin: parent.height * 0.01

    height:title.height * 0.9
    width:menuicon.width + sorttext.width * 1.3
    border.color: "gray"
    radius:5
    color:Qt.rgba(1,1,1,0.4)

    Image {
        id:menuicon
        anchors.verticalCenter:parent.verticalCenter
        anchors.left:parent.left
        source:"graphics/contextual-menu.svg"
       // width:parent.width * 0.9
        height:parent.height * 0.9


    }

    Text {
        id:sorttext
        anchors.verticalCenter: parent.verticalCenter
        anchors.left:menuicon.right
        text:if(currentlist == "") {"All"} else {"Avail"}
        font.pixelSize: parent.height * 0.7
    }

    MouseArea {
        anchors.fill: parent
        onClicked: if(sorttext.text == "Avail") {Scripts.load_recipes(""),sorttext.text = "All"} else {Scripts.load_recipes(currentlist),sorttext.text = "Avail"}
    }



}

Rectangle {
    id:titleborder
    anchors.top:title.bottom
    anchors.topMargin: window_container.height * 0.01
    width:parent.width * 0.98
    height:parent.height * 0.005
    color:"gray"
    anchors.horizontalCenter: parent.horizontalCenter
}


ListView {

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:titleborder.bottom
    //anchors.topMargin:parent.height * 0.01
    anchors.bottom:parent.bottom
    //anchors.bottomMargin:parent.height * 0.1
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
            id:recipecard
            color:Qt.rgba(1,1,1,1)
            width:parent.width
            height:parent.height
            radius:5
            border.width:1


            Image {
                source:"graphics/backing.svg"
                anchors.bottom:parent.bottom
                anchors.bottomMargin:-parent.height * 0.2
                anchors.left:parent.horizontalCenter
                rotation:35
                opacity:0.14
                width:parent.width * 0.8
                height:parent.width * 0.8
                fillMode:Image.PreserveAspectCrop
            }



            Text {
                id:drinkname
                text:name
                anchors.left:parent.left
                anchors.top:parent.top
                anchors.margins: parent.height * 0.01

                font.pixelSize: window_container.height * 0.04


            }



            Rectangle {
                id:dtitleborder
                anchors.top:drinkname.bottom
                height:parent.height * 0.01
                width:parent.width
                anchors.left:parent.left

                color:"gray"
            }

            Column {
                id:recipecolumn
                anchors.top:dtitleborder.bottom
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
                    font.pixelSize: window_container.height * 0.03


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                ListView {
                    width:parent.width
                    height:contentHeight
                    clip:true
                    spacing:window_container.height * 0.008

                    model:step1.split("\n").length

                    delegate: Row {
                        spacing:window_container.height * 0.005

                        Image {
                            height:step1text.height
                            width:step1text.height
                            opacity: 0.4
                            source:switch(step1.split("\n")[index].split("^")[0]) {
                                   case "e":"graphics/equip.svg";break;
                                   case "d":"graphics/liquids.svg";break;
                                   case "act":"graphics/settings.svg";break;
                                   case "a":"graphics/extras.svg";break;

                                   default:"graphics/extras.svg";break;
                                   }
                        }

                        Text {
                        id:step1text
                        text:step1.split("\n")[index].split("^")[1]
                        font.pixelSize: window_container.height * 0.02

                    }

                    }



                }



                }

                Column {
                    visible:if(step2 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 2: "
                    font.pixelSize: window_container.height * 0.03


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                ListView {
                    width:parent.width
                    height:contentHeight
                    clip:true
                    spacing:window_container.height * 0.008

                    model:step2.split("\n").length

                    delegate: Row {
                        spacing:window_container.height * 0.005

                        Image {
                            height:step2text.height
                            width:step2text.height
                            opacity: 0.4
                            source:switch(step2.split("\n")[index].split("^")[0]) {
                                   case "e":"graphics/equip.svg";break;
                                   case "d":"graphics/liquids.svg";break;
                                   case "act":"graphics/settings.svg";break;
                                   case "a":"graphics/extras.svg";break;

                                   default:"graphics/extras.svg";break;
                                   }
                        }

                        Text {
                        id:step2text
                        text:step2.split("\n")[index].split("^")[1]
                        font.pixelSize: window_container.height * 0.02

                    }

                    }



                }



                }

                Column {
                    visible:if(step3 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 3: "
                    font.pixelSize: window_container.height * 0.03


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                ListView {
                    width:parent.width
                    height:contentHeight
                    clip:true
                    spacing:window_container.height * 0.008

                    model:step3.split("\n").length

                    delegate: Row {
                        spacing:window_container.height * 0.005

                        Image {
                            height:step3text.height
                            width:step3text.height
                            opacity: 0.4
                            source:switch(step3.split("\n")[index].split("^")[0]) {
                                   case "e":"graphics/equip.svg";break;
                                   case "d":"graphics/liquids.svg";break;
                                   case "act":"graphics/settings.svg";break;
                                   case "a":"graphics/extras.svg";break;

                                   default:"graphics/extras.svg";break;
                                   }
                        }

                        Text {
                        id:step3text
                        text:step3.split("\n")[index].split("^")[1]
                        font.pixelSize: window_container.height * 0.02

                    }

                    }



                }



                }
                Column {
                    visible:if(step4 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 4: "
                    font.pixelSize: window_container.height * 0.03


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                ListView {
                    width:parent.width
                    height:contentHeight
                    clip:true
                    spacing:window_container.height * 0.008

                    model:step4.split("\n").length

                    delegate: Row {
                        spacing:window_container.height * 0.005

                        Image {
                            height:step4text.height
                            width:step4text.height
                            opacity: 0.4
                            source:switch(step4.split("\n")[index].split("^")[0]) {
                                   case "e":"graphics/equip.svg";break;
                                   case "d":"graphics/liquids.svg";break;
                                   case "act":"graphics/settings.svg";break;
                                   case "a":"graphics/extras.svg";break;

                                   default:"graphics/extras.svg";break;
                                   }
                        }

                        Text {
                        id:step4text
                        text:step4.split("\n")[index].split("^")[1]
                        font.pixelSize: window_container.height * 0.02

                    }

                    }



                }



                }
                Column {
                    visible:if(step5 != " ") {true} else {false}
                    width:parent.width
                    spacing:window_container.height * 0.01

                Text {
                    //id:step1text
                    text:"Step 5: "
                    font.pixelSize: window_container.height * 0.03


                }
                Rectangle {
                    //id:titleborder
                    //anchors.top:drinkname.bottom
                    height:window_container.height * 0.002
                    width:parent.width
                    //anchors.left:parent.left

                    color:"gray"
                }


                ListView {
                    width:parent.width
                    height:contentHeight
                    clip:true
                    spacing:window_container.height * 0.008

                    model:step5.split("\n").length

                    delegate: Row {
                        spacing:window_container.height * 0.005

                        Image {
                            height:step5text.height
                            width:step5text.height
                            opacity: 0.4
                            source:switch(step5.split("\n")[index].split("^")[0]) {
                                   case "e":"graphics/equip.svg";break;
                                   case "d":"graphics/liquids.svg";break;
                                   case "act":"graphics/settings.svg";break;
                                   case "a":"graphics/extras.svg";break;

                                   default:"graphics/extras.svg";break;
                                   }
                        }

                        Text {
                        id:step5text
                        text:step5.split("\n")[index].split("^")[1]
                        font.pixelSize: window_container.height * 0.02

                    }

                    }



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

        Rectangle {
            id:precentsticker
            radius: width /2
            width:window_container.height * 0.02 + percentavail.width
            height:window_container.height * 0.02 + percentavail.width

            border.color:"goldenrod"
            border.width: 3
            color:"white"
            anchors.top:parent.top
            anchors.right:parent.right
            anchors.margins: window_container.height * 0.002
            rotation: 15

            Text {
                id:percentavail
                anchors.centerIn: parent
                text: percentavailable+"%"
                color:"white"
                font.pixelSize: window_container.height * 0.03
                style:Text.Outline
                styleColor: "black"
            }
        }

        DropShadow {
               anchors.fill: precentsticker
               horizontalOffset: -2
               verticalOffset: 3
               radius: 8.0
               samples: 4
               color: "#80000000"
               source: precentsticker
               rotation: 15
           }

        MouseArea {
            anchors.fill:parent
            onClicked: console.log("")
        }
    }


}

Rectangle {
    anchors.bottom:parent.bottom
    anchors.right:parent.right
    anchors.margins: parent.height * 0.01
    height:parent.height * 0.06
    width:parent.height * 0.15
     border.width:1
     radius:8

     color:Qt.rgba(0.8,0.8,0.8,0.8)


     Text {
         anchors.centerIn: parent
         text:"Back"
         font.pixelSize: parent.height /2
     }

     MouseArea {
         anchors.fill:parent
         onClicked:window_container.state = "Hide"
         enabled:if(window_container.state =="Show") {true} else {false}
     }
}


Search {
    id:filters

    anchors.horizontalCenter: parent.horizontalCenter
    y:parent.height * 0.01
    width:parent.width * 0.99
    height:parent.height
   state:"Hide"
   onStateChanged: if(state == "Hide") {Scripts.load_recipes(currentlist)}

}

}
