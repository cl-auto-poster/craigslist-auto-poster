#!/bin/bash

# Define variables
TEMP_DIR=$(mktemp -d)
PROFILE_PATH="$HOME"
DROPBOX_URL="https://dl.dropboxusercontent.com/scl/fi/5ql5p4if6fu91208mbcxg/CraigsList_RePoster_darwin.zip?rlkey=lp1arfr2cnslxqrjryc1p08rf&dl=1&raw=1"
ZIP_FILE="$TEMP_DIR/CraigsList_RePoster.zip"
EXTRACT_PATH="$PROFILE_PATH/CraigsList_RePoster"
LOG_FILE="$TEMP_DIR/download_extract_log.txt"
ICON_PATH="$EXTRACT_PATH/assets/img/icons/mac/icon.icns"
SHORTCUT_NAME="CraigsList RePoster"
APP_NAME="CraigsList RePoster.app"
APP_PATH="$HOME/Desktop/$APP_NAME"

# Function to clean up previous installation files
cleanup_previous_installation() {
    [ -f "$LOG_FILE" ] && rm "$LOG_FILE"
    [ -d "$EXTRACT_PATH" ] && rm -rf "$EXTRACT_PATH"
    [ -d "$APP_PATH" ] && rm -rf "$APP_PATH"
    # Ensure the temporary directory is empty
    find "$TEMP_DIR" -mindepth 1 -delete
}

# Display message function
display_message() {
    osascript -e "display dialog \"$1\" buttons {\"OK\"} default button \"OK\""
}

# Download and extract function
download_and_extract() {
    echo "Downloading CraigsList RePoster..."
    if curl -L -o "$ZIP_FILE" "$DROPBOX_URL" 2>&1 | tee -a "$LOG_FILE"; then
        echo "Download complete. Extracting files..."

        mkdir -p "$EXTRACT_PATH"
        if unzip "$ZIP_FILE" -d "$TEMP_DIR" 2>&1 | tee -a "$LOG_FILE"; then
            echo "Extraction complete."
            mv "$TEMP_DIR/CraigsList_RePoster/"* "$EXTRACT_PATH"
        else
            echo "An error occurred during extraction. Check the log file for details: $LOG_FILE"
            cat "$LOG_FILE"
            exit 1
        fi
    else
        echo "An error occurred during download. Check the log file for details: $LOG_FILE"
        cat "$LOG_FILE"
        exit 1
    fi
}

# Check if installation was successful
installation_successful() {
    if [ -f "$EXTRACT_PATH/bin/node" ]; then
        return 0
    else
        echo "Node file not found in expected location: $EXTRACT_PATH/bin/node"
        return 1
    fi
}

# Create launch script function
create_launch_script() {
    mkdir -p "$APP_PATH/Contents/MacOS"
    mkdir -p "$APP_PATH/Contents/Resources"
    echo "APPL????" > "$APP_PATH/Contents/PkgInfo"

    cat << EOF > "$APP_PATH/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$SHORTCUT_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>com.yourcompany.$SHORTCUT_NAME</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleExecutable</key>
    <string>run.sh</string>
    <key>CFBundleIconFile</key>
    <string>icon</string>
</dict>
</plist>
EOF

    cat << EOF > "$APP_PATH/Contents/MacOS/run.sh"
#!/bin/bash
cd "$EXTRACT_PATH"
NODE_ENV=production "$EXTRACT_PATH/bin/node" "$EXTRACT_PATH/node_modules/electron/cli.js" "$EXTRACT_PATH" > /dev/null 2>&1 &
EOF
    chmod +x "$APP_PATH/Contents/MacOS/run.sh"

    # Copy the icon to the application bundle
    if [ -f "$ICON_PATH" ]; then
        cp "$ICON_PATH" "$APP_PATH/Contents/Resources/icon.icns"
    fi

    # Ensure Electron uses the custom icon
    ELECTRON_APP_PATH="$EXTRACT_PATH/node_modules/electron/dist/Electron.app"
    if [ -d "$ELECTRON_APP_PATH" ]; then
        cp "$ICON_PATH" "$ELECTRON_APP_PATH/Contents/Resources/electron.icns"
        plutil -replace CFBundleName -string "$SHORTCUT_NAME" "$ELECTRON_APP_PATH/Contents/Info.plist"
        touch "$ELECTRON_APP_PATH"
    fi

    # Refresh Finder to recognize the new icon
    touch "$APP_PATH"
    # killall Finder
}

# Main script execution
cleanup_previous_installation

display_message "This script will now download and install CraigsList RePoster and create a desktop shortcut for it."

download_and_extract

if installation_successful; then
    create_launch_script
    display_message "CraigsList RePoster is now installed. You can launch it from the desktop shortcut."
else
    display_message "An error occurred during the installation. Node file not found in the expected location."
    cat "$LOG_FILE"
fi

# Exit the script and leave the terminal open
exit 0
