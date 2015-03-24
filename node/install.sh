#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for npm
if test $(which npm)
then
  # Install npm packages globally
  npm install -g autoprefixer bower csscomb grunt http-server live-server nodemon nvm
else
  echo "Sorry! You need to install node first."
  exit 1
fi

exit 0
