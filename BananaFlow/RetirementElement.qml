import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Item {
    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"

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
                                text: qsTr("Gender:")
                                font.bold: true
                                Layout.alignment: Qt.AlignLeft
                            }

                            TextInput {
                                width: 100
                                text: qsTr("Enter gender")
                                color: "black"
                                 Rectangle {
                                    color: "white"
                                    border.color: "gray"
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

                    Button {
                        text: "Calculate"
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: parent.width * 0.8
                    }

                    Rectangle {
                        color: "white"
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
