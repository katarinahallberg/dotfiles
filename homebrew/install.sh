#!/usr/bin/env bash
#
# Setup required taps and install Homebrew packages

# Continue on errors
set +e

# Cache list of already installed eackages
INSTALLED_PACKAGES=( $(brew list -1) )

# Cache taps as well
TAPPED_TAPS=( $(brew tap) )

# Set up taps before installing
TAPS=(
  "homebrew/completions"
  "homebrew/dupes"
  "homebrew/php"
  "homebrew/versions"
  "yudai/gotty"
)

# Packages to install
PACKAGES=(
  "ack"
  "ccat"
  "coreutils"
  "editorconfig"
  "gem-completion"
  "git"
  "gotty"
  "grc"
  "htop-osx"
  "imagemagick"
  "macvim"
  "mysql"
  "nginx"
  "node"
  "php56"
  "php56-mcrypt"
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
  "zsh"
)

# Packages to remove
RM_PACKAGES=(
  "the_silver_searcher"
)

# TOD vim and macvim needs these as flags: " --with-lua --without-python --with-python3"

# Apps to link to /Applications
LINK_APPS=(
  "macvim"
)

echo ""
echo "  √ Running Homebrew install script"

# Check if we're on Darwin, then check for Homebrew
if [[ "$(uname -s)" == "Darwin" ]] ; then
  if ! command -v brew >/dev/null 2>&1 ; then
    echo "  Installing Homebrew for you."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

# Set up taps
if command -v brew >/dev/null 2>&1 ; then
  echo ""
  echo "  √ Checking for anything to tap..."
  for TAP in ${TAPS[@]} ; do
    if ! echo "${TAPPED_TAPS[@]}" | grep -q "${TAP}" ; then
      brew tap $TAP
    fi
  done
fi

# Remove packages (do this before attempting to install to prevent conflicts)
if command -v brew >/dev/null 2>&1 ; then
  echo ""
  echo "  √ Removing packages..."
  for RM_PACKAGE in ${RM_PACKAGES[@]} ; do
    if echo "${INSTALLED_PACKAGES[@]}" | grep -q "${RM_PACKAGE}" ; then
      brew uninstall $RM_PACKAGE
    fi
  done
fi

# Install packages
if command -v brew >/dev/null 2>&1 ; then
  echo ""
  echo "  √ Installing packages..."
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! echo "${INSTALLED_PACKAGES[@]}" | grep -q "${PACKAGE}" ; then
      brew install $PACKAGE
    fi
  done
fi

# Link apps to /Applications
if command -v brew >/dev/null 2>&1 ; then
  echo ""
  echo "  √ Linking relevant apps to /Applications"
  echo ""
  for LINK_APP in ${LINK_APPS[@]} ; do
    echo "    * Linking $LINK_APP"
  done
fi

# Resume halt on error
set -e

exit 0
