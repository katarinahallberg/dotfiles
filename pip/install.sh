# Install pygments and then set the ccat alias

set -e

echo ""
echo "Running pip install script"
echo ""

if [ -x "$(command -v pip)" ]; then

  #Install Pygments (or try upgrade if it is already installed)
  if [ -x "$(command -v pygmentize)" ]; then
    pip install -q --upgrade Pygments
  else
    pip install Pygments
  fi

fi
