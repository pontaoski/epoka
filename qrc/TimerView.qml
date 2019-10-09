import QtQuick 2.0
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Shapes 1.13
import QtGraphicalEffects 1.13

Rectangle {
    clip: true
    id: root
    Kirigami.Theme.colorSet: Kirigami.Theme.View
    color: Kirigami.Theme.backgroundColor
    function n(n){
        return n > 9 ? "" + n: "0" + n;
    }
    function toHHMMSS(string) {
        var sec_num = parseInt(string, 10); // don't forget the second param
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
        var seconds = sec_num - (hours * 3600) - (minutes * 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        if (seconds < 10) {seconds = "0"+seconds;}

        return [hours, minutes, seconds]
    }
    property int hour: 0
    property int minute: 0
    property int seconds: 0

    property int fromSeconds: 500
    property int secondsElapsed: 0

    property bool started: false
    property bool atEnd: fromSeconds == secondsElapsed

    property color timerColor: Qt.rgba(Kirigami.Theme.textColor.r,Kirigami.Theme.textColor.g,Kirigami.Theme.textColor.b,0.2)

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
        property real progress: (1 * (1 - (root.secondsElapsed / (root.fromSeconds - 1)))) >= 0 ? 1 * (1 - (root.secondsElapsed / (root.fromSeconds - 1))) : 0
        Behavior on progress {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    ConicalGradient {
        source: spinnerProgress
        visible: spinnerProgress.visible
        anchors.fill: spinnerProgress
        gradient: Gradient {
            GradientStop { position: 0.00; color: Kirigami.Theme.highlightColor }
            GradientStop { position: spinnerProgress.progress; color: Kirigami.Theme.highlightColor }
            GradientStop { position: spinnerProgress.progress + 0.000000000001; color: root.timerColor }
        }
    }
//    Rectangle {
//        id: frame
//        anchors.centerIn: parent
//        width: parent.height * (2/3)
//        height: width
//        color: "transparent"
//        border.color: Qt.rgba(Kirigami.Theme.textColor.r,Kirigami.Theme.textColor.g,Kirigami.Theme.textColor.b,0.2)
//        border.width: Kirigami.Units.largeSpacing
//        radius: width * 0.5
//    }
//    Rectangle {
//        anchors.bottom: frame.bottom
//        anchors.horizontalCenter: frame.horizontalCenter
//        width: root.height * (2/3)
//        height: (root.height * (2/3)) * (1 - (root.secondsElapsed / (root.fromSeconds - 1)))
//        color: "transparent"
//        border.color: "transparent"
//        clip: true
//        Behavior on height {
//            NumberAnimation {
//                duration: 1000
//            }
//        }
//        Rectangle {
//            anchors.bottom: parent.bottom
//            width: root.height * (2/3)
//            height: width
//            color: "transparent"
//            border.color: Kirigami.Theme.highlightColor
//            border.width: Kirigami.Units.largeSpacing
//            radius: width * 0.5
//            Behavior on width {
//                NumberAnimation {
//                    duration: Kirigami.Units.longDuration
//                }
//            }
//            Behavior on color {
//                ColorAnimation {
//                    duration: Kirigami.Units.longDuration
//                }
//            }
//        }
//    }
    Column {
        anchors.centerIn: parent
        spacing: Kirigami.Units.largeSpacing
        Row {
            visible: !root.started
            SpinBox {
                id: hours
                font.pointSize: 24
                textFromValue: function(value, locale) {
                    return(root.n(value))
                }
            }
            Label {
                anchors.verticalCenter: hours.verticalCenter
                color: Kirigami.Theme.textColor
                text: ":"
                font.pointSize: 24
            }
            SpinBox {
                id: minutes
                font.pointSize: 24
                from: 0
                to: 59
                textFromValue: function(value, locale) {
                    return(root.n(value))
                }
            }
            Label {
                anchors.verticalCenter: minutes.verticalCenter
                color: Kirigami.Theme.textColor
                text: ":"
                font.pointSize: 24
            }
            SpinBox {
                id: seconds
                font.pointSize: 24
                from: 0
                to: 59
                textFromValue: function(value, locale) {
                    return(root.n(value))
                }
            }
        }
        Row {
            visible: root.started
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                color: Kirigami.Theme.textColor
                text: root.toHHMMSS(fromSeconds - secondsElapsed)[0] + ":" + root.toHHMMSS(fromSeconds - secondsElapsed)[1] + ":" + root.toHHMMSS(fromSeconds - secondsElapsed)[2]
                font.pointSize: 24
            }
        }
        Row {
            spacing: Kirigami.Units.smallSpacing
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: root.started ? "Reset" : "Start"
                onClicked: {
                    if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
                        return;
                    }
                    if (!root.atEnd) {
                        timer.running = !timer.running
                    }
                    root.started = !root.started
                    var sekonds = (hours.value * 3600) + (minutes.value * 60) + seconds.value
                    root.fromSeconds = sekonds
                    root.secondsElapsed += 1
                    if (root.fromSeconds == root.secondsElapsed) {
                        timer.running = false
                    }
                    root.secondsElapsed = 0
                }
            }
            Button {
                visible: root.started
                text: timer.running ? "Pause" : "Resume"
                enabled: !root.atEnd
                onClicked: {
                    timer.running = !timer.running
                }
            }
        }
    }
    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            var sekonds;
            sekonds = (hours.value * 3600) + (minutes.value * 60) + seconds.value
            root.fromSeconds = sekonds
            if (root.fromSeconds == root.secondsElapsed) {
                timer.running = false
            }
            root.secondsElapsed += 1
            if (root.fromSeconds == root.secondsElapsed) {
                timer.running = false
            }
        }
    }
}
