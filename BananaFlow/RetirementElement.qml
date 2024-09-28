import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Item {
    Rectangle {
        id: home
        anchors.fill: parent
        color: "#f0f0f0"

        property int age:0
        property int ageOfRetirement: 60
        property double baseAmount: 0
        property double monthlyContribution:0
        property int lifeExpectancy:0


        ColumnLayout {
            anchors.fill: parent
            spacing: 20
            anchors.margins: 20

            RowLayout {
                spacing: 10
                anchors.fill: parent

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.5
                    spacing: 10

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10

                            Text {
                                text: qsTr("Your age:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 100
                                text: qsTr("Enter age")
                                color: "black"
                                onTextChanged: {
                                    var parsedAge = parseInt(text);

                                            if (!isNaN(parsedAge)) {
                                                home.age=parsedAge
                                            }
                                }
                                 Rectangle {
                                    color: "white"
                                    border.color: "gray"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10

                            Text {
                                text: qsTr("Accumulated pension capital:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 200
                                text: qsTr("Enter capital")
                                color: "black"
                                onTextChanged: {
                                    var parsedCapital = Number(text);

                                            if (!isNaN(parsedCapital)) {
                                                home.baseAmount = parsedCapital;
                                            }
                                }
                                 Rectangle {
                                    color: "white"
                                    border.color: "black"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10

                            Text {
                                text: qsTr("Age of retirement:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 100
                                text: qsTr("age of retirement")
                                color: "black"
                                onTextChanged: {
                                    var ageOfRetirement = parseInt(text);

                                            if (!isNaN(ageOfRetirement)) {
                                                home.ageOfRetirement = ageOfRetirement;
                                            }
                                }
                                 Rectangle {
                                    color: "white"
                                    border.color: "gray"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10

                            Text {
                                text: qsTr("Life expectancy :")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 200
                                text: qsTr("life expectancy (months)")
                                color: "black"
                                onTextChanged: {
                                    var lifeExpectancy = parseInt(text);

                                            if (!isNaN(lifeExpectancy)) {
                                                home.lifeExpectancy = lifeExpectancy;
                                            }
                                }
                                 Rectangle {
                                    color: "white"
                                    border.color: "black"
                                    border.width: 1
                                }
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.5
                    spacing: 10

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10

                            Text {
                                text: qsTr("Monthly retirement contribution:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 100
                                text: qsTr("amount")
                                color: "black"
                                onTextChanged: {

                                        var parsedMonthlyContribution = Number(text);

                                                if (!isNaN(parsedMonthlyContribution)) {
                                                    home.monthlyContribution = parsedMonthlyContribution;
                                                }

                                }
                                 Rectangle {
                                    color: "white"
                                    border.color: "gray"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    Button {
                        text: "Calculate"
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: parent.width * 0.8
                        onClicked: {
                            var currentRetirement=home.baseAmount/(home.lifeExpectancy-home.ageOfRetirement*12)
                            var givenRetirement=(home.baseAmount+(home.ageOfRetirement-home.age)*home.monthlyContribution)/(home.lifeExpectancy-home.ageOfRetirement*12)
                            targetRetirement.text="Target retirement "+givenRetirement
                            currentRetirement.text="Current "+currentRetirement
                        }
                    }

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 50

                        Text {
                            id: currentRetirement
                            text: qsTr("Retirement right now: liczba")
                            anchors.centerIn: parent
                            font.bold: true
                        }
                    }

                    Rectangle {
                        color: "white"
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 50

                        Text {
                            id: targetRetirement
                            text: qsTr("Retirement in target age: liczba")
                            anchors.centerIn: parent
                            font.bold: true
                        }
                    }
                }
            }

            Rectangle {
                color: "lightgray"
                border.color: "gray"
                border.width: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 10
            }
        }
    }
}
