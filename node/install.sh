#!/usr/bin/env bash
#
# Node package manager (NPM)

set -e

# Cache already installed global packages
INSTALLED_PACKAGES=( $(find `npm root -g` -type d -maxdepth 1 -not -path '*/\.*' -print0 | while IFS= read -r -d '' dirname; do echo ${dirname##*/}; done) )

# Packages to install globally
PACKAGES=(
  "autoprefixer"
  "bower"
  "csscomb"
  "grunt"
  "gulp"
  "http-server"
  "live-server"
  "localtunnel"
  "nodemon"
  "nvm"
)

echo ""
echo "  Running Node install script"

# Check for npm
if command -v npm >/dev/null 2>&1 ; then
  echo "  Looks like npm is installed. Checking for packages to install."
  echo ""
  # Install npm packages globally
  for PACKAGE in ${PACKAGES[@]} ; do
    if ! echo ${INSTALLED_PACKAGES[@]} | grep -q "${PACKAGE}" ; then
      npm install -g $PACKAGE
    else
      echo "    * ${PACKAGE} already installed."
    fi
  done
fi

exit 0
