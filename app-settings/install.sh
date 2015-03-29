#!/bin/sh
#
# Synchronize selected settings from ~/Library/Preferences
#

src="$HOME/Library/Preferences"
dest="."

params=(
  --include='*/'
  # Include files listed here
  --include-from='includes.conf'
  # Exclude the rest
  --exclude='*'
)

rsync -avm "${params[@]}" "$src"/* "$dest"

