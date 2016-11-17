#!/usr/bin/env bash
#
# Install pip packages

PIPS=(
  "neovim"
)

echo ""
echo "  √ Running pip3 install script"
echo ""

# Check for rbenv before attempting to install gems
if command -v pip3 >/dev/null 2>&1 ; then
  echo ""
  echo " √ Upgrading pip3"
  echo ""
  pip install --upgrade pip3
  for PIP in ${PIPS[@]} ; do
    pip3 install -U $PIP
  done
else
  echo ""
  echo " ✗ pip3 not found. You may need to install python3 first."
  echo ""
fi

echo ""
echo "  √ Running pip2 install script"
echo ""

# Check for rbenv before attempting to install gems
if command -v pip2 >/dev/null 2>&1 ; then
  echo ""
  echo " √ Upgrading pip2"
  echo ""
  pip install --upgrade pip2
  for PIP in ${PIPS[@]} ; do
    pip2 install -U $PIP
  done
else
  echo ""
  echo " ✗ pip2 not found. You may need to install python-2.7 first."
  echo ""
fi
