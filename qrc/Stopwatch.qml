import QtQuick 2.0

Item {
    id: root
    property var eclipsed
    property var now
    property bool started: false
    property bool running: false

    Component.onCompleted: {
        root.eclipsed = 0
    }
    function start() {
        if (root.started)
            return
        root.now = Date.now()
        root.started = true
    }
    function delta() {
        if (!root.running)
            return
        var newnow = Date.now()
        var diff = newnow - now
        root.now = newnow
        root.eclipsed += diff
    }
    function getString() {
        var date = new Date(root.eclipsed)
        return date.toISOString().substr(11, 8)
    }
    function getMS() {
        var date = new Date(root.eclipsed)
        return date.getMilliseconds()
    }
    function reset() {
        root.eclipsed = null
        root.now = null
        root.started = false
    }
    onRunningChanged: {
        if (running == true) {
            root.now = Date.now()
        }
    }
}
