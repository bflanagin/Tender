import QtQuick 2.4
import Ubuntu.Components 1.3
import Tender 1.0
import QtQuick.LocalStorage 2.0 as Sql
import QtGraphicalEffects 1.0


Item {
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


 Rectangle {
    anchors.fill:parent
    color:Qt.rgba(0.98,0.98,0.98,0.9)
 }

 /*Bubbles {
     anchors.fill: parent
     opacity:0.3
 } */


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
     text:"Stock"
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
     color:"#202020"
     anchors.horizontalCenter: parent.horizontalCenter
 }

 Column {

     //anchors.top:title.bottom
     //anchors.topMargin:parent.height * 0.01
     anchors.centerIn: parent
     width:parent.width * 0.8
     height:parent.height * 0.6
     //clip:true
     //anchors.horizontalCenter: parent.horizontalCenter
     spacing:parent.height * 0.03

     Row {
         anchors.horizontalCenter: parent.horizontalCenter
         width:parent.width * 0.9
         height:parent.height /2.5
         //clip:true
         spacing:parent.width * 0.03

         Rectangle {
             height:parent.height
             width:parent.width /2
             border.width:1
             color:Qt.rgba(0.9,0.9,0.9,0.8)
             radius:8
             clip:true


             Image {
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top:parent.top
                 width:parent.height * 0.9
                 height:parent.height * 0.9
                 source:"graphics/liquids.svg"
                 fillMode: Image.PreserveAspectFit
             }

             Text {
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom:parent.bottom
                 text:"Base"
                 font.pixelSize: parent.height * 0.1

             }

             MouseArea {
                 anchors.fill:parent
                 onClicked:window_container.state = "Hide",supplies.type = 1,supplies.state = "Show"
             }


         }

         Rectangle {
             height:parent.height
             width:parent.width /2
              border.width:1
              radius:8
               color:Qt.rgba(0.9,0.9,0.9,0.8)
               clip:true

              Image {
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.top:parent.top
                  width:parent.height * 0.9
                  height:parent.height * 0.9
                  source:"graphics/equip.svg"
                  fillMode: Image.PreserveAspectFit
              }

              Text {
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.bottom:parent.bottom
                  text:"Equipment"
                  font.pixelSize: parent.height * 0.1

              }

              MouseArea {
                  anchors.fill:parent
                  onClicked:window_container.state = "Hide",supplies.type = 30,supplies.state = "Show"
              }

         }

     }

     Row {
         anchors.horizontalCenter: parent.horizontalCenter
         width:parent.width * 0.9
         height:parent.height /2.5
         //clip:true
         spacing:parent.width * 0.03

         Rectangle {
             height:parent.height
             width:parent.width /2
             border.width:1
             radius:8
              color:Qt.rgba(0.9,0.9,0.9,0.8)
              clip:true

             Image {
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top:parent.top
                 width:parent.height * 0.9
                 height:parent.height * 0.9
                 source:"graphics/extras.svg"
                 fillMode: Image.PreserveAspectFit
             }

             Text {
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom:parent.bottom
                 text:"Garnishes"
                 font.pixelSize: parent.height * 0.1

             }

             MouseArea {
                 anchors.fill:parent
                 onClicked:window_container.state = "Hide",supplies.type = 40,supplies.state = "Show"
             }


         }

         Rectangle {
             height:parent.height
             width:parent.width /2
              border.width:1
              radius:8
              color:Qt.rgba(0.9,0.9,0.9,0.8)
              clip:true

              Image {
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.top:parent.top
                  width:parent.height * 0.9
                  height:parent.height * 0.9
                  source:"graphics/recipes.svg"
                  fillMode: Image.PreserveAspectFit
              }

              Text {
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.bottom:parent.bottom
                  text:"Recipes"
                  font.pixelSize: parent.height * 0.1

              }

            MouseArea {
                anchors.fill:parent
                onClicked:window_container.state = "Hide",supplies.type = 50,supplies.state = "Show"
            }
         }

     }

 }



 Rectangle {
     anchors.bottom:parent.bottom
     anchors.right:parent.right
     anchors.margins: parent.height * 0.01
     height:parent.height * 0.08
     width:parent.height * 0.2
      border.width:1
      radius:8

      color:Qt.rgba(0.8,0.8,0.8,0.6)


      Text {
          anchors.centerIn: parent
          text:"Back"
          font.pixelSize: parent.height /2
      }

      MouseArea {
          anchors.fill:parent
          onClicked:window_container.state = "Hide"
          enabled:if(supplies.state =="Hide") {true} else {false}
      }
 }


}
