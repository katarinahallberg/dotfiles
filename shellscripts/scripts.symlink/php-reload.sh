#!/bin/sh
echo "Reloading php-fpm..."
launchctl stop homebrew-php.josegonzalez.php54
sleep 0.5
launchctl load ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist
