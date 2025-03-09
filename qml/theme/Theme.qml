import QtQuick 2.12

QtObject {
    id: root
    
    // Theme settings
    property bool darkMode: true
    
    // Colors
    property color primaryColor: darkMode ? "#222222" : "#ffffff"
    property color secondaryColor: darkMode ? "#333333" : "#f5f5f5"
    property color accentColor: "#03A9F4"  // Blue accent color
    property color backgroundColor: darkMode ? "#121212" : "#fafafa"
    property color textColor: darkMode ? "#ffffff" : "#212121"
    property color secondaryTextColor: darkMode ? "#b0b0b0" : "#757575"
    
    // Fonts
    property int normalFontSize: 14
    property int titleFontSize: 20
    property int headerFontSize: 24
    property string fontFamily: "Roboto"
    
    // Spacing
    property int smallSpacing: 4
    property int mediumSpacing: 8
    property int largeSpacing: 16
    
    // Border
    property int borderWidth: 1
    property color borderColor: darkMode ? "#444444" : "#e0e0e0"
    property int cornerRadius: 4
}