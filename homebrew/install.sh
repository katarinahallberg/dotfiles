#!/bin/sh

## Configuration

# Taps to… tap before installing
taps=(
  "homebrew/completions"
  "homebrew/dupes"
  "homebrew/php"
  "homebrew/versions"
)

# Packages to install
packages=(
  "archey"
  "bash-completion"
  "coreutils"
  "editorconfig"
  "gem-completion"
  "git"
  "grc"
  "htop-osx"
  "mysql"
  "nginx"
  "node"
  "php54"
  "python"
  "ruby-completion"
  "tmux"
  "tree"
  "unrar"
  "wget"
  "youtube-dl"
)

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Tap it!
brew tap $(IFS=" "; echo "${taps[*]}")

# Install
brew install $(IFS=" "; echo "${packages[*]}")

exit 0
