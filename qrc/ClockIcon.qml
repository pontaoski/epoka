import QtQuick 2.0
import org.maui.epoka 1.0
import QtQuick.Window 2.12

Window {
    id: root
    height: 48
    width: 48
    visible: true
    Item {
	    id: ood
	    height: 48
	    width: 48
        Image {
            source: "qrc:/clock/base.svg"
        }
        Image {
            id: segundo
            source: "qrc:/clock/seconds.svg"
        }
        Image {
            id: minuto
            source: "qrc:/clock/minutes.svg"
        }
        Image {
            id: hora
            source: "qrc:/clock/hours.svg"
        }
        Image {
            source: "qrc:/clock/dot.svg"
        }
    }

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            calcHours()
            calcMins()
            calcSecs()
            ood.grabToImage((e) => {
                IconSetter.setIconForWindow(e.image, root)
            })
        }
    }
    function calcHours() {
        var d = new Date()
        var m = (((d.getHours() + 1) % 12) * 60)
        m += (d.getMinutes() + 1)
        m = m*0.5
        hora.rotation = m
    }
    function calcMins() {
        var d = new Date()
        var m = ((d.getMinutes() + 1) * 6)
        minuto.rotation = m
    }
    function calcSecs() {
        var d = new Date()
        var m = ((d.getSeconds() + 1 ) * 6)
        segundo.rotation = m
    }
}
