import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import "./"

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("BananaFlow")
    property int backboardMarginsValue: 10

    Rectangle{
        id: secondLayer
        width: parent.width
        height: parent.height
        color: "#52D3D8"
    }

    TabView
    {
    id: viewTab

    anchors.left: parent.left;
    anchors.top: parent.top;
    anchors.leftMargin: backboardMarginsValue
    anchors.rightMargin: backboardMarginsValue
    anchors.bottomMargin: backboardMarginsValue
    anchors.topMargin: backboardMarginsValue

    width: parent.width-2*backboardMarginsValue
    height: parent.height-2*backboardMarginsValue
    property double tabelementWidth: viewTab.width/6

    Binding
    {
    property: "tabIndex";
    value: viewTab.currentIndex;
    }

    Tab
    {
    title: qsTr("Home");
    width: viewTab.tabelementWidth
        HomeElement{
            id: home
            anchors.fill: parent
        }
    }

    Tab
    {
    title: qsTr("Revenues and Expenses View");
    width: viewTab.tabelementWidth
        RevenuesAndExpensesElement{
            id: revenuesAndExpenses
            anchors.fill: parent
        }
    }

    Tab{
        title:qsTr("Retirement")
        width: viewTab.tabelementWidth
        Rectangle{
            id: retirenmant
            anchors.fill: parent
            color: "green"
        }
    }

    Tab{
        title: qsTr("Financial Goals")
        width: viewTab.tabelementWidth
        FinancialGoals{
            id: financialGoals
            anchors.fill: parent
        }
    }

    Tab{
        title:qsTr("Forecasts")
        width: viewTab.tabelementWidth
        Rectangle{
            id: financialForecasts
            anchors.fill: parent
            color: "green"
        }
    }

    Tab{
        title:qsTr("Financial programs")
        width: viewTab.tabelementWidth
        Rectangle{
            id: financialPrograms
            anchors.fill: parent
            color: "green"
        }
    }
    }
}
