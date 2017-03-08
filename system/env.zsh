# Nano as default editor if installed
if [ -x "$(command -v nano)" ] ; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi
