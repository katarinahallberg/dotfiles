#!/bin/sh
#
# Node package manager (NPM)
#

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

# Check for npm
if test $(which npm)
then
  # Install npm packages globally
  npm install -g $(IFS=" "; echo "${packages[*]}")
else
  echo "Sorry! You need to install node first."
  exit 1
fi

exit 0
