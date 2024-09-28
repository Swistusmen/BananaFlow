import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick 2.15
import QtQuick.Dialogs 1.3

Item {
    Rectangle {
        id: home
        anchors.fill: parent
        anchors.centerIn: parent
        color: "blue"

        property var goalArrays: ["Element 1", "Element 2", "Element 3"]
        property var achievementsArray: ["Element 1", "Element 2", "Element 3"]
        property int incomeFieldsMargin: 5
        ColumnLayout {
            anchors.centerIn: parent
            anchors.fill: parent
            ColumnLayout {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 20

                RowLayout {
                    spacing: 20

                    Button {
                        text: qsTr("Add Account")
                        onClicked: {
                            var newElement = "Nowy element " + (home.goalArrays.length + 1)
                            home.goalArrays.push(newElement)
                            console.log(home.goalArrays)
                            listView.model = home.goalArrays
                        }
                    }

                    Button {
                        text: qsTr("Remove Account")
                        enabled: home.goalArrays.length > 0
                        onClicked: {
                            home.goalArrays.pop()
                            console.log(home.goalArrays)
                            listView.model = home.goalArrays
                        }
                    }
                }

                ListView {
                    id: listView
                    width: 950
                    height: 150
                    clip: true

                    model: home.goalArrays

                    delegate: Item {
                        width: listView.width
                        height: 40
                        Rectangle {
                            width: parent.width
                            height: parent.height
                            color: focus ? "lightblue" : "lightgray"
                            border.color: "black"
                            border.width: 1
                            RowLayout {
                                anchors.fill: parent

                                CheckBox {}

                                // Cztery pary nazw i pól tekstowych
                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Name:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        placeholderText: ""
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Amount:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        placeholderText: ""
                                        width: 30
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Time:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        placeholderText: ""
                                        width: 30
                                    }
                                }

                                RowLayout { //TODO:change
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Interest rate:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        placeholderText: ""
                                        width: 30
                                    }
                                }
                            }
                        }
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }
            }
        }
    }
}
