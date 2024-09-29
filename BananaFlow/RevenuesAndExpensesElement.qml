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

        property var expenseArray: ["Element 1", "Element 2", "Element 3"]
        property int incomeFieldsMargin: 5
        property double allIncomes: 0
        property double allExpenses: 0
        property double cashFlows: 0
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
                        text: qsTr("Add Income")
                        onClicked: {
                            listView.model.append({
                                                      "name": "",
                                                      "amount": "",
                                                      "tax": "",
                                                      "netto": "",
                                                      "checked": false
                                                  })
                        }
                    }

                    Button {
                        text: qsTr("Remove Income")
                        enabled: home.incomeArrays.length > 0
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

                            var total = 0

                            for (var i = 0; i < listView.model.count; i++) {
                                var nettoValue = Number(
                                            listView.model.get(i).netto)
                                if (!isNaN(nettoValue)) {
                                    total += nettoValue
                                }
                            }

                            sumOfAllIncomes.text = "Sum of incomes: " + total
                            home.allIncomes = total
                            monthlyCashFlows.text = "Cash flow: " + home.cashFlows
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
                            amount: ""
                            tax: ""
                            netto: ""
                            checked: false
                        }
                        ListElement {
                            name: ""
                            amount: ""
                            tax: ""
                            netto: ""
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
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Amount:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {

                                        width: 30
                                        text: model.amount
                                        onTextChanged: {
                                            model.amount = text
                                        }
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Tax:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {

                                        width: 30
                                        text: model.tax
                                        onTextChanged: {
                                            model.tax = text

                                            if (text != "") {
                                                var income = Number(
                                                            model.amount)
                                                var tax = Number(model.tax)
                                                model.netto = income - income * tax / 100

                                                var total = 0

                                                for (var i = 0; i < listView.model.count; i++) {
                                                    var nettoValue = Number(
                                                                listView.model.get(
                                                                    i).netto)
                                                    if (!isNaN(nettoValue)) {
                                                        total += nettoValue
                                                    }
                                                }

                                                sumOfAllIncomes.text = "Sum of incomes: " + total
                                                home.allIncomes = total
                                                monthlyCashFlows.text = "Cash flow: "
                                                        + home.cashFlows
                                            }
                                        }
                                    }
                                }

                                RowLayout {
                                    spacing: home.incomeFieldsMargin

                                    Text {
                                        text: "Netto:"
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    TextField {
                                        text: model.netto
                                        width: 30
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    width: 200
                    height: 50
                    color: "lightgray"
                    border.color: "black"
                    border.width: 1
                    anchors.right: parent.right
                    radius: 5 // Zaokrąglone rogi

                    Text {
                        id: sumOfAllIncomes
                        text: "Sum of incomes: " + (home.incomeArrays.length)
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        horizontalAlignment: Text.AlignRight
                        color: "black"
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }
            }

            ColumnLayout {
                anchors.left: parent.left
                anchors.margins: 20

                RowLayout {
                    spacing: 20

                    Button {
                        text: qsTr("Add Expense")
                        onClicked: {
                            expensesListView.model.append({
                                                              "name": "",
                                                              "amount": "",
                                                              "checked": false
                                                          })
                        }
                    }

                    Button {
                        text: qsTr("Remove expense")
                        enabled: home.incomeArrays.length > 0
                        onClicked: {
                            var itemsToRemove = []

                            for (var i = 0; i < expensesListView.model.count; i++) {
                                if (expensesListView.model.get(i).checked) {
                                    itemsToRemove.push(i)
                                }
                            }

                            for (var j = itemsToRemove.length - 1; j >= 0; j--) {
                                expensesListView.model.remove(itemsToRemove[j])
                            }

                            var total = 0

                            for (var i = 0; i < expensesListView.model.count; i++) {
                                var amountValue = Number(
                                            expensesListView.model.get(
                                                i).amount)
                                if (!isNaN(amountValue)) {
                                    total += amountValue
                                }
                            }
                            sumOfExpenses.text = "Sum of expenses: " + total
                            home.allExpenses = total
                            home.cashFlows = home.allIncomes - home.allExpenses
                            monthlyCashFlows.text = "Cash flow: " + home.cashFlows
                        }
                    }
                }

                ListView {
                    id: expensesListView
                    width: 570
                    height: 150
                    clip: true

                    model: ListModel {
                        ListElement {
                            name: ""
                            amount: ""
                            checked: false
                        }
                        ListElement {
                            name: ""
                            amount: ""
                            checked: false
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
                                        onTextChanged: {
                                            model.amount = text

                                            var total = 0

                                            for (var i = 0; i < expensesListView.model.count; i++) {
                                                var amountValue = Number(
                                                            expensesListView.model.get(
                                                                i).amount)
                                                if (!isNaN(amountValue)) {
                                                    total += amountValue
                                                }
                                            }
                                            sumOfExpenses.text = "Sum of expenses: " + total
                                            home.allExpenses = total
                                            home.cashFlows = home.allIncomes - home.allExpenses
                                            monthlyCashFlows.text = "Cash flow: " + home.cashFlows
                                        }
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

            RowLayout {
                anchors.right: parent.right
                anchors.margins: 20
                anchors.bottom: parent.bottom

                Rectangle {
                    width: 200
                    height: 50
                    color: "lightgray"
                    border.color: "black"
                    border.width: 1
                    radius: 5

                    Text {
                        id: sumOfExpenses
                        text: "Sum of expenses: "
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        horizontalAlignment: Text.AlignRight
                        color: "black"
                    }
                }

                Rectangle {
                    width: 200
                    height: 50
                    color: "lightgray"
                    border.color: "black"
                    border.width: 1
                    radius: 5

                    Text {
                        id: monthlyCashFlows
                        text: "Cash Flows: " + (home.incomeArrays.length)
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
}
