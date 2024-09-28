import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Item {

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "lightgray"
            border.color: "gray"
            border.width: 1
            //Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.width: 50
            Layout.margins: 10
        }


    }
}
