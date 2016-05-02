if [ -d $HOME/.rbenv/bin ] ; then
  export PATH=$HOME/.rbenv/bin
fi

if [ -d $HOME/.rbenv/shims ] ; then
  export PATH=$HOME/.rbenv/shims
fi

# init according to man page
if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi
