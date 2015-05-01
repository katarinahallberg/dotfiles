#!/usr/bin/env bash
#
# Setup required taps and install Homebrew packages

set -e

# Set up taps before installing
TAPS=(
  "homebrew/completions"
  "homebrew/dupes"
  "homebrew/php"
  "homebrew/versions"
)

# Packages to install
PACKAGES=(
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
  "tidy-html5"
  "tmux"
  "tree"
  "unrar"
  "wget"
  "youtube-dl"
)

# Check for Homebrew
if uname | grep -q "Darwin" ; then
  if test ! $(which brew) ; then
    echo "  Installing Homebrew for you."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

# Tap the taps (unless we already have them tapped)
echo "Checking for any taps to tap..."
for TAP in ${TAPS[@]} ; do
  if ! brew tap | grep -q "^${TAPS}\$" ; then
    brew tap $TAP
  fi
done

# Install if packages are not already installed
echo "Checking for packages to install..."
for PACKAGE in ${PACKAGES[@]} ; do
  if ! brew list -1 | grep -q "^${PACKAGE}\$" ; then
    brew install $PACKAGE
  fi
done

exit 0
