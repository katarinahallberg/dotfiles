#!/bin/sh
plist="$HOME/Library/LaunchAgents/homebrew.mxcl.php54.plist"

echo "Reloading php-fpm..."
launchctl unload $plist
sleep 0.5
launchctl load $plist
