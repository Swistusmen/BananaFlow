import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Item {
    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"  // Light background for the main container

        ColumnLayout {
            anchors.fill: parent
            spacing: 20
            anchors.margins: 20

            RowLayout {
                spacing: 10
                anchors.fill: parent

                // Left side: inputs
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.5
                    spacing: 10

                    // Age input
                    Rectangle {
                        color: "white" // Background set to white
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
                                 Rectangle {
                                    color: "white"
                                    border.color: "gray"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    // Accumulated pension capital input
                    Rectangle {
                        color: "white" // Background set to white
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
                                 Rectangle {
                                    color: "white"
                                    border.color: "black"
                                    border.width: 1
                                }
                            }
                        }
                    }

                    // Gender input
                    Rectangle {
                        color: "white" // Background set to white
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 60

                        RowLayout {
                            spacing: 10
                            anchors.fill: parent
                            anchors.margins: 10


                            Text {
                                text: qsTr("Gender:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }




                            Rectangle {
                                        color: "lightblue" // Background set to light blue for the input
                                        border.color: "gray"
                                        border.width: 1
                                        width: 100 // Adjust width as needed
                                        height: parent.height // Match height of the outer rectangle

                                        TextInput {
                                            anchors.fill: parent // Make the TextInput fill the Rectangle
                                            text: qsTr("Enter gender")
                                            color: "black"

                                        }
                                    }
                        }
                    }
                }

                // Right side: calculate button and sum display
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.5
                    spacing: 10

                    Button {
                        text: "Calculate"
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: parent.width * 0.8
                    }

                    Rectangle {
                        color: "white" // Background set to white
                        border.color: "gray"
                        border.width: 1
                        Layout.fillWidth: true
                        height: 50

                        Text {
                            text: qsTr("Suma: liczba")
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
