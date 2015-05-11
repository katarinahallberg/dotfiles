#!/usr/bin/env bash
#
# Setup rebenv and install some nice gems globally

set -e

RUBY_VERSION="2.2.2"

GEMS=(
  "bundler"
  "jekyll"
  "tmuxinator"
)

if ! $(command -v rbenv >/dev/null 2>&1) ; then
  echo "  Installing rbenv for you."
  if [[ "$(uname -s)" == "Darwin" ]] ; then
    brew install rbenv > /tmp/rbenv-install.log
  fi
fi

if ! $(command -v ruby-build >/dev/null 2>&1) ; then
  echo "  Installing ruby-build and rbenv-gem-rehash for you."
  if [[ "$(uname -s)" == "Darwin" ]] ; then
    brew install ruby-build > /tmp/ruby-build-install.log
    brew install rbenv-gem-rehash > /tmp/rbenv-gem-rehash-install.log
  fi
fi

# Check for rbenv before attempting to install gems
if $(command -v rbenv >/dev/null 2>&1) ; then
  # Check if our selected version of Ruby is installed
  if ! [[ $(rbenv global) == ${RUBY_VERSION} ]] ; then
    echo " Installing Ruby for you."
    rbenv install ${RUBY_VERSION}
    rbenv global ${RUBY_VERSION}
    echo "  Reloading the shell..."
    exec $SHELL -l
    gem update --system
  fi
  echo "  Checking for gems to install."
  for GEM in ${GEMS[@]} ; do
    if ! gem list | grep -q "${GEM}" ; then
      gem install $GEM
    fi
  done
fi
