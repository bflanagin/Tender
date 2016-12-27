import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0
import "main.js" as Scripts
import "openseed.js" as OpenSeed

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "tender.vagueentertainment"

     property var db: Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo");

    width: units.gu(80)
    height: units.gu(150)


    property var bases:""
    property var gar:""
    property var equipment:""
    property var addtoos:""
    property var actons:""
    property string devId:"Vag-01001011"
    property string appId:"vagTend-1109"

   Component.onCompleted: Scripts.firstload()

    Timer {
        running:true
        repeat:false
        interval: 1500
        onTriggered: menu1.state = "Show"
    }

    Timer {
        running:true
        repeat:false
        interval: 1000
        onTriggered: backing.state = "Hide"
    }

    Timer {
        id:fuzz
        running:true
        repeat:true
        interval: 20000
        onTriggered: if(focus.state == "In") {focus.state = "Out"} else {focus.state = "In"}
    }

    Timer {
        running:true
        repeat:false
        interval: 20
        onTriggered: OpenSeed.get_recipes()
    }

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Tender")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
            visible: false
        }

        Item {
            id:background
            width:parent.width
            height:parent.height

            Image {
                anchors.centerIn: parent
                width:parent.height
                height:parent.height
                source:"graphics/drink1.jpg"
                //rotation:90
                fillMode: Image.PreserveAspectFit
            }

            Bubbles {
                width:parent.width
                height:parent.height
            }


        }

        FastBlur {
                id:focus

                states: [
                        State {
                            name:"In"
                            PropertyChanges {
                                target:focus
                                radius:10
                            }
                    },
                    State {
                        name:"Out"
                        PropertyChanges {
                            target:focus
                            radius:34
                        }
                }
                ]

                transitions: [

                    Transition {
                        from: "In"
                        to: "Out"
                        reversible: true


                        NumberAnimation {
                            target: focus
                            property: "radius"
                            duration: 10000
                            easing.type: Easing.InOutQuad
                        }

                    }

                ]
                state: "In"
            anchors.fill: background
                   source: background
                   radius: 24
        }


        Image {
            id:backing


            states: [
                    State {
                        name:"Hide"

                        PropertyChanges {
                            target: backing
                            opacity:0

                        }

                        PropertyChanges {
                            target:apptitle
                            opacity:1
                        }
                },

                State {
                    name:"Show"

                    PropertyChanges {
                        target:backing
                        opacity:0.8
                    }

                    PropertyChanges {
                        target:apptitle
                        opacity:0
                    }
                }

            ]

            transitions: [

                Transition {
                    from: "Show"
                    to: "Hide"
                    reversible: true


                    NumberAnimation {
                        target: backing
                        property: "opacity"
                        duration: 800
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: apptitle
                        property: "opacity"
                        duration: 1500
                        easing.type: Easing.InOutQuad
                    }
                }

            ]

            state: "Show"



            anchors.centerIn: parent
            width:parent.width
            height:parent.height
            source:"graphics/backing.svg"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id:apptitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: parent.height * 0.1
            text:"TENDER"
            color:"White"
            style: Text.Outline
            font.pixelSize: parent.height * 0.1

            Image {
                anchors.right: parent.left
                width:parent.height
                height:parent.height
                rotation:90
                source:"graphics/backing.svg"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                anchors.left: parent.right
                width:parent.height
                height:parent.height
                rotation:90
                source:"graphics/backing.svg"
                fillMode: Image.PreserveAspectFit
            }

        }


        Column {
            id:menu1
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.6
            height:parent.height * 0.3
            spacing: parent.height * 0.03

            states: [
                    State {
                        name:"Hide"

                        PropertyChanges {
                            target: menu1
                            y:parent.height

                        }
                },

                State {
                    name:"Show"

                    PropertyChanges {
                        target:menu1
                        y:(parent.height - menu1.height) / 2
                    }
                }

            ]

            transitions: [

                Transition {
                    from: "Hide"
                    to: "Show"
                    reversible: true


                    NumberAnimation {
                        target: menu1
                        property: "y"
                        duration: 200
                        easing.type: Easing.Bezier

                    }
                }

            ]

            state: "Hide"




            Rectangle {
                radius:8
                height: parent.height * 0.2
                width:parent.width * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                border.width:1
                border.color:"gray"
                color:Qt.rgba(0.9,0.9,0.9,0.7)

                Image {
                   anchors.left:parent.left
                   anchors.verticalCenter: parent.verticalCenter
                    width:parent.height
                    height:parent.height
                    rotation:90
                    source:"graphics/backing.svg"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    //color:"white"
                    text:"Drinks"
                    font.pixelSize: parent.height * 0.6
                    anchors.centerIn: parent
                    width:parent.width * 0.5
                    height:parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    //anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.verticalCenter: parent.verticalCenter
                }

                Image {
                    anchors.right:parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width:parent.height
                    height:parent.height
                    rotation:90
                    source:"graphics/backing.svg"
                    fillMode: Image.PreserveAspectFit
                }


                MouseArea {
                    anchors.fill:parent
                    onClicked: drinks.state = "Show"
                }

            }

            Rectangle {
                radius:8
                height: parent.height * 0.2
                width:parent.width * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                border.width:1
                border.color:"gray"
                color:Qt.rgba(0.9,0.9,0.9,0.7)



                    Image {
                       anchors.left:parent.left
                       anchors.verticalCenter: parent.verticalCenter
                        width:parent.height
                        height:parent.height
                        rotation:90
                        source:"graphics/backing.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        //color:"white"
                        text:"Stock"
                        font.pixelSize: parent.height * 0.6
                        anchors.centerIn: parent
                        width:parent.width * 0.5
                        height:parent.height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        //anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.verticalCenter: parent.verticalCenter
                    }

                    Image {
                        anchors.right:parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width:parent.height
                        height:parent.height
                        rotation:90
                        source:"graphics/backing.svg"
                        fillMode: Image.PreserveAspectFit
                    }



                MouseArea {
                    anchors.fill:parent
                    onClicked: inventory.state = "Show"
                }

            }
        }

        Rectangle {
            anchors.bottom:parent.bottom
            anchors.right:parent.right
            anchors.margins: parent.height * 0.01
            radius:6
            height: parent.height * 0.05
            width:parent.height * 0.05
            border.width:1
            border.color:"gray"
            color:Qt.rgba(0.9,0.9,0.9,0.5)

            Image {
                anchors.centerIn: parent
                width:parent.height * 0.8
                height:parent.height * 0.8
                source:"graphics/settings.svg"

            }

        }

        Drinks {
            id:drinks
            y:0
            height:parent.height
            width:parent.width
        }


        Stock {
            id:inventory
            y:0
            height:parent.height
            width:parent.width



            state:"Hide"

        }

        InLists {
            id:supplies
            width:parent.width
            height:parent.height
            state:"Hide"
        }

        AddDialog {
            id:addnew

            width:parent.width
            height:parent.height
            state:"Hide"
        }

    }
}


