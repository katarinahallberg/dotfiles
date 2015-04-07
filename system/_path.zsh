# Check if we've got Homebrew before setting $PATH
if [ -x "$(command -v brew)" ]; then
  export PATH="$HOME/.rvm/bin:/usr/local/bin:/usr/local/sbin:$HOME/Scripts:/usr/local/share/npm/bin:$(brew --prefix homebrew/php/php54)/bin:$PATH"
else
  export PATH="$HOME/.rvm/bin:/usr/local/bin:/usr/local/sbin:$HOME/Scripts:/usr/local/share/npm/bin:/bin:$PATH"
fi

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
