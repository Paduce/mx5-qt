// In main.qml, update the imports and component usage:

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "theme"
import "../modules/core"

// Remove this line: 
// import "../modules/android-auto" as AndroidAuto

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
        
        // Load the Android Auto module with direct import
        Loader {
            id: androidAutoLoader
            anchors.fill: parent
            source: "../modules/android-auto/AndroidAutoModule.qml"
            asynchronous: false
            
            // This property will be accessible in the loaded module
            property bool active: status === Loader.Ready && item && item.active
            
            onLoaded: {
                console.log("AndroidAutoModule loaded")
            }
            
            onStatusChanged: {
                console.log("AndroidAutoLoader status: " + status)
                if (status === Loader.Error) {
                    console.error("Failed to load AndroidAutoModule")
                }
            }
        }
        
        // Dashboard home screen (shown when no module is active)
        Rectangle {
            anchors.fill: parent
            color: theme.backgroundColor
            visible: !androidAutoLoader.active
            
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
            }
        }
    }
    
    // Set focus to receive key events
    Component.onCompleted: {
        contentArea.forceActiveFocus()
    }
}