import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0
import "main.js" as Scripts
import "openseed.js" as OpenSeed

Item {
    property int type: 0
    property int numofdrinks: 0
    property int bottlesused:0
    property int ouncesPoored:0
    property int bottlesleft:0
    property int ounces: 0
    property string drinkname:" "
    property string flavor:" "
    property string equipname:" "
    property int numofequipment: 0
    property string extraname:" "
    property int numofextra: 0
    property string equipselected: " "
    property int currentstep: 0
    property string step1: " "
    property string step2: " "
    property string step3: " "
    property string step4: " "
    property string step5: " "
    property string author: "system"

    property string thelist:""



    property string recipename: " "

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
                x:window_container.width
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

    onStateChanged: if(window_container.state == "Show") {clearall();}


    Rectangle {
        anchors.fill:parent
        radius: 4
        //border.width:5
        //border.color: Qt.rgba(0.6,0.6,0.6,0.3)
        color:Qt.rgba(0.97,0.97,0.97,0.9)

    }

    Image {
        width:parent.width
        height:parent.height
        fillMode:Image.PreserveAspectCrop
        source:"graphics/atoms.svg"
        opacity:0.2
    }

    MouseArea {
        anchors.fill: parent
        onClicked:console.log("caught")
    }


    Rectangle {
        anchors.centerIn: title
        width:parent.width
        height:title.height
        color:Qt.rgba(1,1,1,0.7)
    }

    Image {
        anchors.right:title.left
        source:"graphics/backing.svg"
        height:title.height
        anchors.verticalCenter: title.verticalCenter
        fillMode:Image.PreserveAspectFit
        rotation:90
        anchors.rightMargin: parent.width * 0.1

    }

    Text {
        id:title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top

        text:if(type < 30) {bases.split(",")[type]} else {
                 switch(type) {
                              case 30:"Equipment";break;
                              case 40:"Extras";break;
                              case 50:"Recipe";break;
                              default:"Where am I";break;

                              }
             }

        font.pixelSize: parent.height * 0.07
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
        color:"#202020"
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Column {
        visible:if(type <= 29) {true} else {false}
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:title.bottom
        anchors.topMargin:parent.height * 0.04
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height * 0.01
        width:parent.width * 0.9
        spacing: parent.height * 0.03

        Rectangle {
            width:parent.width
            height:window_container.height * 0.1
            radius:5
             color:Qt.rgba(0.9,0.9,0.9,0.9)
            border.width:5
            border.color: Qt.rgba(0.6,0.6,0.6,0.3)

            Text {
                text:if(drinkname == " " || drinkname == "") {"Brand Name"} else {drinkname}
                font.pixelSize: window_container.height * 0.05
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
            }

            Rectangle {
                id:editsavename
                width:parent.height * 0.6
                height:parent.height * 0.6
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.1
                color:Qt.rgba(0.6,0.6,0.6,0.3)
                border.width:1
                Image {
                    anchors.centerIn: parent
                    width:parent.width * 0.8
                    height:parent.height * 0.8
                    source:if(nameedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                }

            }

            MouseArea {
                anchors.fill:parent
                onClicked:if(nameedit.visible == false ) {nameedit.visible = true} else {nameedit.visible = false}
            }

            TextField {
                id:nameedit
                visible:false
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:editsavename.left
                anchors.rightMargin:parent.height * 0.08
                //width:parent.width * 0.88
                height:parent.height * 0.8
                onTextChanged: drinkname = text

            }

        }

        Rectangle {
            width:parent.width * 0.8
            height:window_container.height * 0.1
            radius:5
             color:Qt.rgba(0.9,0.9,0.9,0.8)
            border.width:5
            border.color: Qt.rgba(0.6,0.6,0.6,0.3)
            visible:if(drinkname.length > 1 && nameedit.visible == false && bases.split(",")[type] == "Liqueur") {true} else {false}

            Text {

                text:if(flavor == " ") {"Straight"} else {flavor}
                font.pixelSize: window_container.height * 0.05
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                onTextChanged: flavor = text
            }

            Rectangle {

                id:editsaveflavor

                width:parent.height * 0.6
                height:parent.height * 0.6
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.1
                color:Qt.rgba(0.6,0.6,0.6,0.3)
                border.width:1
                Image {
                    anchors.centerIn: parent
                    width:parent.width * 0.8
                    height:parent.height * 0.8
                    source:if(ouncesedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                }


            }

            MouseArea {
                anchors.fill:parent
                //onClicked:if(ouncesedit.visible == false ) {ouncesedit.visible = true} else {ouncesedit.visible = false}
            }

           /* TextField {
                id:ouncesedit
                visible:false
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:editsaveounces.left
                anchors.rightMargin:parent.height * 0.08
                //width:parent.width * 0.88
                height:parent.height * 0.8
                onTextChanged: ounces = text

            } */

        }


        Rectangle {
            width:parent.width * 0.5
            height:window_container.height * 0.1
            radius:5
             color:Qt.rgba(0.9,0.9,0.9,0.8)
            border.width:5
            border.color: Qt.rgba(0.6,0.6,0.6,0.3)
            visible:if(drinkname.length > 1 && nameedit.visible == false) {true} else {false}

            Text {
                text:if(ounces == 0) {0+" Oz"} else {ounces+" Oz"}
                font.pixelSize: window_container.height * 0.05
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                onTextChanged: if(ounces > 0) {if(bottlesleft == 0) { bottlesleft = 1} }
            }

            Rectangle {

                id:editsaveounces

                width:parent.height * 0.6
                height:parent.height * 0.6
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.1
                color:Qt.rgba(0.6,0.6,0.6,0.3)
                border.width:1
                Image {
                    anchors.centerIn: parent
                    width:parent.width * 0.8
                    height:parent.height * 0.8
                    source:if(ouncesedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                }


            }

            MouseArea {
                anchors.fill:parent
                onClicked:if(ouncesedit.visible == false ) {ouncesedit.visible = true} else {ouncesedit.visible = false}
            }

            TextField {
                id:ouncesedit
                visible:false
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:editsaveounces.left
                anchors.rightMargin:parent.height * 0.08
                //width:parent.width * 0.88
                height:parent.height * 0.8
                onTextChanged: ounces = text

            }

        }

        Rectangle {
            id:savebottles
            width:parent.width * 0.8
            height:window_container.height * 0.1
            radius:5
             color:Qt.rgba(0.9,0.9,0.9,0.8)
            border.width:5
            border.color: Qt.rgba(0.6,0.6,0.6,0.3)
            visible:if(ounces > 1 && ouncesedit.visible == false) {true} else {false}

            Text {
                text:if(bottlesleft == 0) {0+" Bottles"} else {bottlesleft+" Bottles"}
                font.pixelSize: window_container.height * 0.05
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
            }

            Rectangle {

                id:editsavebottles

                width:parent.height * 0.6
                height:parent.height * 0.6
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.1
                color:Qt.rgba(0.6,0.6,0.6,0.3)
                border.width:1
                Image {
                    anchors.centerIn: parent
                    width:parent.width * 0.8
                    height:parent.height * 0.8
                    source:if(bottlessedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                }


            }

            MouseArea {
                anchors.fill:parent
                onClicked:if(bottlessedit.visible == false ) {bottlessedit.visible = true} else {bottlessedit.visible = false}
            }

            TextField {
                id:bottlessedit
                visible:false
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:editsavebottles.left
                anchors.rightMargin:parent.height * 0.08
                //width:parent.width * 0.88
                height:parent.height * 0.8
                onTextChanged: bottlesleft = text

            }

        }


        Row {
            visible:if(bottlesleft > 0 && savebottles.visible == true ) {true} else {false}
            width:parent.width
            height:parent.height - y


            Column {
                y:parent.height * 0.03
                width:parent.width / 2
                height:parent.height
                spacing:parent.height * 0.05

                Text {
                    text:"Drinks Made: "+numofdrinks
                    font.pixelSize: parent.height * 0.05
                }
                Text {
                    text:"Bottles Used: "+bottlesused
                    font.pixelSize: parent.height * 0.05
                }
                Text {
                    text:"Ounces Poored: "+ouncesPoored
                    font.pixelSize: parent.height * 0.05
                }
                Text {
                    text:"Bottles Left: "+bottlesleft
                    font.pixelSize: parent.height * 0.05
                }
            }


        Rectangle {
            height:parent.height * 0.7
            width:parent.height * 0.01
            color:"gray"
        }

        }

    }


        Column {
            visible:if(type == 30) {true} else {false}
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:title.bottom
            anchors.topMargin:parent.height * 0.04
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height * 0.01
            width:parent.width * 0.9
            spacing: parent.height * 0.03

            Rectangle {
                width:parent.width
                height:window_container.height * 0.1
                radius:5
                 color:Qt.rgba(0.9,0.9,0.9,0.8)
                border.width:5
                border.color: Qt.rgba(0.6,0.6,0.6,0.3)

                Text {
                    text:if(equipname == " " || equipname == "") {"Type"} else {equipname}
                    font.pixelSize: window_container.height * 0.05
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                }

                Rectangle {
                    id:editsaveequip
                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    anchors.rightMargin: parent.height * 0.1
                    color:Qt.rgba(0.6,0.6,0.6,0.3)
                    border.width:1
                    Image {
                        anchors.centerIn: parent
                        width:parent.width * 0.8
                        height:parent.height * 0.8
                        source:if(equipnameedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                    }




                }

                MouseArea {
                    anchors.fill:parent
                    //onClicked:if(equipnameedit.visible == false ) {equipnameedit.visible = true} else {equipnameedit.visible = false}
                    onClicked:if(equiplist.visible == false) {equiplist.dialog = 0,equiplist.visible = true} else {equiplist.visible = false}
                }

                TextField {
                    id:equipnameedit
                    visible:false
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:editsaveequip.left
                    anchors.rightMargin:parent.height * 0.08
                    //width:parent.width * 0.88
                    height:parent.height * 0.8
                    onTextChanged: equipname = text

                }


            }


            Rectangle {
                width:parent.width * 0.5
                height:window_container.height * 0.1
                radius:5
                 color:Qt.rgba(0.9,0.9,0.9,0.8)
                border.width:5
                border.color: Qt.rgba(0.6,0.6,0.6,0.3)
                visible:if(equipname.length > 1 && equipnameedit.visible == false) {true} else {false}

                Text {
                    text:if(numofequipment == 0) {0} else {numofequipment}
                    font.pixelSize: window_container.height * 0.05
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    //onTextChanged: if(numofequipment > 0) {if(bottlesleft == 0) { bottlesleft = 1} }
                }

                Rectangle {

                    id:editsaveequipbutton

                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    anchors.rightMargin: parent.height * 0.1
                    color:Qt.rgba(0.6,0.6,0.6,0.3)
                    border.width:1
                    Image {
                        anchors.centerIn: parent
                        width:parent.width * 0.8
                        height:parent.height * 0.8
                        source:if(instockedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                    }




                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:if(instockedit.visible == false ) {instockedit.visible = true} else {instockedit.visible = false}
                }

                TextField {
                    id:instockedit
                    visible:false
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:editsaveequipbutton.left
                    anchors.rightMargin:parent.height * 0.08
                    //width:parent.width * 0.88
                    height:parent.height * 0.8
                    onTextChanged: numofequipment = text

                }

            }
          }


        Column {
            visible:if(type == 40) {true} else {false}
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:title.bottom
            anchors.topMargin:parent.height * 0.04
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height * 0.01
            width:parent.width * 0.9
            spacing: parent.height * 0.03

            Rectangle {
                width:parent.width
                height:window_container.height * 0.1
                radius:5
                 color:Qt.rgba(0.9,0.9,0.9,0.8)
                border.width:5
                border.color: Qt.rgba(0.6,0.6,0.6,0.3)

                Text {
                    text:if(extraname == " " || extraname == "") {"Type"} else {extraname}
                    font.pixelSize: window_container.height * 0.05
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                }

                Rectangle {
                    id:editsaveextra
                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    anchors.rightMargin: parent.height * 0.1
                    color:Qt.rgba(0.6,0.6,0.6,0.3)
                    border.width:1
                    Image {
                        anchors.centerIn: parent
                        width:parent.width * 0.8
                        height:parent.height * 0.8
                        source:if(extranameedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                    }




                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:if(extranameedit.visible == false ) {extranameedit.visible = true} else {extranameedit.visible = false}
                    //onClicked:if(extralist.visible == false) {extralist.visible = true} else {extralist.visible = false}
                }

                TextField {
                    id:extranameedit
                    visible:false
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:editsaveextra.left
                    anchors.rightMargin:parent.height * 0.08
                    //width:parent.width * 0.88
                    height:parent.height * 0.8
                    onTextChanged: extraname = text

                }

            }


            Rectangle {
                width:parent.width * 0.5
                height:window_container.height * 0.1
                radius:5
                 color:Qt.rgba(0.9,0.9,0.9,0.8)
                border.width:5
                border.color: Qt.rgba(0.6,0.6,0.6,0.3)
                visible:if(extraname.length > 1 && extranameedit.visible == false) {true} else {false}

                Text {
                    text:if(numofextra == 0) {0} else {numofextra}
                    font.pixelSize: window_container.height * 0.05
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    //onTextChanged: if(numofequipment > 0) {if(bottlesleft == 0) { bottlesleft = 1} }
                }

                Rectangle {

                    id:editsaveextrabutton

                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    anchors.rightMargin: parent.height * 0.1
                    color:Qt.rgba(0.6,0.6,0.6,0.3)
                    border.width:1
                    Image {
                        anchors.centerIn: parent
                        width:parent.width * 0.8
                        height:parent.height * 0.8
                        source:if(extrastockedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                    }

                }

                MouseArea {
                    anchors.fill:parent
                    onClicked:if(extrastockedit.visible == false ) {extrastockedit.visible = true} else {extrastockedit.visible = false}
                }

                TextField {
                    id:extrastockedit
                    visible:false
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:editsaveextrabutton.left
                    anchors.rightMargin:parent.height * 0.08
                    //width:parent.width * 0.88
                    height:parent.height * 0.8
                    onTextChanged: numofextra = text

                }

            }
          }



        Column {
            id:recipecolumn
            visible:if(type == 50) {true} else {false}
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:title.bottom
            anchors.topMargin:parent.height * 0.04
            anchors.bottom:okaybutton.top
            anchors.bottomMargin:parent.height * 0.02
            width:parent.width * 0.9
            spacing: parent.height * 0.03

            Rectangle {
                width:parent.width
                height:window_container.height * 0.1
                radius:5
                  color:Qt.rgba(0.98,0.98,0.98,0.9)
                border.width:5
                border.color: Qt.rgba(0.6,0.6,0.6,0.3)

                Text {
                    text:if(recipename == " " ||recipename == "") {"Name"} else {recipename}
                    font.pixelSize: window_container.height * 0.05
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    width:parent.width * 0.8
                    clip:true
                }

                Rectangle {
                    id:editsaverecipe
                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    anchors.rightMargin: parent.height * 0.1
                    color:Qt.rgba(0.6,0.6,0.6,0.3)
                    border.width:1
                    Image {
                        anchors.centerIn: parent
                        width:parent.width * 0.8
                        height:parent.height * 0.8
                        source:if(recipenameedit.visible == false) {"graphics/edit.svg"} else {"graphics/save.svg"}
                    }




                }
                MouseArea {
                    anchors.fill:parent
                    onClicked:if(recipenameedit.visible == false ) {recipenameedit.visible = true} else {recipenameedit.visible = false}

                }

                TextField {
                    id:recipenameedit
                    visible:false
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:editsaverecipe.left
                    anchors.rightMargin:parent.height * 0.08
                    //width:parent.width * 0.88
                    height:parent.height * 0.8
                    onTextChanged: recipename = text

                }

            }

            ListView {
                id:steps
                visible: if (recipenameedit.visible == false && recipename != " " && recipename != "") {true} else {false}

                anchors.horizontalCenter: parent.horizontalCenter

                clip:true
                width:parent.width * 0.9
                height:parent.height * 0.8

                //spacing:parent.height * 0.01

                model:ListModel {
                    id:steplist

                    ListElement {

                        step:1
                    }

                }


                delegate: Item {
                            width:parent.width
                            height:if(ingredients.visible == true) {ingredients.contentHeight + ingredients.y + 20} else {window_container.height * 0.08}
                            anchors.horizontalCenter: parent.horizontalCenter
                            //clip:true
                            property string stepname: "Step "+(index+1)
                            Rectangle {
                                id:thename
                                color:Qt.rgba(0.9,0.9,0.9,0.8)
                                width:parent.width
                                height:window_container.height * 0.07
                                radius:5
                                border.width:1

                                Text {
                                    id:steptitle
                                    //text:if(equiplist.selected == " ") {stepname} else {equiplist.selected}
                                    text:if(index == equiplist.selectedindex) {equipselected,stepname = equipselected.split("^")[1]} else {stepname}
                                    anchors.left:parent.left
                                    anchors.leftMargin: parent.height * 0.1
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: window_container.height * 0.05
                                    //onTextChanged: if(index == equiplist.selectedindex) {Scripts.add_ingredient(index+1,equipselected)}

                                }



                                Image {
                                    width:parent.height * 0.6
                                    height:parent.height * 0.6
                                    source:if(ingredients.visible == false) {"graphics/go-down.svg"} else {"graphics/go-up.svg"}
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
                                    //onClicked:if(ingredients.visible == false && ingredientslist.count > 0) {ingredients.visible = true} else {ingredients.visible = false}
                                    onClicked:if(equiplist.visible == false) {equiplist.selectedindex = index,equiplist.dialog = 1,equiplist.visible = true,stepname =equipselected
                                                    ingredients.visible = true

                                                  switch(index) {
                                                   case 0: listingredients(step1,index);currentstep = 1;break;
                                                   case 1:listingredients(step2,index);currentstep = 2;break;
                                                   case 2:listingredients(step3,index);currentstep = 3;break;
                                                   case 3:listingredients(step4,index);currentstep = 4;break;
                                                   case 4:listingredients(step5,index);currentstep = 5;break;
                                                  }

                                              } else {equiplist.visible = false}

                                }

                            }

                                ListView {
                                     id:ingredients
                                    anchors.top:thename.bottom
                                    //anchors.topMargin: window_container.height * 0.01
                                    width:parent.width
                                    height:contentHeight
                                    //anchors.bottom:okaybutton.top
                                    visible:false

                                    model:switch(index) {

                                           case 0:ingredientslist1;break;
                                           case 1:ingredientslist2;break;
                                           case 2:ingredientslist3;break;
                                           case 3:ingredientslist4;break;
                                            case 4:ingredientslist5;break;
                                          }

                                    delegate: Item {
                                        width:parent.width
                                        height:window_container.height * 0.06

                                        Rectangle {
                                            anchors.right:parent.right
                                            color:Qt.rgba(0.9,0.9,0.9,0.7)
                                            width:parent.width * 0.98
                                            height:parent.height
                                            radius:5
                                            border.width:1

                                            Text {
                                                text:ingredient
                                                anchors.left:parent.left
                                                anchors.leftMargin: parent.height * 0.1
                                                anchors.verticalCenter: parent.verticalCenter
                                                font.pixelSize: parent.height * 0.5
                                            }


                                            Image {
                                                width:parent.height * 0.6
                                                height:parent.height * 0.6
                                                source:if(ingredient == "Add New") {"graphics/add.svg"} else {"graphics/remove.svg"}
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

                                        MouseArea {
                                            anchors.fill:parent
                                            onClicked:ingredientDialog.visible = true


                                        }

                                    }
                            }


                        }



            }

          }

        Rectangle {
            visible:if(type == 50) {true} else {false}
            anchors.bottom:recipecolumn.bottom
            anchors.right:recipecolumn.right
            width:recipecolumn.height * 0.1
            height:recipecolumn.height * 0.1
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
                visible:if(steplist.count == 1) {true} else {false}
                text:"To add a step, click here -->"
                font.pixelSize: parent.height * 0.3
                anchors.right:parent.left
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                anchors.fill:parent
                onClicked:if(steplist.count < 5) {steplist.append({step: 1})}
            }
        }

        EquipmentList {
            id:equiplist
            width:window_container.width * 0.9
            height:window_container.height * 0.9
            visible:false
            anchors.horizontalCenter: parent.horizontalCenter

        }


        Rectangle {
            //anchors.top:bottlerow.bottom
            width:parent.width
            height:parent.height * 0.006
            color:"gray"
            anchors.horizontalCenter: parent.horizontalCenter
        }






    Rectangle {
        anchors.bottom:okaybutton.top
        anchors.bottomMargin: parent.height * 0.01
        width:parent.width * 0.98
        height:parent.height * 0.005
        color:"gray"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id:okaybutton
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.07
        width:parent.height * 0.2
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
             onClicked: {switch(type) {
                 case 1: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 2: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 3: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 4: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 5: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 6: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 7: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 8: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 9: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 10: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 11: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 12: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 13: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 14: Scripts.add_gear(drinkname,ounces,bottlesleft,type);break;
                 case 30: Scripts.add_gear(equipname,0,numofequipment,type);break;
                 case 40: Scripts.add_gear(extraname,0,numofextra,type);break;
                 case 50: Scripts.add_recipe(recipename,step1,step2,step3,step4,step5,author),OpenSeed.send_recipe(recipename,step1,step2,step3,step4,step5,author),clearall();break;


                 default: break;
                }

                           supplies.state = "Show",window_container.state = "Hide"

             }

         }
    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.left:parent.left
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.07
        width:parent.height * 0.2
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
             onClicked:supplies.state = "Show",window_container.state = "Hide",clearall()

         }
    }



 function clearall() {

     numofdrinks= 0;
     bottlesused=0;
     ouncesPoored=0;
     bottlesleft=0;
     ounces=0;
     drinkname=" ";
     equipname=" ";
     numofequipment= 0;
     extraname=" ";
     numofextra= 0;
     equipselected= " ";
     recipename = " ";
    // author = " ";
     step1 = " ";
     step2 = " ";
     step3 = " ";
     step4 = " ";
     step5 = " ";

 }

 function listingredients(step,sindex) {
     var num = 1;
     switch(sindex) {
     case 0:ingredientslist1.clear();break;
     case 1:ingredientslist2.clear();break;
     case 2:ingredientslist3.clear();break;
     case 3:ingredientslist4.clear();break;
     case 4:ingredientslist5.clear();break;
     }
     while (num < step.split(";").length) {
         console.log(sindex,step.split(";")[num]);
         switch(sindex) {
         case 0: ingredientslist1.append({ingredient:step.split(";")[num].split("::")[0].split("^")[1] + " ("+step.split(";")[num].split("::")[1]+")"});break;
         case 1: ingredientslist2.append({ingredient:step.split(";")[num].split("::")[0].split("^")[1] + " ("+step.split(";")[num].split("::")[1]+")"});break;
         case 2: ingredientslist3.append({ingredient:step.split(";")[num].split("::")[0].split("^")[1] + " ("+step.split(";")[num].split("::")[1]+")"});break;
         case 3: ingredientslist4.append({ingredient:step.split(";")[num].split("::")[0].split("^")[1] + " ("+step.split(";")[num].split("::")[1]+")"});break;
         case 4: ingredientslist5.append({ingredient:step.split(";")[num].split("::")[0].split("^")[1] + " ("+step.split(";")[num].split("::")[1]+")"});break;

         }
         num = num + 1;
     }
     switch(sindex) {
     case 0: ingredientslist1.append({ingredient:"Add New" });break;
     case 1: ingredientslist2.append({ingredient:"Add New" });break;
     case 2: ingredientslist3.append({ingredient:"Add New" });break;
     case 3: ingredientslist4.append({ingredient:"Add New" });break;
     case 4: ingredientslist5.append({ingredient:"Add New" });break;

     }
 }

ListModel {
id:ingredientslist1

}


ListModel {
id:ingredientslist2

}
ListModel {
id:ingredientslist3

}
ListModel {
id:ingredientslist4

}
ListModel {
id:ingredientslist5

}



Item {
    id:ingredientDialog

    anchors.centerIn: parent
    width:parent.width * 0.9
    height:parent.height * 0.9
    visible: false

    onVisibleChanged: if(visible == true) {Scripts.create_list("","all")} else { }

    Rectangle {
        anchors.fill:parent
        color:"white"
       border.color:"#404040"
       border.width:6
       radius: 3
    }

    TextField {
        id:ingredient_search
        anchors.top:parent.top
        anchors.left:parent.left
        //anchors.right:parent.right
        width:parent.width * 0.85
        anchors.margins: parent.height * 0.01
        height:parent.height * 0.1
        onTextChanged:Scripts.create_list(text,"all")

    }

    Rectangle {
        anchors.verticalCenter: ingredient_search.verticalCenter
        anchors.right:parent.right
        anchors.left:ingredient_search.right
        anchors.rightMargin: parent.height * 0.005
        height:ingredient_search.height
        border.color:"lightgray"
        radius:5

        Image {
            anchors.centerIn: parent
            width:parent.width * 0.5
            height:parent.width * 0.5
            source:"graphics/add.svg"
        }
    }

    Rectangle {
        color:"#404040"
        width:parent.width
        height:parent.height * 0.01
        anchors.top:ingredient_search.bottom
        anchors.topMargin: parent.height * 0.01
    }

    ListView {
        anchors.top:ingredient_search.bottom
        anchors.left:parent.left
        anchors.topMargin: parent.height * 0.02
        anchors.bottom:fulllistback.top
        anchors.bottomMargin: parent.height * 0.001
        width:parent.width * 0.99
        spacing: parent.height * 0.001
        clip:true

        model:ListModel {
            id:fullist
        }

        delegate:Item {
            width:parent.width
            height:window_container.height * 0.06

            Rectangle {
                anchors.right: parent.right
                color:if(type == 0) {Qt.rgba(0.7,0.8,0.8,0.98)} else {Qt.rgba(0.9,0.9,0.9,0.98)}
                width:if(type == 0) {parent.width * 0.99} else { parent.width * 0.96}
                height:parent.height
                radius:if(type == 0) {0} else {5}
                border.width:if(type == 0) {0} else  {0}

                Text {
                    text:if(type == 0) {ingredient} else {ingredient.split("^")[1]}
                    anchors.left:parent.left
                    anchors.leftMargin: parent.height * 0.1
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: parent.height * 0.5
                }


                Image {
                    visible: if(type == 0) {false} else {true}
                    width:parent.height * 0.6
                    height:parent.height * 0.6
                    source:"graphics/add.svg"
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

            MouseArea {
                anchors.fill:parent
                onClicked: amountDialog.picked = ingredient, amountDialog.visible = true
               // onClicked:ingredientDialog.visible = true


            }

        }

    }

    Rectangle {
        color:"#404040"
        width:parent.width
        height:parent.height * 0.01
        anchors.bottom:fulllistback.top
            }


    Rectangle {
        id:fulllistback
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height * 0.006

        anchors.horizontalCenter: parent.horizontalCenter

        height:parent.height * 0.08
        width:parent.width * 0.99
         border.width:1
         border.color:"#404040"


         color:Qt.rgba(0.98,0.98,0.98,0.9)


         Text {
             anchors.centerIn: parent
             text:"Cancel"
             font.pixelSize: parent.height /2
         }

         MouseArea {
             anchors.fill:parent
             onClicked:ingredientDialog.visible = false

         }
    }

}

Item {
    id:amountDialog
    property string picked: ""

    anchors.centerIn: parent
    width:parent.width * 0.85
    height:parent.height * 0.4
    visible: false

    MouseArea {
        anchors.fill:parent
        onClicked: console.log("")
    }

    Rectangle {
        anchors.fill: parent
        color:"white"
        border.color:"#404040"
        border.width:3
        radius:5

    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        id:amounttitle
        text: amountDialog.picked.split("^")[1] + " Amount"
        font.pixelSize: parent.width * 0.12 - text.length
    }

    Rectangle {
        color:"#404040"
        width:parent.width
        height:parent.height * 0.01
        anchors.top:amounttitle.bottom

            }

    /*TextField {
        id:amountfield
        anchors.top:amounttitle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin:parent.height * 0.06
        width:parent.width * 0.98
        height:parent.height * 0.4
    } */

    Rectangle {
        anchors.centerIn: amountfield
        width:amountfield.width
        height:amountfield.height
        border.color:"black"
        radius: 8
    }

    ListView {
        id:amountfield
        //anchors.top:amounttitle.bottom
       // anchors.horizontalCenter: parent.horizontalCenter
       // anchors.topMargin:parent.height * 0.06
        anchors.centerIn: parent
        width:parent.width * 0.8
        height:parent.height * 0.3


        snapMode: ListView.SnapOneItem
        clip:true

        property string oz:"0.5,0.75,1,1.5,1.75,2,2.5,2.75,3,3.5,3.75,4"
        property string nonstandard:"Dash,Dollop,Drizzle,Fill,Pinch,Some,Splash,0.5,0.75,1,1.5,1.75,2,2.5,2.75,3,3.5,3.75,4"
        property int setindex:0

        model:switch(amountDialog.picked.split("^")[0]) {
              case "d": amountfield.oz.split(",").length;break;
              case "e": amountfield.nonstandard.split(",").length;break;
              case "act": amountfield.nonstandard.split(",").length;break;
              case "g": amountfield.nonstandard.split(",").length;break;
              case "a": amountfield.nonstandard.split(",").length;break;
              default: amountfield.oz.split(",").length;break;
              }

        delegate: Text {
            width:parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: window_container.height * 0.1
            text:switch(amountDialog.picked.split("^")[0]) {
                 case "d": amountfield.oz.split(",")[index]+" Oz";break;
                 case "e": amountfield.nonstandard.split(",")[index];break;
                 case "act": amountfield.nonstandard.split(",")[index];break;
                 case "g": amountfield.nonstandard.split(",")[index];break;
                 case "a": amountfield.nonstandard.split(",")[index];break;
                 default: amountfield.oz.split(",")[index]+" Oz";break;
                 }


            MouseArea {
                anchors.fill:parent
                onClicked:amountfield.setindex = index
            }
        }       

    }

    Text {
        anchors.top:amountfield.bottom
        anchors.horizontalCenter: amountfield.horizontalCenter
        text:"tap to lock in ammount"
    }


    Rectangle {
        anchors.bottom:parent.bottom
        anchors.left:parent.left
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.2
        width:parent.height * 0.4
         border.width:1
         radius:2

         color:Qt.rgba(0.9,0.9,0.9,0.7)


         Text {
             anchors.centerIn: parent
             text:"Cancel"
             font.pixelSize: parent.height /2
         }

         MouseArea {
             anchors.fill:parent
           //  onClicked:supplies.state = "Show",window_container.state = "Hide"
             onClicked: amountDialog.visible = false

         }
    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        anchors.margins: parent.height * 0.03
        height:parent.height * 0.2
        width:parent.height * 0.4
         border.width:1
         radius:2

         color:Qt.rgba(0.9,0.9,0.9,0.7)


         Text {
             anchors.centerIn: parent
             text:"Okay"
             font.pixelSize: parent.height /2
         }

         MouseArea {
             anchors.fill:parent
            // onClicked:supplies.state = "Show",window_container.state = "Hide"
             onClicked: {

                 switch(amountDialog.picked.split("^")[0]) {
                                  case "d": thelist = amountfield.oz;break;
                                  case "act": thelist = amountfield.nonstandard;break;
                                  case "e": thelist = amountfield.nonstandard;break;
                                  case "a": thelist = amountfield.nonstandard;break;
                                  case "g": thelist = amountfield.nonstandard;break;
                                  default: thelist = amountfield.oz;break;
                                  }

                 amountDialog.visible = false,Scripts.add_ingredient(currentstep,amountDialog.picked+"::"+thelist.split(",")[amountfield.setindex]),ingredientDialog.visible = false
                }
         }
    }


}


}

