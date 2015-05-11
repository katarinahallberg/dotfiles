#!/usr/bin/env bash
#
# Node package manager (NPM)

set -e

# Packages to install
PACKAGES=(
  "autoprefixer"
  "bower"
  "csscomb"
  "grunt"
  "http-server"
  "live-server"
  "nodemon"
  "nvm"
  "localtunnel"
)

echo ""
echo "Running Node install script"
echo ""

# Check for npm
if test $(which npm) ; then
  echo "  Looks like npm is installed. Checking for packages to install."
  # Install npm packages globally
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! npm -g list | grep -q "${PACKAGE}" ; then
      npm install -g $PACKAGE
    fi
  done
fi

exit 0
