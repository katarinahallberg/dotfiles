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
  "rbenv"
  "rbenv-gem-rehash"
  "rbenv-gemset"
  "ruby-build"
  "ruby-completion"
  "tidy-html5"
  "tmux"
  "tree"
  "unrar"
  "wget"
  "youtube-dl"
)

echo ""
echo "Running Homebrew install script"
echo ""

# Check if we're on Darwin, then check for Homebrew
if [[ "$(uname -s)" == "Darwin" ]] ; then
  if test ! $(which brew) ; then
    echo "  Installing Homebrew for you."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

# Set up taps
if test $(which brew) ; then
  echo "  Checking for anything to tap..."
  for TAP in ${TAPS[@]} ; do
    if ! brew tap | grep -q "^${TAP}\$" ; then
      brew tap $TAP
    fi
  done
fi

# Install packages
if test $(which brew) ; then
  echo "  Checking for packages to install..."
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! brew list -1 | grep -q "^${PACKAGE}\$" ; then
      brew install $PACKAGE
    fi
  done
fi

exit 0
