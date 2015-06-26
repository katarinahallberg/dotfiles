#!/usr/bin/env bash
#
# Setup required taps and install Homebrew packages

# Continue on errors
set +e

# Set up taps before installing
TAPS=(
  "homebrew/completions"
  "homebrew/dupes"
  "homebrew/php"
  "homebrew/versions"
)

# Packages to install
PACKAGES=(
  "ack"
  "ccat"
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

# Packages to remove
RM_PACKAGES=(
  "archey"
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

# Remove packages
if test $(which brew) ; then
  echo ""
  echo "  Removing packages..."
  echo ""
  for RM_PACKAGE in ${RM_PACKAGES[@]} ; do
    if brew list -1 | grep -q "^${RM_PACKAGE}\$" ; then
      brew uninstall $RM_PACKAGE
    fi
  done
fi

# Resume halt on error
set -e

exit 0
