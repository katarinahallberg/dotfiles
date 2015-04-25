#!/bin/sh
#
# Node package manager (NPM)
#

# Check for npm
if test $(which npm)
then
  # Install npm packages globally
  npm install $(IFS=" "; echo "${packages[*]}")
else
  echo "Sorry! You need to install node first."
  exit 1
fi

# Packages to install
Packages=(
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

exit 0
