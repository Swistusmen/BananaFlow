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
        color: "#f0f0f0"

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
                            listView.model.append({
                                                      "name": "",
                                                      "amount": 0,
                                                      "interestRate": 0,
                                                      "time": 0,
                                                      "checked": false
                                                  })
                        }
                    }

                    Button {
                        text: qsTr("Remove Account")
                        enabled: home.goalArrays.length > 0
                        onClicked: {
                            var itemsToRemove = []

                            for (var i = 0; i < listView.model.count; i++) {
                                if (listView.model.get(i).checked) {
                                    itemsToRemove.push(i)
                                }
                            }

                            for (var j = itemsToRemove.length - 1; j >= 0; j--) {
                                listView.model.remove(itemsToRemove[j])
                            }
                        }
                    }
                }

                ListView {
                    id: listView
                    width: 950
                    height: 150
                    clip: true

                    model: ListModel {
                        ListElement {
                            checked: false
                            amount: 0
                            interestRate: 0
                            time: 0
                        }
                    }

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

                                CheckBox {
                                    checked: model.checked
                                    onCheckedChanged: {
                                        model.checked = checked
                                    }
                                }

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
                                        text: model.amount
                                        onTextChanged: model.amount = text
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
                                        text: model.time
                                        onTextChanged: model.time = text
                                        width: 30
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Interest rate:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        text: model.interestRate
                                        onTextChanged: model.interestRate = text
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
