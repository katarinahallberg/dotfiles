#!/usr/bin/env bash
#
# Setup required taps and install Homebrew packages using Brewfile

if command -v brew >/dev/null 2>&1 ; then

  # Tap Brewfile and run brew bundle
  if ! echo "brew tap" | grep -q "homebrew/bundle" ; then
    echo ""
    echo "  √ Running Homebrew bundle script"
    echo ""
    brew tap homebrew/bundle
    brew bundle
  fi

fi

exit 0
