#!/usr/bin/env bash
#
# Setup rbenv and install some nice gems globally

set -e

# Version to install with rbenv
RUBY_VERSION="2.3.0"

# Gems to install
GEMS=(
  "bundler"
  "jekyll"
  "jekyll-paginate"
  "tmuxinator"
)

echo ""
echo "  √ Running Ruby install script"
echo ""

if ! command -v rbenv >/dev/null 2>&1 ; then
  if [[ "$(uname -s)" == "Darwin" ]] ; then
    echo "  √ Installing rbenv for you."
    brew install rbenv > /tmp/rbenv-install.log
  fi
fi

if ! command -v ruby-build >/dev/null 2>&1 ; then
  if [[ "$(uname -s)" == "Darwin" ]] ; then
    echo "  √ Installing ruby-build and rbenv-gem-rehash for you."
    brew install ruby-build > /tmp/ruby-build-install.log
    brew install rbenv-gem-rehash > /tmp/rbenv-gem-rehash-install.log
  fi
fi

# Check for rbenv before attempting to install gems
if command -v rbenv >/dev/null 2>&1 ; then
  # Check if our selected version of Ruby is installed
  if ! [[ $(rbenv global) == ${RUBY_VERSION} ]] ; then
    echo "  √ Installing Ruby for you."
    rbenv install ${RUBY_VERSION}
    rbenv global ${RUBY_VERSION}
  fi
  echo "  √ Updating your environment. (gem update --system)"
  eval "$(rbenv init -)"
  gem update --system
  echo ""
  echo "  √ Checking for gems to install."
  echo ""
  for GEM in ${GEMS[@]} ; do
    if [[ "$(gem list ${GEM} -i)" == "false" ]] ; then
      gem install $GEM
    fi
  done
fi
