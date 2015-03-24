# Some nice aliases
alias ll="ls -lh"
alias la="ls -lha"
alias c="clear"
alias x="exit"
alias l="ls -F"
alias df="df -kPh"
alias grep="grep --color"

# Clean up "Open with" menu
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# Nice looking time stamp
alias tstamp="date +%Y%m%d%H%M"

# zsh
alias reload!='. ~/.zshrc'
