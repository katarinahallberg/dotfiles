# Darwin only aliases
if uname | grep -q "Darwin" ; then
  alias ls='ls -GF'
  alias l='ls -GF'
  alias df="gdf -H"
fi

# Linux only aliases
if uname | grep -q "Linux" ; then
  alias ls='ls --color -F'
  alias l='ls --color -F'
fi

# Some nice aliases
alias ll='ls -lh'
alias la='ls -lha'
alias c='clear'
alias x='exit'
alias df='gdf -H'
alias grep='grep --color'

# Clean up 'Open with…' menu
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Nice looking time stamp
alias tstamp='date +%Y%m%d%H%M'

# zsh
alias reload!='. ~/.zshrc'
