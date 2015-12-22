#!/usr/bin/env bash
#
# Setup required taps and install Homebrew packages using Brewfile

if command -v brew >/dev/null 2>&1 ; then

  # Tap Brewfile
  if ! brew tap | grep -q "homebrew/bundle" ; then
    echo ""
    echo "  √ Running Homebrew bundle script"
    echo ""
    brew tap homebrew/bundle
  fi

  # Install from Brewfile
  brew bundle

fi

exit 0
