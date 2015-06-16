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
  "imagemagick"
  "macvim"
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
  "vim"
  "wget"
  "youtube-dl"
)

# TOD vim and macvim needs these as flags: " --with-lua --without-python --with-python3"

# Apps to link to /Applications
LINK_APPS=(
  "macvim"
)

echo ""
echo "  Running Homebrew install script"
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
  echo ""
  echo "  Checking for anything to tap..."
  echo ""
  for TAP in ${TAPS[@]} ; do
    if ! brew tap | grep -q "^${TAP}\$" ; then
      brew tap $TAP
    else
      echo "    * ${TAP} already tapped."
    fi
  done
fi

# Install packages
if test $(which brew) ; then
  echo ""
  echo "  Installing packages..."
  echo ""
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! brew list -1 | grep -q "^${PACKAGE}\$" ; then
      brew install $PACKAGE
    else
      echo "    * ${PACKAGE} already installed."
    fi
  done
fi

# Link apps to /Applications
if test $(which brew) ; then
  echo ""
  echo "  Checking if any apps should be linked to /Applications"
  echo ""
  for LINK_APP in ${LINK_APPS[@]} ; do
    echo brew linkapps $LINK_APP
  done
fi

exit 0
