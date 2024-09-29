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
                        text: qsTr("Add Goal")
                        onClicked: {
                            listView.model.append({
                                                      "name": "",
                                                      "amount": 0,
                                                      "time": "",
                                                      "collected": 0,
                                                      "checked": false
                                                  })
                        }
                    }

                    Button {
                        text: qsTr("Remove Goal")
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

                    Button {
                        text: qsTr("Complete Goal")
                        enabled: home.goalArrays.length > 0
                        onClicked: {
                            var itemsToRemove = [];
                            for (var i = 0; i < listView.model.count; i++) {
                                if (listView.model.get(i).checked) {
                                    itemsToRemove.push(i)
                                }
                            }


                            for (var j = 0; j < itemsToRemove.length; j++) {
                                        var index = itemsToRemove[j];
                                        var selectedGoal = listView.model.get(index);

                                        // Tworzymy nowy obiekt expenseItem
                                        var expenseItem = {
                                            name: selectedGoal.name,
                                            amount: selectedGoal.amount
                                        };

                                        // Dodajemy do expensesListView
                                        expensesListView.model.append(expenseItem);
                                    }


                            for (var j = itemsToRemove.length - 1; j >= 0; j--) {
                                listView.model.remove(itemsToRemove[j])
                            }

                            var total = 0

                            for (var i = 0; i < expensesListView.model.count; i++) {
                                var nettoValue = Number(
                                            expensesListView.model.get(i).amount)
                                if (!isNaN(nettoValue)) {
                                    total += nettoValue
                                }
                            }

                            sumOfMoneySpendForDreams.text="Sum of collected money: "+total

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
                            name: ""
                            collected: 0
                            amount: 0
                            time: ""
                            checked: false
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
                                        text: model.name
                                        onTextChanged: model.name = text
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
                                        onTextChanged: model.amount = Number(text)
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
                                    //TODO:change
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Collected:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        text: model.collected
                                        onTextChanged: model.collected = Number(text)
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

            ColumnLayout {
                anchors.left: parent.left
                anchors.margins: 20

                ListView {
                    id: expensesListView
                    width: 770
                    height: 150
                    clip: true

                    model: ListModel{
                        ListElement{
                            name: ""
                            amount: 0
                        }
                    }

                    delegate: Item {
                        width: expensesListView.width
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

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Name:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        text: model.name
                                        onTextChanged:model.name = text
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
                                        onTextChanged:model.amount = Number(text)
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

            Rectangle {
                width: 200
                height: 50
                color: "lightgray"
                border.color: "black"
                border.width: 1
                anchors.right: parent.right
                radius: 5

                Text {
                    id: sumOfMoneySpendForDreams
                    text: "Sum of collected money: " + (home.goalArrays.length)
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 10
                    horizontalAlignment: Text.AlignRight
                    color: "black"
                }
            }
        }
    }
}
