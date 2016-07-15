#!/bin/sh

# Turn off spotlight
sudo mdutil -a -i off

# Unload it
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# Load It:
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# Turn on spotlight again:
sudo mdutil -a -i on
