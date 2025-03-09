import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12
import QtQml 2.12
import org.viktorgino.headunit 1.0

Item {
    id: root
    
    // Properties
    property bool active: false
    property bool usbConnected: false
    
    // Signal handler for USB connection status changes
    // In a real application, this would be connected to your USB detection system
    onUsbConnectedChanged: {
        if (usbConnected) {
            // When USB is connected, attempt to start Android Auto
            androidAuto.init();
            androidAuto.startHU();
        } else {
            // When USB is disconnected, stop Android Auto
            androidAuto.stopHU();
            active = false;
        }
    }
    
    // Simulate USB detection for demo purposes
    // In a real app, you'd monitor actual USB connections
    Connections {
        target: root
        onActiveChanged: {
            if (active) {
                // Simulate USB connection when module becomes active
                usbConnected = true;
            } else {
                // Simulate USB disconnection when module becomes inactive
                usbConnected = false;
            }
        }
    }
    
    // Android Auto implementation
    AndroidAuto {
        id: androidAuto
        
        // Connect to signals
        onStatusChanged: {
            // Update module active state based on connection status
            if (status === 2) { // RUNNING
                root.active = true;
            }
        }
    }
    
    // Android Auto UI
    Rectangle {
        visible: androidAuto.status === 0 || androidAuto.status === 1
        width: parent.width * 0.6
        height: parent.height * 0.4
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#66000000"
        
        Text {
            visible: androidAuto.status === 0 // NO_CONNECTION
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Please connect a device"
            color: "#ffffff"
            font.pixelSize: 20
        }
        
        Text {
            visible: androidAuto.status === 1 // VIDEO_WAITING
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Waiting for video"
            color: "#ffffff"
            font.pixelSize: 20
        }
    }
    
    VideoOutput {
        id: aaVideo
        visible: androidAuto.status === 2 // RUNNING
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * androidAuto.videoHeight/androidAuto.videoWidth < parent.height ? 
               parent.width : parent.height * androidAuto.videoWidth/androidAuto.videoHeight
        height: parent.width * androidAuto.videoHeight/androidAuto.videoWidth < parent.height ? 
                parent.width * androidAuto.videoHeight/androidAuto.videoWidth : parent.height
        source: androidAuto
        
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: {
                androidAuto.mouseDown(Qt.point(mouse.x, mouse.y));
            }
            onPositionChanged: {
                androidAuto.mouseMove(Qt.point(mouse.x, mouse.y));
            }
            onReleased: {
                androidAuto.mouseUp(Qt.point(mouse.x, mouse.y));
            }
        }
        
        onWidthChanged: {
            androidAuto.outputWidth = aaVideo.width
        }
        onHeightChanged: {
            androidAuto.outputHeight = aaVideo.height
        }
        
        Component.onCompleted: {
            androidAuto.outputHeight = aaVideo.height
            androidAuto.outputWidth = aaVideo.width
        }
    }
    
    // Clean up when module is deactivated
    onActiveChanged: {
        if (!active) {
            // Stop Android Auto when module becomes inactive
            androidAuto.stopHU();
        }
    }
}