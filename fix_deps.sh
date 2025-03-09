#!/bin/bash
# Install all required dependencies for Android Auto

# Update package lists
sudo apt update

# Install libusb and related development files
sudo apt install -y libusb-1.0-0 libusb-1.0-0-dev

# Install GStreamer and related plugins (important for video)
sudo apt install -y \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-qt5 \
    gstreamer1.0-pulseaudio

# Install SSL libraries
sudo apt install -y libssl-dev openssl

# Install Qt and multimedia dependencies
sudo apt install -y \
    qtmultimedia5-dev \
    libqt5multimedia5 \
    libqt5multimedia5-plugins \
    qml-module-qtmultimedia \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-layouts

# Install Bluetooth libraries (for Android Auto's Bluetooth features)
sudo apt install -y bluez libbluetooth-dev

# Install Protobuf (used by Android Auto protocol)
sudo apt install -y protobuf-compiler libprotobuf-dev

# Install ALSA audio libraries
sudo apt install -y libasound2-dev

echo "All dependencies installed. Please reboot your system for changes to take effect."