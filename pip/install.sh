# Install pygments and then set the ccat alias
if [ -x "$(command -v pip)" ]; then

  #Install Pygments (or try upgrade if it is already installed)
  if [ -x "$(command -v pygmentize)" ]; then
    pip install --upgrade Pygments
  else
    pip install Pygments
  fi


  # Alias ccat if Pygments was successfully installed
  if [ -x "$(command -v pygmentize)" ]; then
    alias ccat="pygmentize -g"
  fi

fi
