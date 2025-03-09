#!/bin/bash
# Create a udev rule for Android Auto USB access
# Save this file as 99-android-auto.rules in /etc/udev/rules.d/

# Create the rules file
cat << 'EOF' | sudo tee /etc/udev/rules.d/99-android-auto.rules
# Rules for Android Auto devices
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d00", MODE="0666", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="2d01", MODE="0666", GROUP="plugdev"
# Add rules for your specific Android device here
# Use 'lsusb' to find your device's vendor and product IDs
# SUBSYSTEM=="usb", ATTR{idVendor}=="XXXX", ATTR{idProduct}=="YYYY", MODE="0666", GROUP="plugdev"
EOF

# Reload udev rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Make sure the current user is in the plugdev group
if ! groups | grep -q plugdev; then
    echo "Adding user to plugdev group"
    sudo usermod -a -G plugdev $USER
    echo "You may need to log out and back in for group changes to take effect"
fi

echo "USB permissions set up. Try reconnecting your device."