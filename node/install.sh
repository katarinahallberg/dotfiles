#!/usr/bin/env bash
#
# Node package manager (NPM)

set -e

# Packages to install globally
PACKAGES=(
  "autoprefixer"
  "bower"
  "csscomb"
  "grunt"
  "gulp"
  "http-server"
  "live-server"
  "nodemon"
  "nvm"
  "localtunnel"
)

echo ""
echo "  Running Node install script"

# Check for npm
if test $(which npm) ; then
  echo "  Looks like npm is installed. Checking for packages to install."
  echo ""
  # Install npm packages globally
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! npm -g list | grep -q "${PACKAGE}" ; then
      npm install -g $PACKAGE
    else
      echo "    * ${PACKAGE} already installed."
    fi
  done
fi

exit 0
