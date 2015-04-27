#!/bin/sh
#
# Synchronize selected settings from ~/Library/Preferences
#

app_settings="$HOME/.dotfiles/app-settings"

src="$HOME/Library/Preferences"
dest="${app_settings}"

params=(
  --include="*/"
  # Include files listed here
  --include-from="${app_settings}/includes.conf"
  # Exclude the rest
  --exclude="*"
)

rsync -avm "${params[@]}" "$src"/* "$dest"

