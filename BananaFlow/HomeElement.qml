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
        color: "purple"

        property var incomeArrays: ["Element 1", "Element 2", "Element 3"]
        property var expenseArray: ["Element 1", "Element 2", "Element 3"]
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
                        text: qsTr("Add Income")
                        onClicked: {
                            var newElement = "Nowy element " + (home.incomeArrays.length + 1)
                            home.incomeArrays.push(newElement)
                            console.log(home.incomeArrays)
                            listView.model = home.incomeArrays
                        }
                    }

                    Button {
                        text: qsTr("Remove Income")
                        enabled: home.incomeArrays.length > 0
                        onClicked: {
                            home.incomeArrays.pop()
                            console.log(home.incomeArrays)
                            listView.model = home.incomeArrays
                        }
                    }
                }

                ListView {
                    id: listView
                    width: 950
                    height: 150
                    clip: true

                    model: home.incomeArrays

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
                                        text: "Tax:"
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
                                        text: "Netto:"
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

                Rectangle {
                                    width: 200
                                    height: 50
                                    color: "lightgray"
                                    border.color: "black"
                                    border.width: 1
                                    anchors.right: parent.right
                                    radius: 5  // Zaokrąglone rogi

                                    Text {
                                        text: "Sum of incomes: " + (home.incomeArrays.length)  // Możesz zmienić na konkretną logikę sumowania
                                        anchors.right: parent.right
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.rightMargin: 10  // Odstęp od prawej krawędzi
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
                            var newElement = "Nowy element " + (home.expenseArray.length + 1)
                            home.expenseArray.push(newElement)
                            console.log(home.expenseArray)
                            expensesListView.model = home.expenseArray
                        }
                    }

                    Button {
                        text: qsTr("Remove Expense")
                        enabled: home.expenseArray.length > 0
                        onClicked: {
                            home.expenseArray.pop()
                            console.log(home.expenseArray)
                            expensesListView.model = home.expenseArray
                        }
                    }
                }

                ListView {
                    id: expensesListView
                    width: 770
                    height: 150
                    clip: true

                    model: home.expenseArray

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
                            }
                        }
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }
            }

            RowLayout{
                anchors.right: parent.right
                anchors.margins: 20
                anchors.bottom: parent.bottom

            Rectangle {
                                width: 200
                                height: 50
                                color: "lightgray"
                                border.color: "black"
                                border.width: 1
                                radius: 5  // Zaokrąglone rogi

                                Text {
                                    text: "Sum of expenses: " + (home.incomeArrays.length)  // Możesz zmienić na konkretną logikę sumowania
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.rightMargin: 10  // Odstęp od prawej krawędzi
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
                                radius: 5  // Zaokrąglone rogi

                                Text {
                                    text: "Cash Flows: " + (home.incomeArrays.length)  // Możesz zmienić na konkretną logikę sumowania
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.rightMargin: 10  // Odstęp od prawej krawędzi
                                    horizontalAlignment: Text.AlignRight
                                    color: "black"
                                }
                            }
            }
        }
    }
}
