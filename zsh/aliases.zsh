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

  # Clean up "Open with…" menu
  alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

  # Start OS X screensaver
  alias screensaver-launch="open /System/Library/Frameworks/ScreenSaver.framework/Versions/Current/Resources/ScreenSaverEngine.app"

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

# Default to neovim (if installed)
if command -v nvim >/dev/null 2>&1 ; then
  alias vim="nvim"
fi

# Nice looking time stamp
alias tstamp="date +%Y%m%d%H%M"

# zsh
alias reload!=". ~/.zshrc"
