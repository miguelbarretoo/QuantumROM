#!/bin/bash

download_firmware() {
    if [ "$#" -ne 4 ]; then
        echo "Usage: download_firmware MODEL CSC IMEI DOWNLOAD_DIRECTORY"
        return 1
    fi

    local MODEL=$1
    local CSC=$2
    local IMEI=$3
    local DOWN_DIR="${4}/$MODEL"

    mkdir -p "$DOWN_DIR"

    echo "======================================"
    echo " Samsung FW Downloader "
    echo "======================================"
    echo "MODEL: $MODEL | CSC: $CSC"
    echo "Fetching latest firmware..."
    echo

    # --- Step 1: Check Update ---
    version=$(python3 -m samloader -m "$MODEL" -r "$CSC" -i "$IMEI" checkupdate 2>&1)
    if [ $? -ne 0 ] || [ -z "$version" ]; then
        echo "❌ MODEL/CSC/IMEI not valid or no update found."
        echo "Error: $version"
        return 1
    else
        echo "✅ Update found: $version"
    fi

    # --- Step 2: Download Firmware ---
    python3 -m samloader -m "$MODEL" -r "$CSC" -i "$IMEI" download -v "$version" -O "$DOWN_DIR"
    if [ $? -ne 0 ]; then
        echo "❌ Download failed. Check IMEI/MODEL/CSC."
        return 1
    fi

    # --- Step 3: Decrypt Firmware ---
    enc_file=$(find "$DOWN_DIR" -name "*.enc*" | head -n 1)

    if [ -z "$enc_file" ]; then
        echo "❌ No encrypted firmware file found!"
        return 1
    fi

    python3 -m samloader -m "$MODEL" -r "$CSC" -i "$IMEI" decrypt \
        -v "$version" \
        -i "$enc_file" \
        -o "${DOWN_DIR}/${MODEL}.zip" >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "❌ Decryption failed."
        return 1
    fi

    # --- Show Firmware Info ---
    file_size=$(du -m "${DOWN_DIR}/${MODEL}.zip" | cut -f1)
    echo
    echo "✅ Firmware decrypted successfully!"
    echo "Firmware Size: ${file_size} MB"
    echo "Saved to: ${DOWN_DIR}/${MODEL}.zip"

    # --- Cleanup ---
    rm -f "$enc_file"
}
