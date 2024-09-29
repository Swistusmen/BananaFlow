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

            Text {
                text: " The Third Pillar of Retirement"
                font.pixelSize: 24
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                border.color: "black"
                border.width: 2
                radius: 10
                color: "lightgray"
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.fill: parent
                    text: "The third pillar of retirement refers to individual savings and investments that supplement government and employer-based pensions. It allows individuals to take greater control over their financial future by contributing to private accounts. Unlike mandatory systems, this pillar is voluntary, and its flexibility enables individuals to choose investment strategies tailored to their needs. These funds are usually managed through private pension plans, life insurance, or investment portfolios. The third pillar plays a crucial role in ensuring a more secure retirement, as it compensates for potential gaps left by the first two pillars of social security and workplace pensions."
                    font.pixelSize: 18
                    color: "black"
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.margins: 10
                }
            }

            Text {
                text: "The Importance of Understanding Cash Flows"
                font.pixelSize: 24
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                border.color: "black"
                border.width: 2
                radius: 10
                color: "lightgray"
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.fill: parent
                    text: "Understanding cash flows is essential for any business or personal financial planning. Cash flow represents the movement of money into and out of an account, helping to determine a company's or individual's liquidity. A positive cash flow ensures that there are enough funds to cover expenses, invest in growth, and manage debts. On the other hand, poor cash flow management can lead to financial instability, even if a business appears profitable on paper. Analyzing cash flows helps identify potential risks, plan for the future, and make informed decisions that keep finances healthy and sustainable in the long term."
                    font.pixelSize: 18
                    color: "black"
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.margins: 10
                }
            }


        }
    }
}
