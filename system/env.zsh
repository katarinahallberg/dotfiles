# NeoVim as default editor if installed
if [ -x "$(command -v nvim)" ] ; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
