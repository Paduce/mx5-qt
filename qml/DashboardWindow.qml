import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"
    
    // Properties to manage window state
    property bool isFullScreen: false
    
    MouseArea {
        id: dragArea
        anchors.fill: parent
        property int startX: 0
        property int startY: 0
        
        onPressed: {
            startX = mouse.x
            startY = mouse.y
        }
        
        onPositionChanged: {
            if (pressed) {
                var dx = mouse.x - startX
                var dy = mouse.y - startY
                root.x += dx
                root.y += dy
            }
        }
        
        // Allow child items to receive mouse events
        propagateComposedEvents: true
        
        // Mouse regions for window controls
        MouseArea {
            id: closeButton
            width: 30
            height: 30
            anchors.right: parent.right
            anchors.top: parent.top
            hoverEnabled: true
            
            Rectangle {
                anchors.fill: parent
                color: parent.containsMouse ? "red" : "transparent"
                opacity: parent.containsMouse ? 0.8 : 0.0
                
                Text {
                    anchors.centerIn: parent
                    text: "✕"
                    color: "white"
                }
            }
            
            onClicked: root.close()
        }
        
        MouseArea {
            id: maximizeButton
            width: 30
            height: 30
            anchors.right: closeButton.left
            anchors.top: parent.top
            hoverEnabled: true
            
            Rectangle {
                anchors.fill: parent
                color: parent.containsMouse ? "lightgray" : "transparent"
                opacity: parent.containsMouse ? 0.8 : 0.0
                
                Text {
                    anchors.centerIn: parent
                    text: root.isFullScreen ? "❐" : "□"
                    color: "white"
                }
            }
            
            onClicked: {
                if (root.isFullScreen) {
                    root.showNormal()
                    root.isFullScreen = false
                } else {
                    root.showFullScreen()
                    root.isFullScreen = true
                }
            }
        }
        
        MouseArea {
            id: minimizeButton
            width: 30
            height: 30
            anchors.right: maximizeButton.left
            anchors.top: parent.top
            hoverEnabled: true
            
            Rectangle {
                anchors.fill: parent
                color: parent.containsMouse ? "lightgray" : "transparent"
                opacity: parent.containsMouse ? 0.8 : 0.0
                
                Text {
                    anchors.centerIn: parent
                    text: "_"
                    color: "white"
                }
            }
            
            onClicked: root.showMinimized()
        }
    }
}