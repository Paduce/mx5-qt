import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "theme"
import "../modules/core"
import "../modules/android-auto"

DashboardWindow {
    id: root
    visible: true
    width: 1024
    height: 600
    title: "Car Dashboard"
    
    // Set the theme for the dashboard
    Theme {
        id: theme
        darkMode: true
    }
    
    // Background
    Rectangle {
        anchors.fill: parent
        color: theme.backgroundColor
    }
    
    // Dashboard header
    Rectangle {
        id: header
        width: parent.width
        height: 60
        color: theme.primaryColor
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            
            Text {
                text: "Car Dashboard"
                color: "white"
                font.pixelSize: 24
                Layout.alignment: Qt.AlignLeft
            }
            
            Row {
                Layout.alignment: Qt.AlignRight
                spacing: 10
                
                Text {
                    text: Qt.formatDateTime(new Date(), "hh:mm")
                    color: "white"
                    font.pixelSize: 24
                    anchors.verticalCenter: parent.verticalCenter
                    
                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: parent.text = Qt.formatDateTime(new Date(), "hh:mm")
                    }
                }
            }
        }
    }
    
    // Module container
    Rectangle {
        id: contentArea
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "transparent"
        
        // Load the Android Auto module
        AndroidAutoModule {
            id: androidAutoModule
            anchors.fill: parent
            visible: active
            active: false // Will be set to true when USB device connects
            
            // For demo purposes, toggle Android Auto with a key press
            // In a real implementation, this would be triggered by USB detection
            Keys.onPressed: {
                if (event.key === Qt.Key_A) {
                    active = !active;
                }
            }
        }
        
        // Dashboard home screen (shown when no module is active)
        Rectangle {
            anchors.fill: parent
            color: theme.backgroundColor
            visible: !androidAutoModule.active
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                
                Text {
                    text: "Welcome to Your Car Dashboard"
                    color: theme.textColor
                    font.pixelSize: 32
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Connect your Android device via USB to start Android Auto"
                    color: theme.textColor
                    font.pixelSize: 18
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Button {
                    text: "Simulate USB Connection"
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: {
                        androidAutoModule.active = true;
                    }
                }
            }
        }
    }
    
    // Set focus to receive key events
    Component.onCompleted: {
        contentArea.forceActiveFocus();
    }
}