#!/usr/bin/env bash
#
# Node package manager (NPM)

set -e

NODE_VERSION="5.11.0"

# Check for nodenv and install if it’s not installed
if [ ! -d $HOME/.nodenv/bin ] ; then
  echo ""
  echo "  √ nodenv not found. Installing now..."
  echo ""
  git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv
  echo ""
  echo "  √ Reloading environment"
  echo ""
  export PATH=$HOME/.nodenv/bin:$PATH
  eval "$(nodenv init -)"
  echo ""
  echo "  √ Installing node-build plugin..."
  echo ""
  git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
  echo ""
  echo "  √ Installing nodenv-update plugin..."
  echo ""
  nodenv install $NODE_VERSION
  echo ""
  echo "  √ Setting global Node version to $NODE_VERSION"
  echo ""
  nodenv global $NODE_VERSION
  git clone https://github.com/nodenv/nodenv-update.git $HOME/.nodenv/plugins/nodenv-update
  echo ""
  echo "  √ Installing node version $NODE_VERSION..."
else
  echo ""
  echo "  √ Looks like nodenv is installed. Awesome!"
  echo ""
fi

# Cache list of already installed global packages
if command -v npm >/dev/null 2>&1 ; then
  INSTALLED_PACKAGES=( $(find `npm root -g` -type d -maxdepth 1 -not -path '*/\.*' -print0 | while IFS= read -r -d '' dirname; do echo ${dirname##*/}; done) )
fi

# Packages to install globally
PACKAGES=(
  "autoprefixer"
  "bower"
  "csscomb"
  "eslint"
  "grunt"
  "gulp"
  "http-server"
  "live-server"
  "localtunnel"
  "nodemon"
  "npm-check-updates"
  "nvm"
  "svgo"
)

echo "  √ Running Node install script"
echo ""

# Check for npm if we’re on OS X
if [[ "$(uname -s)" == "Darwin" ]] ; then
  if command -v npm >/dev/null 2>&1 ; then
    echo "  √ Looks like npm is installed. Checking for packages to install."
    # Install npm packages globally
    for PACKAGE in ${PACKAGES[@]} ; do
      if ! echo ${INSTALLED_PACKAGES[@]} | grep -q "${PACKAGE}" ; then
        npm install -g $PACKAGE
      fi
    done
  else
    echo "  ✗ npm is not installed. Skipping..."
  fi
fi

exit 0
