import QtQuick 2.12
import org.kde.mauikit 1.0 as Maui
import org.kde.kirigami 2.7 as Kirigami
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtGraphicalEffects 1.13

Item {
    id: root
    property bool running: false
    property var times: []

    Item {
        width: root.height * (2/3)
        height: width
        anchors.centerIn: parent
        Rectangle {
            anchors.centerIn: parent
            width: root.height * (2/3)
            height: width
            id: spinnerProgress
            anchors {
                margins: Math.ceil(Kirigami.Units.smallSpacing)
            }
            radius: width
            color: "transparent"
            opacity: 0.8
            border.color: Kirigami.Theme.backgroundColor
            border.width: Kirigami.Units.largeSpacing
            property real progress: 0.1
        }

        ConicalGradient {
            id: cone
            source: spinnerProgress
            visible: spinnerProgress.visible
            anchors.fill: spinnerProgress
            property int deg: 0
            gradient: Gradient {
                GradientStop { position: 0.00; color: Kirigami.Theme.highlightColor }
                GradientStop { position: spinnerProgress.progress; color: Kirigami.Theme.highlightColor }
                GradientStop { position: spinnerProgress.progress + 0.0001; color: Qt.rgba(Kirigami.Theme.textColor.r,Kirigami.Theme.textColor.g,Kirigami.Theme.textColor.b,0.2) }
            }
            transform: Rotation { angle: cone.deg; origin.x: cone.width / 2; origin.y: cone.height / 2 }
        }
        SequentialAnimation {
            running: root.running
            loops: Animation.Infinite
            NumberAnimation {
                target: cone
                duration: 1000
                property: "deg"
                from: 0
                to: 360
            }
        }
        Column {
            id: col
            anchors.centerIn: parent
            Item {
                height: hhmmss.height
                width: hhmmss.width
                anchors.horizontalCenter: parent.horizontalCenter
                Kirigami.Heading {
                    id: hhmmss
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: stoppy.getString()
                }
                Kirigami.Heading {
                    level: 3
                    anchors.verticalCenter: hhmmss.verticalCenter
                    anchors.left: hhmmss.right
                    anchors.leftMargin: Kirigami.Units.largeSpacing
                    text: stoppy.getMS()
                }
            }
            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: root.running ? "Stop" : "Start"
                    onClicked: root.running = !root.running
                }
                Button {
                    text: root.running ? "Lap" : "Reset"
                    onClicked: root.running ? root.lap() : root.clear()
                }
            }
        }
        ListView {
            clip: true
            anchors.horizontalCenter: col.horizontalCenter
            anchors.top: col.bottom
            anchors.topMargin: Kirigami.Units.largeSpacing
            height: ((cone.y + cone.height) - (col.y + col.height)) - (Kirigami.Units.gridUnit * 3)
            width: col.width
            id: repeat
            model: root.times
            delegate: Kirigami.Heading {
                level: 3
                text: modelData
            }
            displaced: Transition {
                NumberAnimation { properties: "y"; duration: 5000 }
            }
        }
    }
    Stopwatch { id: stoppy; running: root.running }
    Timer {
        interval: 10
        repeat: true
        running: root.running
        onTriggered: {
            stoppy.delta()
        }
    }
    Component.onCompleted: {
        stoppy.start()
    }
    function lap() {
        var str = stoppy.getString() + "." + stoppy.getMS()
        root.times.unshift(str)
        repeat.model = root.times
    }
    function clear() {
        stoppy.reset()
        root.times = []
        repeat.model = root.times
    }
}
