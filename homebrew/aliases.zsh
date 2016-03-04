if command -v brew >/dev/null 2>&1 ; then
  alias brews='brew list --versions'
  alias bubu='brew update && brew upgrade --all && brew cleanup'
fi
