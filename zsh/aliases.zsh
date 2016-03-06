# Darwin only aliases
#
if [[ "$(uname -s)" == "Darwin" ]] ; then

  # System utils
  alias ls="ls -GF"
  alias l="ls -GF"
  alias df="gdf -H"

  # Colored cat
  if command -v ccat >/dev/null 2>&1 ; then
    alias cat="ccat"
  fi

fi

# Linux only aliases
#
if [[ "$(uname -s)" == "Linux" ]] ; then

  # System utils
  alias ls="ls --color -F"
  alias l="ls --color -F"
  alias df="df -H"

fi

# General aliases
#

# Some nice aliases
alias ll="ls -lh"
alias la="ls -lha"
alias c="clear"
alias x="exit"
alias grep="grep --color"

# Colorize tree if it’s installed
if command -v tree >/dev/null 2>&1 ; then
  alias tree="tree -C"
fi

# Nice looking time stamp
alias tstamp="date +%Y%m%d%H%M"

# zsh
alias reload!=". ~/.zshrc"
