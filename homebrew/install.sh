#!/bin/sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Taps to… tap before installing
taps=(
  homebrew/completions
  homebrew/dupes
  homebrew/php
  homebrew/versions
)

# Tap it!
brew tap $(IFS=" "; echo "${taps[*]}")

# Packages to install
packages=(
  "archey"
  "bash-completion"
  "coreutils"
  "gem-completion"
  "git"
  "grc"
  "htop-osx"
  "mysql"
  "nginx"
  "node"
  "php54"
  "ruby-completion"
  "tmux"
  "tree"
  "unrar"
  "wget"
  "youtube-dl"
)

# Install
brew install $(IFS=" "; echo "${packages[*]}")

exit 0
