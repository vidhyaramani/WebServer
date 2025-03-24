import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 500
    title: "Colorful Panel"
    color: "#f5f7fa"  // Light gray

    property int counter: 0
    property bool timerRunning: false
    property string elapsedTime: "00:00:00"

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            counter++
            elapsedTime = new Date(counter * 1000).toISOString().substr(11, 8)
        }
    }

    // Main container with shadow
    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.9
        color: "#ffffff"
        radius: 10
        border.color: "#d1d8e0"
        border.width: 1

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            // Timer Control Section
            Rectangle {
                width: parent.width
                height: 120
                color: "#f3f9ff"  // light blue
                radius: 8
                border.color: "#a5c9ff"
                border.width: 2

                Column {
                    anchors.centerIn: parent
                    spacing: 12

                    Button {
                        id: startStopButton
                        text: timerRunning ? "⏹ STOP" : "▶ START"
                        width: 150
                        height: 45
                        font {
                            pixelSize: 16
                            bold: true
                        }

                        background: Rectangle {
                            color: timerRunning ? "#ff6b6b" : "#51cf66"  // Red//Green
                            radius: 6
                            border.color: Qt.darker(parent.color, 20)
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        onClicked: timerRunning = !timerRunning
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#d1d8e0"
                    }

                    TextField {
                        id: elapsedTimeField
                        width: 150
                        height: 40
                        readOnly: true
                        text: elapsedTime
                        font.pixelSize: 18
                        horizontalAlignment: TextInput.AlignHCenter

                        background: Rectangle {
                            color: "#f1f3f5"
                            radius: 5
                            border.color: "#adb5bd"
                        }
                    }
                }
            }

            // USB Devices Section
            Rectangle {
                width: parent.width
                height: 120
                color: "#f8f9fa"  // Off-white
                radius: 8
                border.color: "#ced4da"
                border.width: 2

                Column {
                    anchors.centerIn: parent
                    spacing: 12

                    Button {
                        text: "🔍 LIST USB DEVICES"
                        width: 200
                        height: 45
                        font.pixelSize: 14

                        background: Rectangle {
                            color: "#748ffc"  //blue
                            radius: 6
                            border.color: Qt.darker(parent.color, 20)
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                        }

                        onClicked: {
                            // USB logic
                        }
                    }

                    Rectangle {
                        width: 180
                        height: 30
                        color: "#e9ecef"
                        radius: 4
                        border.color: "#adb5bd"

                        Text {
                            anchors.centerIn: parent
                            text: "No devices connected"
                            color: "#495057"
                        }
                    }
                }
            }

            // Action Buttons
            Row {
                spacing: 15
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "EXIT"
                    width: 120
                    height: 40

                    background: Rectangle {
                        color: "#ff8787"  // Coral
                        radius: 5
                        border.color: Qt.darker(parent.color, 20)
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font.bold: true
                    }

                    onClicked: Qt.quit()
                }

                Button {
                    text: "CLEANUP"
                    width: 120
                    height: 40

                    background: Rectangle {
                        color: "#fcc419"  // Yellow
                        radius: 5
                        border.color: Qt.darker(parent.color, 20)
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#343a40"
                        font.bold: true
                    }

                    onClicked: {
                        // Cleanup logic
                    }
                }
            }

            // Counter Display
            Rectangle {
                width: 100
                height: 100
                radius: 50
                color: "#fff4e6"  // Peach
                border.color: "#ffa94d"
                border.width: 3
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent
                    text: counter
                    font {
                        pixelSize: 32
                        bold: true
                    }
                    color: "#e67700"
                }
            }
        }
    }
}
