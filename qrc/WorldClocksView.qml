import QtQuick 2.0
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0

Rectangle {
    clip: true
    id: root
    Kirigami.Theme.colorSet: Kirigami.Theme.View
    color: Kirigami.Theme.backgroundColor
    Settings {
        property alias tz: root.timezones
    }

    property var timezones: []
    readonly property var offsets: [{"abbr": "ACDT",	"name": "Australian Central Daylight Savings Time",	"offset": 10.5},
        {"abbr": "ACST",	"name": "Australian Central Standard Time",	"offset": 09.5},
        {"abbr": "ACT",	"name": "Acre Time",	"offset": -05},
        {"abbr": "ADT",	"name": "Atlantic Daylight Time",	"offset": -03},
        {"abbr": "AEDT",	"name": "Australian Eastern Daylight Savings Time",	"offset": 11},
        {"abbr": "AEST",	"name": "Australian Eastern Standard Time",	"offset": 10},
        {"abbr": "AFT",	"name": "Afghanistan Time",	"offset": 04.5},
        {"abbr": "AKDT",	"name": "Alaska Daylight Time",	"offset": -08},
        {"abbr": "AKST",	"name": "Alaska Standard Time",	"offset": -09},
        {"abbr": "ALMT",	"name": "Alma-Ata Time",	"offset": 06},
        {"abbr": "AMST",	"name": "Amazon Summer Time (Brazil)",	"offset": -03},
        {"abbr": "AMT",	"name": "Amazon Time (Brazil)",	"offset": -04},
        {"abbr": "AMT",	"name": "Armenia Time",	"offset": 04},
        {"abbr": "ANAT",	"name": "Anadyr Time",	"offset": 12},
        {"abbr": "AQTT",	"name": "Aqtobe Time",	"offset": 05},
        {"abbr": "ART",	"name": "Argentina Time",	"offset": -03},
        {"abbr": "AST",	"name": "Arabia Standard Time",	"offset": 03},
        {"abbr": "AST",	"name": "Atlantic Standard Time",	"offset": -04},
        {"abbr": "AWST",	"name": "Australian Western Standard Time",	"offset": 08},
        {"abbr": "AZOST",	"name": "Azores Summer Time",	"offset": 00},
        {"abbr": "AZOT",	"name": "Azores Standard Time",	"offset": -01},
        {"abbr": "AZT",	"name": "Azerbaijan Time",	"offset": 04},
        {"abbr": "BDT",	"name": "Brunei Time",	"offset": 08},
        {"abbr": "BIOT",	"name": "British Indian Ocean Time",	"offset": 06},
        {"abbr": "BIT",	"name": "Baker Island Time",	"offset": -12},
        {"abbr": "BOT",	"name": "Bolivia Time",	"offset": -04},
        {"abbr": "BRST",	"name": "Brasília Summer Time",	"offset": -02},
        {"abbr": "BRT",	"name": "Brasília Time",	"offset": -03},
        {"abbr": "BST",	"name": "Bangladesh Standard Time",	"offset": 06},
        {"abbr": "BST",	"name": "Bougainville Standard Time",	"offset": 11},
        {"abbr": "BTT",	"name": "Bhutan Time",	"offset": 06},
        {"abbr": "CAT",	"name": "Central Africa Time",	"offset": 02},
        {"abbr": "CCT",	"name": "Cocos Islands Time",	"offset": 06.5},
        {"abbr": "CDT",	"name": "Central Daylight Time (North America)",	"offset": -05},
        {"abbr": "CDT",	"name": "Cuba Daylight Time",	"offset": -04},
        {"abbr": "CEST",	"name": "Central European Summer Time (Cf. HAEC)",	"offset": 02},
        {"abbr": "CET",	"name": "Central European Time",	"offset": 01},
        {"abbr": "CHADT",	"name": "Chatham Daylight Time",	"offset": 13.75},
        {"abbr": "CHAST",	"name": "Chatham Standard Time",	"offset": 12.75},
        {"abbr": "CHOT",	"name": "Choibalsan Standard Time",	"offset": 08},
        {"abbr": "CHOST",	"name": "Choibalsan Summer Time",	"offset": 09},
        {"abbr": "CHST",	"name": "Chamorro Standard Time",	"offset": 10},
        {"abbr": "CHUT",	"name": "Chuuk Time",	"offset": 10},
        {"abbr": "CIST",	"name": "Clipperton Island Standard Time",	"offset": -08},
        {"abbr": "CIT",	"name": "Central Indonesia Time",	"offset": 08},
        {"abbr": "CKT",	"name": "Cook Island Time",	"offset": -10},
        {"abbr": "CLST",	"name": "Chile Summer Time",	"offset": -03},
        {"abbr": "CLT",	"name": "Chile Standard Time",	"offset": -04},
        {"abbr": "COST",	"name": "Colombia Summer Time",	"offset": -04},
        {"abbr": "COT",	"name": "Colombia Time",	"offset": -05},
        {"abbr": "CST",	"name": "Central Standard Time (North America)",	"offset": -06},
        {"abbr": "CST",	"name": "China Standard Time",	"offset": 08},
        {"abbr": "CST",	"name": "Cuba Standard Time",	"offset": -05},
        {"abbr": "CT", "name": "China Time",	"offset": 08},
        {"abbr": "CVT",	"name": "Cape Verde Time",	"offset": -01},
        {"abbr": "CXT",	"name": "Christmas Island Time",	"offset": 07},
        {"abbr": "DAVT",	"name": "Davis Time",	"offset": 07},
        {"abbr": "DDUT",	"name": "Dumont d'Urville Time",	"offset": 10},
        {"abbr": "DFT",	"name": "AIX-specific equivalent of Central European Time[NB 1]",	"offset": 01},
        {"abbr": "EASST",	"name": "Easter Island Summer Time",	"offset": -05},
        {"abbr": "EAST",	"name": "Easter Island Standard Time",	"offset": -06},
        {"abbr": "EAT",	"name": "East Africa Time",	"offset": 03},
        {"abbr": "ECT",	"name": "Eastern Caribbean Time",	"offset": -04},
        {"abbr": "ECT",	"name": "Ecuador Time",	"offset": -05},
        {"abbr": "EDT",	"name": "Eastern Daylight Time (North America)",	"offset": -04},
        {"abbr": "EEST",	"name": "Eastern European Summer Time",	"offset": 03},
        {"abbr": "EET",	"name": "Eastern European Time",	"offset": 02},
        {"abbr": "EGST",	"name": "Eastern Greenland Summer Time",	"offset": 00},
        {"abbr": "EGT",	"name": "Eastern Greenland Time",	"offset": -01},
        {"abbr": "EIT",	"name": "Eastern Indonesian Time",	"offset": 09},
        {"abbr": "EST",	"name": "Eastern Standard Time (North America)",	"offset": -05},
        {"abbr": "FET",	"name": "Further-eastern European Time",	"offset": 03},
        {"abbr": "FJT",	"name": "Fiji Time",	"offset": 12},
        {"abbr": "FKST",	"name": "Falkland Islands Summer Time",	"offset": -03},
        {"abbr": "FKT",	"name": "Falkland Islands Time",	"offset": -04},
        {"abbr": "FNT",	"name": "Fernando de Noronha Time",	"offset": -02},
        {"abbr": "GALT",	"name": "Galápagos Time",	"offset": -06},
        {"abbr": "GAMT",	"name": "Gambier Islands Time",	"offset": -09},
        {"abbr": "GET",	"name": "Georgia Standard Time",	"offset": 04},
        {"abbr": "GFT",	"name": "French Guiana Time",	"offset": -03},
        {"abbr": "GILT",	"name": "Gilbert Island Time",	"offset": 12},
        {"abbr": "GIT",	"name": "Gambier Island Time",	"offset": -09},
        {"abbr": "GMT",	"name": "Greenwich Mean Time",	"offset": 00},
        {"abbr": "GST",	"name": "South Georgia and the South Sandwich Islands Time",	"offset": -02},
        {"abbr": "GST",	"name": "Gulf Standard Time",	"offset": 04},
        {"abbr": "GYT",	"name": "Guyana Time",	"offset": -04},
        {"abbr": "HDT",	"name": "Hawaii–Aleutian Daylight Time",	"offset": -09},
        {"abbr": "HAEC",	"name": "Heure Avancée d'Europe Centrale",	"offset": 02},
        {"abbr": "HST",	"name": "Hawaii–Aleutian Standard Time",	"offset": -10},
        {"abbr": "HKT",	"name": "Hong Kong Time",	"offset": 08},
        {"abbr": "HMT",	"name": "Heard and McDonald Islands Time",	"offset": 05},
        {"abbr": "HOVT",	"name": "Hovd Time",	"offset": 07},
        {"abbr": "ICT",	"name": "Indochina Time",	"offset": 07},
        {"abbr": "IDLW",	"name": "International Day Line West time zone",	"offset": -12},
        {"abbr": "IDT",	"name": "Israel Daylight Time",	"offset": 03},
        {"abbr": "IOT",	"name": "Indian Ocean Time",	"offset": 03},
        {"abbr": "IRDT",	"name": "Iran Daylight Time",	"offset": 04.5},
        {"abbr": "IRKT",	"name": "Irkutsk Time",	"offset": 08},
        {"abbr": "IRST",	"name": "Iran Standard Time",	"offset": 03.5},
        {"abbr": "IST",	"name": "Indian Standard Time",	"offset": 05.5},
        {"abbr": "IST",	"name": "Irish Standard Time",	"offset": 01},
        {"abbr": "IST",	"name": "Israel Standard Time",	"offset": 02},
        {"abbr": "JST",	"name": "Japan Standard Time",	"offset": 09},
        {"abbr": "KALT",	"name": "Kaliningrad Time",	"offset": 02},
        {"abbr": "KGT",	"name": "Kyrgyzstan Time",	"offset": 06},
        {"abbr": "KOST",	"name": "Kosrae Time",	"offset": 11},
        {"abbr": "KRAT",	"name": "Krasnoyarsk Time",	"offset": 07},
        {"abbr": "KST",	"name": "Korea Standard Time",	"offset": 09},
        {"abbr": "LHST",	"name": "Lord Howe Standard Time",	"offset": 10.5},
        {"abbr": "LHST",	"name": "Lord Howe Summer Time",	"offset": 11},
        {"abbr": "LINT",	"name": "Line Islands Time",	"offset": 14},
        {"abbr": "MAGT",	"name": "Magadan Time",	"offset": 12},
        {"abbr": "MART",	"name": "Marquesas Islands Time",	"offset": -09.5},
        {"abbr": "MAWT",	"name": "Mawson Station Time",	"offset": 05},
        {"abbr": "MDT",	"name": "Mountain Daylight Time",	"offset": -06},
        {"abbr": "MET",	"name": "Middle European Time",	"offset": 01},
        {"abbr": "MEST",	"name": "Middle European Summer Time",	"offset": 02},
        {"abbr": "MHT",	"name": "Marshall Islands Time",	"offset": 12},
        {"abbr": "MIST",	"name": "Macquarie Island Station Time",	"offset": 11},
        {"abbr": "MIT",	"name": "Marquesas Islands Time",	"offset": -09.5},
        {"abbr": "MMT",	"name": "Myanmar Standard Time",	"offset": 06.5},
        {"abbr": "MSK",	"name": "Moscow Time",	"offset": 03},
        {"abbr": "MST",	"name": "Malaysia Standard Time",	"offset": 08},
        {"abbr": "MST",	"name": "Mountain Standard Time (North America)",	"offset": -07},
        {"abbr": "MUT",	"name": "Mauritius Time",	"offset": 04},
        {"abbr": "MVT",	"name": "Maldives Time",	"offset": 05},
        {"abbr": "MYT",	"name": "Malaysia Time",	"offset": 08},
        {"abbr": "NCT",	"name": "New Caledonia Time",	"offset": 11},
        {"abbr": "NDT",	"name": "Newfoundland Daylight Time",	"offset": -02.5},
        {"abbr": "NFT",	"name": "Norfolk Island Time",	"offset": 11},
        {"abbr": "NOVT",	"name": "Novosibirsk Time ",	"offset": 07},
        {"abbr": "NPT",	"name": "Nepal Time",	"offset": 05.75},
        {"abbr": "NST",	"name": "Newfoundland Standard Time",	"offset": -03.5},
        {"abbr": "NT",	"name": "Newfoundland Time",	"offset": -03.5},
        {"abbr": "NUT",	"name": "Niue Time",	"offset": -11},
        {"abbr": "NZDT",	"name": "New Zealand Daylight Time",	"offset": 13},
        {"abbr": "NZST",	"name": "New Zealand Standard Time",	"offset": 12},
        {"abbr": "OMST",	"name": "Omsk Time",	"offset": 06},
        {"abbr": "ORAT",	"name": "Oral Time",	"offset": 05},
        {"abbr": "PDT",	"name": "Pacific Daylight Time (North America)",	"offset": -07},
        {"abbr": "PET",	"name": "Peru Time",	"offset": -05},
        {"abbr": "PETT",	"name": "Kamchatka Time",	"offset": 12},
        {"abbr": "PGT",	"name": "Papua New Guinea Time",	"offset": 10},
        {"abbr": "PHOT",	"name": "Phoenix Island Time",	"offset": 13},
        {"abbr": "PHT",	"name": "Philippine Time",	"offset": 08},
        {"abbr": "PKT",	"name": "Pakistan Standard Time",	"offset": 05},
        {"abbr": "PMDT",	"name": "Saint Pierre and Miquelon Daylight Time",	"offset": -02},
        {"abbr": "PMST",	"name": "Saint Pierre and Miquelon Standard Time",	"offset": -03},
        {"abbr": "PONT",	"name": "Pohnpei Standard Time",	"offset": 11},
        {"abbr": "PST",	"name": "Pacific Standard Time (North America)",	"offset": -08},
        {"abbr": "PST",	"name": "Philippine Standard Time",	"offset": 08},
        {"abbr": "PYST",	"name": "Paraguay Summer Time",	"offset": -03},
        {"abbr": "PYT",	"name": "Paraguay Time",	"offset": -04},
        {"abbr": "RET",	"name": "Réunion Time",	"offset": 04},
        {"abbr": "ROTT",	"name": "Rothera Research Station Time",	"offset": -03},
        {"abbr": "SAKT",	"name": "Sakhalin Island Time",	"offset": 11},
        {"abbr": "SAMT",	"name": "Samara Time",	"offset": 04},
        {"abbr": "SAST",	"name": "South African Standard Time",	"offset": 02},
        {"abbr": "SBT",	"name": "Solomon Islands Time",	"offset": 11},
        {"abbr": "SCT",	"name": "Seychelles Time",	"offset": 04},
        {"abbr": "SDT",	"name": "Samoa Daylight Time",	"offset": -10},
        {"abbr": "SGT",	"name": "Singapore Time",	"offset": 08},
        {"abbr": "SLST",	"name": "Sri Lanka Standard Time",	"offset": 05.5},
        {"abbr": "SRET",	"name": "Srednekolymsk Time",	"offset": 11},
        {"abbr": "SRT",	"name": "Suriname Time",	"offset": -03},
        {"abbr": "SST",	"name": "Samoa Standard Time",	"offset": -11},
        {"abbr": "SST",	"name": "Singapore Standard Time",	"offset": 08},
        {"abbr": "SYOT",	"name": "Showa Station Time",	"offset": 03},
        {"abbr": "TAHT",	"name": "Tahiti Time",	"offset": -10},
        {"abbr": "THA",	"name": "Thailand Standard Time",	"offset": 07},
        {"abbr": "TFT",	"name": "French Southern and Antarctic Time",	"offset": 05},
        {"abbr": "TJT",	"name": "Tajikistan Time",	"offset": 05},
        {"abbr": "TKT",	"name": "Tokelau Time",	"offset": 13},
        {"abbr": "TLT",	"name": "Timor Leste Time",	"offset": 09},
        {"abbr": "TMT",	"name": "Turkmenistan Time",	"offset": 05},
        {"abbr": "TRT",	"name": "Turkey Time",	"offset": 03},
        {"abbr": "TOT",	"name": "Tonga Time",	"offset": 13},
        {"abbr": "TVT",	"name": "Tuvalu Time",	"offset": 12},
        {"abbr": "ULAST",	"name": "Ulaanbaatar Summer Time",	"offset": 09},
        {"abbr": "ULAT",	"name": "Ulaanbaatar Standard Time",	"offset": 08},
        {"abbr": "UTC",	"name": "Coordinated Universal Time",	"offset": 00},
        {"abbr": "UYST",	"name": "Uruguay Summer Time",	"offset": -02},
        {"abbr": "UYT",	"name": "Uruguay Standard Time",	"offset": -03},
        {"abbr": "UZT",	"name": "Uzbekistan Time",	"offset": 05},
        {"abbr": "VET",	"name": "Venezuelan Standard Time",	"offset": -04},
        {"abbr": "VLAT",	"name": "Vladivostok Time",	"offset": 10},
        {"abbr": "VOLT",	"name": "Volgograd Time",	"offset": 04},
        {"abbr": "VOST",	"name": "Vostok Station Time",	"offset": 06},
        {"abbr": "VUT",	"name": "Vanuatu Time",	"offset": 11},
        {"abbr": "WAKT",	"name": "Wake Island Time",	"offset": 12},
        {"abbr": "WAST",	"name": "West Africa Summer Time",	"offset": 02},
        {"abbr": "WAT",	"name": "West Africa Time",	"offset": 01},
        {"abbr": "WEST",	"name": "Western European Summer Time",	"offset": 01},
        {"abbr": "WET",	"name": "Western European Time",	"offset": 00},
        {"abbr": "WIT",	"name": "Western Indonesian Time",	"offset": 07},
        {"abbr": "WST",	"name": "Western Standard Time",	"offset": 08},
        {"abbr": "YAKT",	"name": "Yakutsk Time",	"offset": 09},
        {"abbr": "YEKT",	"name": "Yekaterinburg Time",	"offset": 05}]

    Timer {
        id: tock
        interval: 900
        running: true
        repeat: true
        onTriggered: {
            yourTime.text = new Date().toLocaleTimeString(null, Locale.ShortFormat)
        }
    }
    function calcTimeForUTCOffset(offset) { // Offset is given in hours
        var d = new Date();
        var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
        var nd = new Date(utc + (3600000*offset));
        return nd;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: Kirigami.Units.largeSpacing
        spacing: 0

        Kirigami.Heading {
            z: 99
            id: yourTime
            font.pointSize: 30
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: "0"
        }
        Kirigami.Separator {
            Layout.fillWidth: true
        }
        ListView {
            z: 98
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: root.timezones
            id: listy
            bottomMargin: rund.height + (Kirigami.Units.largeSpacing * 2)
            clip: true
            boundsBehavior: Flickable.StopAtBounds

            delegate: Kirigami.SwipeListItem {
                ColumnLayout {
                    Kirigami.Heading {
                        Layout.topMargin: Kirigami.Units.largeSpacing
                        Layout.alignment: Qt.AlignHCenter
                        id: head
                    }
                    Kirigami.Heading {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.bottomMargin: Kirigami.Units.largeSpacing
                        id: zone
                        level: 4
                    }
                    Connections {
                        target: tock
                        onTriggered: {
                            head.text = root.calcTimeForUTCOffset(modelData["offset"]).toLocaleString(null, Locale.ShortFormat)
                            zone.text = modelData["name"]
                        }
                    }
                    Component.onCompleted: {
                        head.text = root.calcTimeForUTCOffset(modelData["offset"]).toLocaleString(null, Locale.ShortFormat)
                        zone.text = modelData["name"]
                    }
                }
                actions: [
                    Kirigami.Action {
                        iconName: "delete"
                        onTriggered: {
                            if (root.timezones.length === 1) {
                                root.timezones = []
                                return
                            }
                            root.timezones.splice(index, 1)
                            root.timezonesChanged()
                        }
                    }

                ]
            }
        }
    }

    RoundButton {
        z: 9999
        id: rund
        icon.name: "list-add"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Kirigami.Units.largeSpacing
        onClicked: {
            zones.open()
        }
    }
    Kirigami.OverlayDrawer {
        id: zones
        edge: Qt.BottomEdge
        height: parent.height / 2
        contentItem: ColumnLayout {
            Kirigami.Heading {
                Layout.margins: Kirigami.Units.largeSpacing
                text: "Select a timezone..."
            }
            ListView {
                clip: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                model: root.offsets
                delegate: Kirigami.BasicListItem {
                    label: modelData["name"]
                    onClicked: {
                        root.timezones.push(modelData)
                        root.timezonesChanged()
                        zones.close()
                    }
                }
            }
        }
    }
}
