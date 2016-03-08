#!/usr/bin/env bash
#
# Node package manager (NPM)

set -e

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

echo ""
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
