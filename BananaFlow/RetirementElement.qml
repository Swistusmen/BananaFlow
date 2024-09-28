import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtCharts 2.3
import QtQuick 2.15

Item {
    Rectangle {
        id: home
        anchors.fill: parent
        color: "#f0f0f0"

        property int age: 0
        property int ageOfRetirement: 60
        property double baseAmount: 0
        property double monthlyContribution: 0
        property int lifeExpectancy: 0
        property var percentages: [1, 1.05, 1.1, 1.15]
        property var lengths: [0, 0, 0, 0]
        property var setOfSets: [[], [], [], []]

        Timer {
            interval: 100 // 100 ms opóźnienia
            running: true
            repeat: false
            onTriggered: chartView.update()
        }

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
                                    var parsedAge = parseInt(text)

                                    if (!isNaN(parsedAge)) {
                                        home.age = parsedAge
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
                                    var parsedCapital = Number(text)

                                    if (!isNaN(parsedCapital)) {
                                        home.baseAmount = parsedCapital
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
                                    var ageOfRetirement = parseInt(text)

                                    if (!isNaN(ageOfRetirement)) {
                                        home.ageOfRetirement = ageOfRetirement
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
                                    var lifeExpectancy = parseInt(text)

                                    if (!isNaN(lifeExpectancy)) {
                                        home.lifeExpectancy = lifeExpectancy
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

                                    var parsedMonthlyContribution = Number(text)

                                    if (!isNaN(parsedMonthlyContribution)) {
                                        home.monthlyContribution = parsedMonthlyContribution
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
                            var currentRetirement = home.baseAmount
                                    / (home.lifeExpectancy - home.ageOfRetirement * 12)
                            var givenRetirement = (home.baseAmount
                                                   + (home.ageOfRetirement - home.age)
                                                   * home.monthlyContribution)
                                    / (home.lifeExpectancy - home.ageOfRetirement * 12)
                            targetRetirement.text = "Target retirement " + givenRetirement
                            currentRetirement.text = "Current " + currentRetirement

                            var length = (home.lifeExpectancy - home.ageOfRetirement * 12)
                            //var lenghts=[0,0,0,0]
                            defaultSeries.clear()
                            firstSet.clear()
                            secondSet.clear()
                            thirdSet.clear()

                            for (var i = 0; i < 4; i++) {

                                home.lengths[i] = home.percentages[i] * length
                            }

                            for (var i = 0; i < 4; i++) {
                                for (var j = 0; j < 4; j++) {
                                    home.setOfSets[i][j]
                                            = (home.baseAmount + (home.ageOfRetirement - home.age)
                                               * home.monthlyContribution
                                               * home.percentages[i]) / home.lengths[j]
                                }
                            }


                            for (var i = 0; i < 4; i++) {
                                defaultSeries.append(home.lengths[i],
                                                     home.setOfSets[0][i])
                            }

                            for (var i = 0; i < 4; i++) {

                                firstSet.append(home.lengths[i],
                                                home.setOfSets[1][i])
                            }

                            for (var i = 0; i < 4; i++) {
                                secondSet.append(home.lengths[i],
                                                 home.setOfSets[2][i])
                            }

                            for (var i = 0; i < 4; i++) {

                                thirdSet.append(home.lengths[i],home.setOfSets[3][i])
                            }

                            axisX.min = home.lengths[0]
                            axisX.max = home.lengths[3]

                            axisY.min = Math.min(home.setOfSets[0][0],
                                                 home.setOfSets[1][0],
                                                 home.setOfSets[2][0],
                                                 home.setOfSets[3][0])
                            axisY.max = Math.max(home.setOfSets[0][3],
                                                 home.setOfSets[1][3],
                                                 home.setOfSets[2][3],
                                                 home.setOfSets[3][3])

                            chartView.update()
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

                ChartView {
                    id: chartView
                    anchors.fill: parent
                    antialiasing: true

                    LineSeries {
                        id: defaultSeries
                        name: "default"
                        axisX: axisX
                        axisY: axisY
                        useOpenGL: true
                    }

                    LineSeries {
                        id: firstSet
                        name: "105%"
                        axisX: axisX
                        axisY: axisY
                        useOpenGL: true
                    }

                    LineSeries {
                        id: secondSet
                        name: "110%"
                        axisX: axisX
                        axisY: axisY
                        useOpenGL: true
                    }

                    LineSeries {
                        id: thirdSet
                        name: "115%"
                        axisX: axisX
                        axisY: axisY
                        useOpenGL: true
                    }

                    ValueAxis {
                        id: axisX
                        min: 100
                        max: 150

                        titleText: "Oś X"
                    }

                    ValueAxis {
                        id: axisY
                        min: 1000
                        max: 3000
                        titleText: "Oś Y"
                    }

                    axes: [axisX, axisY]
                }
            }
        }
    }
}
