# Node environment config
case "$OSTYPE" in
  *darwin*)
    export NODE_PATH="/usr/local/lib/node"
    ;;
  *linux*)
    export NODE_PATH="/usr/bin/node"
    ;;
esac

# nodenv
if [ -d $HOME/.nodenv/bin ] ; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi
