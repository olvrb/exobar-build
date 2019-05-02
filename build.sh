#!/bin/bash

# Package name from control, replacing all spaces with _
PACKAGE_NAME=$(cat control | grep -oP "(?<=Name: ).*")
PACKAGE_NAME=${PACKAGE_NAME// /_}

# Create a temp dir for us to use
EXO_TMP_DIR=$(mktemp -d)

# Dir path where we should place all files from src/
EXO_FILES_DIR="$EXO_TMP_DIR/Library/Exobar/$PACKAGE_NAME"

# Dir path where we should place our control file
EXO_DEBIAN_DIR="$EXO_TMP_DIR/DEBIAN"

# Filepath which will be our final .deb package
EXO_BUILD_PATH="$EXO_TMP_DIR.deb"

# Get the filename for later
EXO_BUILD_NAME="$(basename -- "$EXO_BUILD_PATH")"

# SSH connection string (root@192.168.1.2)
CONNECTION_STRING="$EXO_DEVICE_USER@$EXO_DEVICE_IP"

# Create directory and copy our files from src/ to the tmp dir
mkdir -p $EXO_FILES_DIR
cp -r src/* $EXO_FILES_DIR

# Create directory, change to correct permissions and place our control file in DEBIAN/
mkdir $EXO_DEBIAN_DIR
cp control $EXO_DEBIAN_DIR
chmod 0775 -R $EXO_DEBIAN_DIR

# Actually build debian package
dpkg -b $EXO_TMP_DIR

# Make dir if not exists
mkdir -p build

# Move our tmp build file to build/
mv $EXO_BUILD_PATH build/

# Cleanup
rm $EXO_TMP_DIR -r

# Copy file to device and finally install it
scp build/$EXO_BUILD_NAME $CONNECTION_STRING:/tmp/$EXO_BUILD_NAME
ssh -t $CONNECTION_STRING dpkg -i /tmp/$EXO_BUILD_NAME