# Node environment config
if [[ "$(uname -s)" == "Darwin" ]] ; then
  export NODE_PATH="/usr/local/lib/node"
elif [[ "$(uname -s)" == "Linux" ]] ; then
  export NODE_PATH="/usr/bin/node"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
