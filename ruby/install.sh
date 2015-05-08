#!/usr/bin/env bash
#
# Setup rebenv and install some nice gems globally

GEMS=(
  "bundler"
  "jekyll"
  "tmuxinator"
)

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  brew install rbenv > /tmp/rbenv-install.log
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-build and rbenv-gem-rehash for you."
  brew install ruby-build > /tmp/ruby-build-install.log
  brew install rbenv-gem-rehash > /tmp/rbenv-gem-rehash-install.log
fi

# Check for rbenv before attempting to install gems
if $(command -v rbenv) ; then
  echo "Checking for gems to install"
  for GEM in ${GEMS[@]} ; do
    if ! gem list | grep -q "${GEM}" ; then
      gem install $GEM
    fi
  done
fi
