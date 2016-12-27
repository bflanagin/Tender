import QtQuick 2.4

Item {

    Rectangle {
     id:circle1

      states: [
            State {
                name:"In"
               // when:circle.state = "Out"
                PropertyChanges {
                    target:circle1
                    opacity:0.4
                }
        },
        State {
            name:"Out"
            //when:circle.state = "In"
            PropertyChanges {
                target:circle1
                opacity:0.01
            }
    }
    ]

    transitions: [

        Transition {
            from: "In"
            to: "Out"
            reversible: true


            NumberAnimation {
                target: circle1
                property: "opacity"
                duration: 4000
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state: "Out"
    x:0
    y:parent.height * 0.06
    width:parent.width /1.5
    height:parent.width /1.5
    radius: width /2
    color:Qt.rgba(0.2,0.2,0.2,1)

    Timer {
        repeat: true
        running: true
        interval: 6000
        onTriggered: if(circle1.state == "In") {circle1.state = "Out"} else {circle1.state = "In"}
    }
}

    Rectangle {

       id:circle2

       states: [
            State {
                name:"In"
               // when:circle.state = "Out"
                PropertyChanges {
                    target:circle2
                    opacity:0.4
                }
        },
        State {
            name:"Out"
            //when:circle.state = "In"
            PropertyChanges {
                target:circle2
                opacity:0.01
            }
    }
    ]

    transitions: [

        Transition {
            from: "In"
            to: "Out"
            reversible: true


            NumberAnimation {
                target: circle2
                property: "opacity"
                duration: 4000
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state: "Out"


    x:parent.width * 0.8
    y:parent.height * 0.6
    width:parent.width /2
    height:parent.width /2
    radius: width /2
    color:Qt.rgba(0.5,0.5,0.5,1)


    Timer {
        repeat: true
        running: true
        interval: 14000
        onTriggered: if(circle2.state == "In") {circle2.state = "Out"} else {circle2.state = "In"}
    }
}

    Rectangle {

       id:circle3

       states: [
            State {
                name:"In"
               // when:circle.state = "Out"
                PropertyChanges {
                    target:circle3
                    opacity:0.4
                }
        },
        State {
            name:"Out"
            //when:circle.state = "In"
            PropertyChanges {
                target:circle3
                opacity:0.01
            }
    }
    ]

    transitions: [

        Transition {
            from: "In"
            to: "Out"
            reversible: true


            NumberAnimation {
                target: circle3
                property: "opacity"
                duration: 4000
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state: "In"


    x:parent.width * 0.4
    y:parent.height * 0.2
    width:parent.width /6
    height:parent.width /6
    radius: width /2
    color:Qt.rgba(0.1,0.1,0.1,1)


    Timer {
        repeat: true
        running: true
        interval: 8000
        onTriggered: if(circle3.state == "In") {circle3.state = "Out"} else {circle3.state = "In"}
    }
}

    Rectangle {

       id:circle4

          states: [
            State {
                name:"In"
               // when:circle.state = "Out"
                PropertyChanges {
                    target:circle4
                    opacity:0.4
                }
        },
        State {
            name:"Out"
            //when:circle.state = "In"
            PropertyChanges {
                target:circle4
                opacity:0.01
            }
    }
    ]

    transitions: [

        Transition {
            from: "In"
            to: "Out"
            reversible: true


            NumberAnimation {
                target: circle4
                property: "opacity"
                duration: 4000
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state: "In"


    x:parent.width * 0.8
    y:parent.height * 0.1
    width:parent.width /8
    height:parent.width /8
    radius: width /2
    color:Qt.rgba(0.4,0.4,0.4,1)


    Timer {
        repeat: true
        running: true
        interval: 10000
        onTriggered: if(circle4.state == "In") {circle4.state = "Out"} else {circle4.state = "In"}
    }
}

    Rectangle {
     id:circle5

    states: [
            State {
                name:"In"
               // when:circle.state = "Out"
                PropertyChanges {
                    target:circle5
                    opacity:0.4
                }
        },
        State {
            name:"Out"
            //when:circle.state = "In"
            PropertyChanges {
                target:circle5
                opacity:0.01
            }
    }
    ]

    transitions: [

        Transition {
            from: "In"
            to: "Out"
            reversible: true


            NumberAnimation {
                target: circle5
                property: "opacity"
                duration: 4000
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state: "In"


    x:parent.width * 0.02
    y:parent.height * 0.6
    width:parent.width /1.5
    height:parent.width /1.5
    radius: width /2
    color:Qt.rgba(0.4,0.4,0.4,1)

    Timer {
        repeat: true
        running: true
        interval: 12000
        onTriggered: if(circle5.state == "In") {circle5.state = "Out"} else {circle5.state = "In"}
    }
}

}
