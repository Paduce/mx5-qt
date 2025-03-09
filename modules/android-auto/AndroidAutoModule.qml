import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12
import QtQml 2.12
import org.viktorgino.headunit 1.0

Item {
    id: root
    width: 800
    height: 480

    // Properties
    property bool active: false
    property bool isConnecting: false
    property bool isConnected: false
    property string currentStatus: "Initializing"
    property int startTime: Date.now()
    property int connectionAttemptCount: 0
    property int maxConnectionAttempts: 5

    function debug(message) {
        var elapsed = Date.now() - startTime;
        console.log("[AA-DEBUG] " + elapsed + "ms: " + message);
    }

    function attemptConnection() {
        if (!isConnecting) {
            connectionAttemptCount++
            debug("Starting connection attempt #" + connectionAttemptCount)
            isConnecting = true
            currentStatus = "Connecting to Android Auto..."

            if (!androidAutoLoader.active) {
                debug("Activating AndroidAuto loader")
                androidAutoLoader.active = true
            } else {
                debug("Loader already active, starting connection")
                if (androidAutoLoader.item) {
                    debug("Starting headunit with item: " + androidAutoLoader.item)
                    androidAutoLoader.item.startHU()
                } else {
                    debug("Error: Loader active but item is null")
                }
            }
            connectionTimer.restart()
        } else {
            debug("Connection attempt already in progress, ignoring")
        }
    }

    function handleDisconnection() {
        debug("Handling disconnection")
        isConnected = false
        videoContainer.visible = false
        currentStatus = "Connection lost. Reconnecting..."
        
        // Cancel existing timers
        if (connectionTimer.running) connectionTimer.stop()
        if (setupTimer.running) setupTimer.stop()
        
        // Reset video retry attempts
        videoContainer.videoSetupAttempts = 0
        
        // Start a clean reconnection attempt
        retryTimer.restart()
    }

    Timer {
        id: connectionTimer
        interval: 20000 // 20 seconds
        repeat: false
        onTriggered: {
            debug("Connection attempt timed out")
            isConnecting = false
            
            if (connectionAttemptCount < maxConnectionAttempts) {
                debug("Auto-retrying connection (attempt " + connectionAttemptCount + " of " + maxConnectionAttempts + ")")
                retryTimer.restart()
            } else {
                debug("Maximum connection attempts reached. Please check your device and try again.")
                currentStatus = "Connection failed. Touch to retry."
                connectionAttemptCount = 0
            }
            
            // As a fallback, if status is still VIDEO_WAITING, try to force start media
            if (androidAutoLoader.item && androidAutoLoader.item.status === 1) {
                debug("Forcing startMedia() call since status is VIDEO_WAITING")
                androidAutoLoader.item.startMedia()
            }
        }
    }

    Timer {
        id: retryTimer
        interval: 5000 // 5 seconds
        repeat: false
        onTriggered: {
            debug("Retry timer triggered")
            attemptConnection()
        }
    }

    Timer {
        id: setupTimer
        interval: 2000 // 2 seconds
        repeat: false
        onTriggered: {
            debug("Setup timer triggered")
            videoContainer.videoSetupAttempts = 0
            videoContainer.setupVideoOutput()
            currentStatus = "Android Auto Connected"
        }
    }

    Timer {
        id: connectionMonitor
        interval: 2000 // Check every 2 seconds
        repeat: true
        running: isConnected
        
        onTriggered: {
            if (isConnected && androidAutoLoader.active && androidAutoLoader.item) {
                // Check if we're still actually connected
                if (androidAutoLoader.item.status === 0) { // NO_CONNECTION
                    debug("Connection monitor detected disconnection")
                    handleDisconnection()
                }
            }
        }
    }

    Rectangle {
        id: statusOverlay
        anchors.fill: parent
        visible: !videoContainer.visible
        color: "#121212"
        Column {
            anchors.centerIn: parent
            spacing: 20
            Text {
                text: currentStatus
                color: "#ffffff"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
            }
            Rectangle {
                width: debugInfo.width + 20
                height: debugInfo.height + 20
                color: "#333333"
                radius: 5
                Text {
                    id: debugInfo
                    anchors.centerIn: parent
                    text: "Loader active: " + androidAutoLoader.active +
                          "\nLoader status: " + androidAutoLoader.status +
                          "\nAA Component: " + (androidAutoLoader.item ? "Available" : "Null") +
                          "\nAA Status: " + (androidAutoLoader.item ? androidAutoLoader.item.status : "Unknown") +
                          "\nConnecting: " + isConnecting +
                          "\nConnected: " + isConnected +
                          "\nVideoOutput visible: " + videoOutput.visible
                    color: "#cccccc"
                    font.pixelSize: 14
                }
            }
            Button {
                text: "Try Connection"
                onClicked: {
                    debug("Manual connection attempt triggered")
                    // Reset connection count for manual attempts
                    connectionAttemptCount = 0
                    attemptConnection()
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!isConnecting) {
                    debug("Status overlay clicked - trying connection")
                    // Reset connection count for manual attempts
                    connectionAttemptCount = 0
                    attemptConnection()
                }
            }
        }
    }

    Item {
        id: videoContainer
        anchors.fill: parent
        visible: false
        
        // Add a retry mechanism specifically for video display
        property int videoSetupAttempts: 0
        property int maxVideoSetupAttempts: 5
        
        // Function to setup video output with proper error handling
        function setupVideoOutput() {
            debug("Setting up video output, attempt " + videoContainer.videoSetupAttempts)
            if (androidAutoLoader.item && androidAutoLoader.item.videoSink) {
                debug("VideoSink available: " + androidAutoLoader.item.videoSink)
                videoOutput.source = androidAutoLoader.item.videoSink
                videoContainer.visible = true
            } else {
                debug("VideoSink not available yet, will retry")
                videoRetryTimer.start()
            }
        }
        
        Timer {
            id: videoRetryTimer
            interval: 1000
            repeat: false
            onTriggered: {
                debug("Video retry timer fired, attempt " + (videoContainer.videoSetupAttempts + 1))
                if (videoContainer.videoSetupAttempts < videoContainer.maxVideoSetupAttempts) {
                    videoContainer.videoSetupAttempts++
                    videoContainer.setupVideoOutput()
                } else {
                    debug("Max video setup attempts reached. Restarting connection...")
                    // Force a full reconnection
                    if (retryTimer.running) retryTimer.stop()
                    retryTimer.start()
                }
            }
        }
        
        Rectangle {
            anchors.fill: parent
            color: "black"
        }
        
        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            visible: true
            
            // Enhanced error and state handling
            onSourceChanged: {
                debug("VideoOutput source changed: " + (source ? "set" : "null"))
                if (source) {
                    debug("Video source type: " + typeof source)
                    // Force refresh of the display
                    videoOutput.visible = false
                    videoOutput.visible = true
                }
            }
            
            onVisibleChanged: {
                debug("VideoOutput visibility changed to: " + visible)
            }

        }
        
        Timer {
            id: videoHealthCheck
            interval: 1000
            repeat: true
            running: videoContainer.visible
            
            onTriggered: {
                if (videoOutput.source && !videoOutput.visible) {
                    debug("Video health check: forcing visible")
                    videoOutput.visible = true
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            enabled: isConnected
            onPressed: {
                debug("Touch pressed at " + mouse.x + ", " + mouse.y)
                if (androidAutoLoader.item) {
                    androidAutoLoader.item.mouseDown(Qt.point(mouse.x, mouse.y))
                }
            }
            onPositionChanged: {
                if (androidAutoLoader.item) {
                    androidAutoLoader.item.mouseMove(Qt.point(mouse.x, mouse.y))
                }
            }
            onReleased: {
                debug("Touch released at " + mouse.x + ", " + mouse.y)
                if (androidAutoLoader.item) {
                    androidAutoLoader.item.mouseUp(Qt.point(mouse.x, mouse.y))
                }
            }
        }
    }

    Loader {
        id: androidAutoLoader
        active: false
        sourceComponent: AndroidAuto {
            id: androidAuto
            Component.onCompleted: {
                debug("AndroidAuto component created")
                startHU()
            }
        onStatusChanged: {
            debug("Status changed to: " + status)
            if (status === 2) { // RUNNING
                debug("Android Auto is now RUNNING")
                active = true
                isConnecting = false
                isConnected = true
                connectionTimer.stop()
                setupTimer.restart()
                
                // Reset connection attempt counter on success
                connectionAttemptCount = 0
                
                // Force start media to ensure video display
                debug("Force starting media from status change")
                start() // Call existing start() method
                
                // Force-show video with slight delay
                videoForceShowTimer.start()
            } else if (status === 1) { // VIDEO_WAITING
                debug("Android Auto is waiting for video")
                currentStatus = "Waiting for video - Check your phone"
                
                // Reset the force video timer attempts
                forceVideoDisplayTimer.attempts = 0
                forceVideoDisplayTimer.start()
            } else if (status === 0) { // NO_CONNECTION
                debug("Android Auto reports NO_CONNECTION")
                if (isConnected) {
                    handleDisconnection()
                }
            }
        }
            onMessage: {
                debug("Message: " + id + " = " + message)
            }
        }
        onLoaded: {
            debug("Loader onLoaded triggered")
            debug("Loaded item: " + item)
        }
        onStatusChanged: {
            debug("Loader status changed to: " + status)
        }
    }

    Component.onCompleted: {
        debug("AndroidAutoModule completed")
        Qt.callLater(function() {
            debug("Starting initial connection attempt")
            attemptConnection()
        })
    }

    Component.onDestruction: {
        debug("AndroidAutoModule being destroyed")
        connectionTimer.stop()
        retryTimer.stop()
        setupTimer.stop()
        if (androidAutoLoader.item) {
            debug("Stopping Android Auto connection")
            androidAutoLoader.item.stopHU()
        }
    }
}