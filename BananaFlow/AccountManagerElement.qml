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
        property real totalEarnings: 0

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
                    width: 1000  // Zwiększ szerokość listy
                    height: 300  // Zwiększ wysokość listy
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

            // Dodanie przycisku "Calculate"
            Button {
                text: qsTr("Calculate")
                width: 150
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var total = 0;
                    for (var i = 0; i < listView.model.count; i++) {
                        var amount = parseFloat(listView.model.get(i).amount);
                        var time = parseFloat(listView.model.get(i).time);
                        var interestRate = parseFloat(listView.model.get(i).interestRate);

                        // Obliczanie zysku z jednego elementu
                        var profit = amount * time / 12 * interestRate*0.01 * 0.81;
                        total += profit;
                    }
                    home.totalEarnings = total;  // Zapisz wynik
                }
            }

            // Prostokąt z tekstem na dole
            Rectangle {
                width: 1000  // Dopasuj szerokość do listy
                height: 50
                color: "#e0e0e0"
                border.color: "black"
                border.width: 2
                radius: 5
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "Money earned (after tax): $" + home.totalEarnings.toFixed(2)
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                }
            }
        }
    }
}
