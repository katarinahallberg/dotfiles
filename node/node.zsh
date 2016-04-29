# Node environment config
if [[ "$(uname -s)" == "Darwin" ]] ; then
  export NODE_PATH="/usr/local/lib/node"
elif [[ "$(uname -s)" == "Linux" ]] ; then
  export NODE_PATH="/usr/bin/node"
fi

# nodenv
if [ -d $HOME/.nodenv/bin ] ; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi
